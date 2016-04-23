module IRGen (ir_gen) where

import AST
import IR
import SymbolTable
import SymbolTypes
import ErrM

{-Populate the symbol table st with program declarations
Returns a symbol table that has all program declarations
Returns the number of delcared variables
Returns the number of declared arguments
Returns array descriptions (although arrays are not implemented)
Fails if any of the declarations are valid or are duplicated
-}

collect_decls :: [M_decl]->ST->Err (ST,Int,Int,[(Int,[I_expr])])
collect_decls [] st = Ok (st,numV,numA,[]) where
  (_,numV,numA,_,_) = get_level st
collect_decls (d:ds) st = case d of
  (M_var(name,ex,t)) -> case s_insert (VARIABLE(name,t,length ex)) st of
    Ok st' -> case collect_decls ds st' of
      Ok(t2,numV,numA,adims) -> case ir_exprs ex st of
        Ok ie -> Ok (t2,numV,numA,adims)
      Bad e -> Bad e
    Bad e -> Bad ("Error in variable declaration " ++ show (M_var(name,ex,t)))
  (M_fun(name,as,p,ps,ss)) -> case s_insert (FUNCTION(name,as',p)) st of
    Ok st' -> collect_decls ds (snd $ delete_scope st')
    Bad e -> Bad ("Error in function declaration " ++ show (M_fun(name,as,p,ps,ss)))
    where
      as' = (map(\(_,i,st) -> (st,i)) as)

collect_arguments :: [(String,Int,M_type)]->ST-> Err ST
collect_arguments [] st = Ok st
collect_arguments ((s,i,t):as) st = case s_insert(ARGUMENT (s,t,i)) st of
  Ok st' -> collect_arguments as st'
  Bad e -> Bad e

ir_gen :: M_prog -> Err I_prog
ir_gen (M_prog(ds,ss)) = case (collect_decls ds empty) of
  Ok(t1,numV,numA,dims) -> case ir_stmts ss t1 of
    Ok i_stmt -> case ir_funs ds t1 of
      Ok fb -> Ok $ IPROG (fb,numV,dims,i_stmt)
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e


ir_stmts :: [M_stmt]->ST-> Err [I_stmt]
ir_stmts [] _ = Ok []
ir_stmts (s:ss) st = case check_stmt s st of
  Ok _ -> case ir_stmt s st of
    Ok i -> case ir_stmts ss st of
      Ok rest -> Ok(i:rest)
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e

ir_stmt :: M_stmt -> ST -> Err I_stmt
ir_stmt (M_ass (ident,e,es)) st = case s_lookup ident st of
  Ok(I_VARIABLE (l,o,p,d)) -> case ir_exprs e st of
    Ok is -> case ir_expr es st of
      Ok i -> Ok $ IASS ((get_currentlevel st)-l,o,is,i)
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e
ir_stmt (M_while (guard,loop)) st = case ir_expr guard st of
  Ok guardb -> case ir_stmt loop st of
    Ok loopb -> Ok $ IWHILE(guardb,loopb)
    Bad e -> Bad e
  Bad e -> Bad e
ir_stmt (M_cond (cond,e1,e2)) st = case ir_expr cond st of
  Ok condb -> case ir_stmt e1 st of
    Ok se1 -> case ir_stmt e2 st of
      Ok se2 -> Ok $ ICOND (condb,se1,se2)
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e
ir_stmt (M_read(v,e)) st = case s_lookup v st of
  Ok(I_VARIABLE(l,o,p,d)) -> case ir_exprs e st of
    Ok is -> case (p,d-length is) of
      (M_int, 0) -> Ok $ IREAD_I $ ((get_currentlevel st)-l,o,is)
      (M_real,0) -> Ok $ IREAD_F $ ((get_currentlevel st)-l,o,is)
      (M_bool,0) -> Ok $ IREAD_B $ ((get_currentlevel st)-l,o,is)
      _          -> error "Type checkng error"
    Bad e -> Bad e
  Bad e -> Bad e
ir_stmt (M_print e) st = case ir_expr e st of
  Ok i -> case type_expr e st of
    Ok(M_int,0) -> Ok $ IPRINT_I $ i
    Ok(M_real,0) -> Ok $ IPRINT_F $ i
    Ok(M_bool,0) -> Ok $ IPRINT_B $ i
    _            -> error "Type checking error"
  Bad e -> Bad e
ir_stmt (M_return e) st = case ir_expr e st of
  Ok i -> Ok $ IRETURN i
  Bad e -> Bad e
ir_stmt (M_block (ds,ss)) st = case collect_decls ds (up_blkscope st) of
  Ok(t1,numV,_,as) -> case ir_funs ds t1 of
    Ok bs -> case ir_stmts ss t1 of
      Ok block -> Ok $ IBLOCK (bs,numV,as,block)
    Bad e -> Bad e
  Bad e -> Bad e


ir_funs :: [M_decl]->ST-> Err [I_fbody]
ir_funs []_ = Ok []
ir_funs (f:fs) st =case f of
  (M_var _) -> ir_funs fs st
  (M_fun f) -> case ir_fun (M_fun f) st of
    Ok fb -> case ir_funs fs st of
      Ok rest -> Ok(fb:rest)
      Bad e -> Bad e
    Bad e -> Bad e

ir_fun :: M_decl -> ST -> Err I_fbody
ir_fun (M_fun (s,as,t,ds,ss)) st = case s_lookup s st of
  Ok(I_FUNCTION(l,b,_,_)) -> case collect_arguments as st' of
    Ok s1 -> case collect_decls ds s1 of
      Ok(s2,numV,numA,dims) -> case ir_stmts ss s2 of
        Ok is -> case ir_funs ds s2 of
          Ok f -> Ok $ IFUN (b,f,numV,numA,dims,is)
          Bad e -> Bad e
        Bad e -> Bad e
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e
  _ -> Bad ("Undefined function " ++ show (M_fun(s,as,t,ds,ss)))
  where st' = up_funscope st t

ir_expr :: M_expr -> ST -> Err I_expr
ir_expr (M_ival i ) st = Ok $ IINT i
ir_expr (M_rval r ) st = Ok $ IREAL r
ir_expr (M_bval b ) st = Ok $ IBOOL b
ir_expr (M_size (s,n)) st = case s_lookup s st of
  Ok (I_VARIABLE(l,o,p,d)) -> Ok $ ISIZE((get_currentlevel st)-l,o,d)
  Bad e -> Bad e
  _     -> Bad ("Undefined " ++ show (M_size(s,n)))
ir_expr(M_id (name,ex)) st = case s_lookup name st of
  Ok (I_VARIABLE(l,o,p,d)) -> case ir_exprs ex st of
    Ok is -> if d == (length is) then --check if same dims
                Ok $IID ((get_currentlevel st)-l,o,is)
            else Bad ("Array length does not match declaration " ++ show (M_id(name,ex)))
  Bad e -> Bad e
  _     -> Bad ("ID is undefined " ++ show (M_id(name,ex)))
ir_expr (M_app(op,ex)) st = case type_exprs ex st of
  Ok ts -> case type_op op ts st of
    Ok p -> case ir_opn op p st of
      Ok i -> case ir_exprs ex st of
        Ok is -> Ok $IAPP (i,is)
        Bad e -> Bad e
      Bad e -> Bad e
    Bad e -> error "Type checking error"
  Bad e -> error "Type checking error"



ir_exprs :: [M_expr]->ST-> Err [I_expr]
ir_exprs []_ = Ok []
ir_exprs (e:es) st = case check_expr e st of
  Ok _ -> case ir_expr e st of
    Ok i -> case ir_exprs es st of
      Ok rest -> Ok(i:rest)
      Bad e -> Bad e
    Bad e -> Bad e
  Bad e -> Bad e

ir_opn (M_fn name) _ st = case s_lookup name st of
  Ok (I_FUNCTION(l,b,_,_)) -> Ok $ ICALL (b,(get_currentlevel st)-l)
  _                       -> Bad ("Undefined operation " ++ show (M_fn (name)))
--errror here
ir_opn op p st = Ok opn where
  opn = case op of
    M_add -> if p == M_real then IADD_F else IADD
    M_sub -> if p == M_real then ISUB_F else ISUB
    M_mul -> if p == M_real then IMUL_F else IMUL
    M_div -> if p == M_real then IDIV_F else IDIV
    M_neg -> if p == M_real then INEG_F else INEG
    M_lt -> if p == M_real then ILT_F else ILT
    M_gt -> if p == M_real then IGT_F else IGT
    M_ge -> if p == M_real then IGE_F else IGE
    M_le -> if p == M_real then ILE_F else ILE
    M_eq -> if p == M_real then IEQ_F else IEQ
    M_not -> INOT
    M_and -> IAND
    M_or -> IOR
    M_float -> IFLOAT
    M_floor -> IFLOOR
    M_ceil -> ICEIL

{- Test to see if the statments of the program are valid icluding checking of any additional declarations and type checking.
-All local vars are defined before they are used
-All local vars have the correct typing
-All operations are applied to the correct types and dumber of arguments
-Any return statements match the return type of the current scope level -}

check_stmt :: M_stmt->ST->Err Bool
check_stmt (M_ass (name, e1,e2)) st = case s_lookup name st of
  Ok(I_VARIABLE(l,o,t,ds)) -> ok where
    w = check_exprs e1 st
    x = symAllInt (type_exprs e1 st) (M_ass(name,e1,e2))
    y = check_expr e2 st
    z = case type_expr e2 st of
      Ok v -> if v == (t,ds- length e1) then Ok True
              else Bad ("Type Error in assignment " ++ show (M_ass(name,e1,e2)))
      Bad e -> Bad e
    ok = if allOkay [w,x,y,z] then Ok True
        else Bad (firstE [w,x,y,z])
  Bad _ -> Bad ("Undefined assignment " ++ show (M_ass(name,e1,e2)))
  _     -> Bad ("Error in assignment, Invalid type for symbol " ++ name)
check_stmt (M_while(gaurd,loop)) st = ok where
  y = check_expr gaurd st
  z = check_stmt loop st
  ok = if allOkay [y,z] then Ok True
      else Bad (firstE[y,z])
check_stmt (M_cond(cond,s1,s2)) st = ok where
  x = check_expr cond st
  y = check_stmt s1 st
  z = check_stmt s2 st
  ok = if allOkay [x,y,z] then Ok True
      else Bad (firstE[x,y,z])
check_stmt (M_read(name,es)) st = case s_lookup name st of
  Ok(I_VARIABLE(l,o,t,d)) -> case (t,d-length es) of
    (M_int,0) -> Ok True
    (M_real,0) -> Ok True
    (M_bool,0) -> Ok True
    _          -> Bad ("Error is statement " ++ show (M_read(name,es)) ++ "Unsupported type")
  Bad e -> Bad e
check_stmt (M_print e) st = case check_expr e st of
  Ok _ -> case type_expr e st of
    Ok(M_int,0) -> Ok $ True
    Ok(M_real,0) -> Ok $ True
    Ok(M_bool,0) -> Ok $ True
    Bad e -> Bad e
    _ -> Bad ("Error in statement " ++ show (M_print(e)) ++ "Unsupported type")
  Bad e -> Bad e
check_stmt (M_return e) st = case type_expr e st of
  Ok(t,0) -> case return_type st of
    Ok t' -> if t==t' then Ok True
            else Bad ("Return error " ++ show (M_return(e)))
    Bad e -> Bad e
  Bad e -> Bad e
check_stmt (M_block(decls,stmts)) st = case collect_decls decls (up_blkscope st) of
  Ok (st',_,_,_) -> check_stmts stmts st'
  Bad e -> Bad e

--Map check_stmt onto multiple stmts
check_stmts :: [M_stmt]->ST->Err Bool
check_stmts sl st
  | allOk = Ok True
  | otherwise = Bad (firstE stmts) where
    stmts = map(\e->check_stmt e st) sl
    allOk = allOkay stmts

--See above
check_expr :: M_expr->ST->Err Bool
check_expr (M_ival _)_=Ok True
check_expr (M_rval _)_=Ok True
check_expr (M_bval _)_=Ok True
check_expr (M_size (name,i)) st = case (s_lookup name st) of
  Ok (I_VARIABLE(_,_,_,d))->case (type_expr (M_size(name,i)) st) of
    Ok _ -> Ok True
    Bad e -> Bad e
  Bad e -> Bad e
  _    -> Bad ("Check error " ++ show (M_size(name,i)))
check_expr (M_id(name,es)) st = tf where
  conj1 = case (s_lookup name st) of
    Ok (I_VARIABLE(l,o,t,d)) -> case type_expr (M_id(name,es)) st of
      Ok _ -> Ok True
      Bad e -> Bad e
    Bad e -> Bad e
    _ -> Bad ("Check error " ++ show (M_id(name,es)))
  conj2 = check_exprs es st
  tf = if(allOkay[conj1,conj2]) then Ok True
      else Bad (firstE [conj1,conj2])
check_expr (M_app(op,es)) st = tf where
  conj1 = check_opn op st
  conj2 = check_exprs es st
  tf = if (allOkay [conj1,conj2]) then Ok True
    else Bad (firstE [conj1,conj2])

--Map check expr onto multiple exprs
check_exprs :: [M_expr]->ST->Err Bool
check_exprs el st
  | allOk = Ok True
  | otherwise = Bad (firstE exprs) where
    exprs = map(\e->check_expr e st) el
    allOk = allOkay exprs

--See above
check_opn :: M_operation->ST->Err Bool
check_opn (M_fn n) st = case (s_lookup n st) of
  Ok (I_FUNCTION _) -> Ok True
  Bad e -> Bad e
  _     -> Bad ("Operation is not well formed " ++ show (M_fn(n)))
check_opn _ _ = Ok True


type_expr :: M_expr -> ST -> Err (M_type,Int)
type_expr (M_ival _) _ = Ok(M_int,0)
type_expr (M_rval _)_ = Ok(M_real,0)
type_expr (M_bval _)_ = Ok(M_bool,0)
type_expr (M_size(n,d)) st = case s_lookup n st of
  Ok (I_VARIABLE(_,_,t,dims)) -> Ok (M_int,0)
  _                           -> Bad ("Type error " ++ show (M_size(n,d)))
type_expr (M_id(n,es)) st = case (s_lookup n st) of
    Ok(I_VARIABLE(_,_,t,_)) -> Ok(t,0)
    _                          -> Bad ("Type error" ++ show (M_id(n,es)))
type_expr (M_app(op,es)) st = case type_exprs es st of
  Ok i -> case type_op op i st of
    Ok x -> Ok(x,0)
    Bad e -> Bad("Error in statement " ++ show(M_app(op,es)))
  Bad e -> Bad e

{- Establish the type of an expr based on the current symbol and symbol table. -}
type_exprs :: [M_expr] -> ST -> Err [(M_type,Int)]
type_exprs [] _ = Ok []
type_exprs (e:es) st = case type_expr e st of
  Ok x -> case type_exprs es st of
    Ok rst -> Ok(x:rst)
    Bad e -> Bad e
  Bad e -> Bad e

type_op :: M_operation ->[(M_type,Int)]->ST-> Err M_type
type_op op [] st = Bad "Operation applied to zero arguments"
type_op (M_fn name) ns st = case s_lookup name st of
  Ok (I_FUNCTION(_,fb,ps,r)) -> case match_arguments ps ns of
    Ok _ -> Ok $ r
    Bad e -> Bad e
    where
      match_arguments  [] [] = Ok True
      match_arguments(p:ps) (e:es) = if p == e then match_arguments ps es else Bad ("Function Arguments dont match")
      match_arguments _ _ = Bad "Function Error"
  Bad e -> Bad e
type_op op es st = case opType es of
  Bad e -> Bad e
  Ok x ->
   if op `elem` [M_add,M_sub,M_mul,M_div,M_neg] then case x of
      M_int -> Ok M_int
      M_real -> Ok M_real
      _      -> Bad ("Numeric error")
    else
    if op `elem` [M_lt,M_le,M_gt,M_ge,M_eq] then case x of
      M_int  -> Ok M_bool
      M_real -> Ok M_bool
      M_bool -> Ok M_bool
    else
    if op `elem` [M_and,M_not,M_or] then case x of
      M_bool -> Ok M_bool
      _      -> Bad "Bool error"
    else
    if op `elem` [M_floor,M_ceil] then case x of
      M_int -> Ok M_int
      M_real -> Ok M_real
      _      -> Bad ("Numeric operation error")
  else error ("Unimplemented operation " ++ show op)

opType :: [(M_type,Int)]->Err M_type
opType ((t,0):[]) = Ok t
opType (t:ts) = case (t,opType ts) of
  ((M_int,0),Ok M_int) -> Ok M_int
  ((M_real,0),Ok M_real) -> Ok M_real
  ((M_bool,0),Ok M_bool) -> Ok M_bool
  _                     -> Bad "Unrecognized data type"



--Checks to see if all symbols in a list are of type int. For array checking.
symAllInt (Bad e)_ = Bad e
symAllInt (Ok [])_ = Ok True
symAllInt (Ok (e:es)) st = case e of
  (M_int,0) -> symAllInt (Ok es) st
  _          -> Bad ("Not an int")
