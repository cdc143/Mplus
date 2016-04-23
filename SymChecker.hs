module SymChecker where

import ErrM
import SymbolTable
import SymbolTypes
import AST

check_stmt :: M_stmt->ST->Err Bool
check_stmt (M_ass (name, e1,e2)) st = case s_lookup name st of
  Ok(I_VARIABLE(l,o,t,ds)) -> ok where
    w = check_exprs e1 st
    x = allInt (type_exprs e1 st) (M_ass(name,e1,e2))
    y = check_expr e2 st
    z = case type_expr e2 st of
      Ok v -> if v == (t,ds- length e1) then Ok True
              --throw error
              else Bad "Error"
    ok = if allOkay [w,x,y,z] then Ok True
        else Bad (firstE [w,x,y,z])
    --throw other errors
check_stmt (M_while(gaurd,loop) st) = ok where
  y = check_expr gaurd st
  z = check_expr loop st
  ok = if allOkay [y,z] then Ok True
      else Bad False
check_stmt (M_cond(cond,s1,s2)) st = ok where
  x = check_expr cond st
  y = check_expr s1 st
  z = check_expr s2 st
  ok = if allOkay [x,y,z] then Ok True
      else Bad False
check_stmt (M_read(name,es)) st = case s_lookup name st of
  Ok(I_VARIABLE(l,o,t,d)) -> case (t,d-length es) of
    (M_int,0) -> Ok True
    (M_real,0) -> Ok True
    (M_bool,0) -> Ok True
    --unsupported type
  Bad e -> Bad e
check_stmt (M_print e) st = case check_expr e st of
  Ok _ -> case type_expr e st of
    Ok(M_int,0) -> Ok True
    Ok(M_real,0) -> Ok True
    Ok(M_bool,0) -> Ok True
    Bad e -> Bad False
  Bad e -> Bad e
check_stmt (M_return e) st = case check_expr e st of
  Ok(t,0) -> case return_type st of
    Ok t' -> if t==t' then Ok True
            else Bad False
    Bad e -> Bad e
  Bad e -> Bad e
check_stmt (M_block(decls,stmts)) st = case collect_decls decls (up_blkscope st) of
  Ok (st',_,_,_) -> check_stmts stmts st'
  Bad e -> Bad e

--check_stmt (M_while)
--check_stmt (M_cond)
--check_stmt (M_read)
--check_stmt (M_print)
--check_stmt (M_return)
--check_stmt (M_block)

check_stmts :: [M_stmt]->ST->Err Bool
check_stmts sl st
  | allOk = Ok True
  | otherwise = Bad (firstE stmts) where
    stmts = map(\e->check_stmt e st) sl
    allOk = allOkay stmts

check_expr :: M_expr->ST->Err Bool
check_expr (M_ival _ _)_=Ok True
check_expr (M_rval _ _)_=Ok True
check_expr (M_bval _ _)_=Ok True
check_expr (M_size (name,i)) st = case (s_lookup name st) of
  Ok (I_VARIABLE(_,_,_,d))->case (type_expr (M_size(name,i)) st) of
    Ok _ -> Ok True
    Bad e -> Bad e
  Bad e -> Bad e
  --Symantic error
check_expr (M_id(name,es)) st = tf where
  conj1 = case (s_lookup name st) of
    Ok (I_VARIABLE(l,o,t,d)) -> case type_expr (M_id(name,es)) st of
      Ok _ -> Ok True
      Bad e -> Bad e
    Bad e -> Bad e
    --Symantic error
  conj2 = check_exprs es st
  tf = if(allOkay[conj1,conj2]) then Ok True
      else Bad (firstE [conj1,conj2])
check_expr (M_app(op,es)) st = tf where
  conj1 = check_opn op st
  conj2 = check_exprs es st
  tf = if (allOkay [conj1,conj2]) then Ok True
    else Bad (firstE [conj1,conj2])


check_exprs :: [M_expr]->ST->Err Bool
check_exprs el st
  | allOk = Ok True
  | otherwise = Bad (firstE exprs) where
    exprs = map(\e->check_expr e st) el
    allOk = allOkay exprs

check_opn :: M_operation->ST->Err Bool
check_opn (M_fun name) st = case (s_lookup name st) of
  Ok(I_FUNCTION _) -> Ok True
  Bad e -> Bad e
  --Error for not being function
check_opn _ _ = Ok True

allInt :: Err [(M_type,Int)] -> Err Bool
allInt (Bad e) = Bad e
allInt (Ok []) = Ok True
allInt (Ok(x:xs)) = case x of
  (M_int,0) -> allInt (Ok xs)
  _         -> Bad "Not an int"
