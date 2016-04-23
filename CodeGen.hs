module CodeGen (code_gen) where
import IR
import ErrM
type Label = (Int,Int)

--Call from main to generate code from IR
code_gen :: I_prog -> String
code_gen ir = prog ir (0,0)

prog :: I_prog -> Label -> String
prog (IPROG(fs,numV,dims,ss)) label
  = prog_begin numV dims ++ stmtsGen ++ prog_end numV ++ funsGen ++ innerFunsGen
  where
    (stmtsGen, l1) = stmts_gen ss label
    (funsGen,l2) = funs_gen fs l1
    (innerFunsGen,_) = innerfuns_gen ss l2

--Program header
prog_begin :: Int -> [(Int,[I_expr])]->String
prog_begin numVars dims
  = "\tLOAD_R %sp \n" ++ "\tLOAD_R %sp \n"++"\tSTORE_R %fp \n"++"\tALLOC " ++ show numVars++"\n"++"\tLOAD_I "++ show (numVars+2) ++ "\n"

--Program tear dowm
prog_end :: Int -> String
prog_end numVars = "\tALLOC -" ++ show numVars ++ "\n" ++ "\tHALT\n"
--Generate a label
label_gen :: Label -> (String,Label)
label_gen (n,c) = ("label" ++ show (n+1) ++ ":", (n+1,c))

--Generate a function label
funlabel_gen :: String -> String
funlabel_gen s = "f_" ++ s ++ ":"

--Generate IR for statement list
stmts_gen:: [I_stmt]->Label-> (String,Label)
stmts_gen [] label = ("",label)
stmts_gen (s:ss) label
  = (stmtCode ++ stmtsCode,label'') where
    (stmtCode,label') = stmt_gen s label
    (stmtsCode,label'') = stmts_gen ss label'

--Generate IR for function list
funs_gen :: [I_fbody] -> Label -> (String,Label)
funs_gen [] label = ("",label)
funs_gen (f:fs) label
  = (funCode ++ funsCode, l'') where
    (funCode, l') = fun_gen f label
    (funsCode, l'') = funs_gen fs l'

--Follow back the pointer some integer number of times, computing %fp as needed
pointer_gen :: Int -> String
pointer_gen lv = "\tLOAD_R %fp\n" ++ (concat $ replicate lv "\tLOAD_O -2 \n")

--Generate code for given function
fun_gen:: I_fbody -> Label -> (String,Label)
fun_gen (IFUN(s,fs,numVars,numArgs,dims,ss)) label
  = (funlabel_gen s ++ fun_begin numVars numArgs dims ++ stmtsCode ++ fun_end numVars numArgs ++ "\n" ++ funsCode ++ innerFunsCode, label1) where
    (stmtsCode,label') = stmts_gen ss label
    (funsCode,label'') = funs_gen fs label'
    (innerFunsCode, label1) = innerfuns_gen ss label''

--Generate function beginning
fun_begin :: Int -> Int -> [(Int,[I_expr])] -> String
fun_begin numVars numArgs dims
  = "\tLOAD_R %sp\n" ++ "\tSTORE_R %fp\n"++"\tALLOC " ++ show numVars ++ "\n" ++ "\tLOAD_I " ++ show (numVars+2) ++ "\n"

--Generate function end
fun_end :: Int -> Int -> String
fun_end numVars numArgs
  = "\tLOAD_R %fp \n"
  ++ "\tSTORE_O " ++ show (-(numArgs+3)) ++"\n"
  ++ "\tLOAD_R %fp\n"
  ++ "\tLOAD_O 0\n"
  ++"\tLOAD_R %fp \n"
  ++"\tSTORE_O " ++ show (-(numArgs+2)) ++"\n"
  ++"\tLOAD_R %fp\n"
  ++"\tLOAD_O " ++ show (numVars+1) ++ "\n"
  ++"\tAPP NEG\n"
  ++"\tALLOC_S\n"
  ++"\tSTORE_R %fp\n"
  ++ "\tALLOC -" ++ show numArgs ++ "\n"
  ++ "\tJUMP_S\n"

--Generate code for additional "inner" function definitions
innerfuns_gen:: [I_stmt] ->  Label -> (String,Label)
innerfuns_gen ss label = _innerfuns_gen (concat (map statementClosure ss)) label
_innerfuns_gen [] label = ("",label)
_innerfuns_gen ((IBLOCK (fs,_,_,_)):ss) label
  = (funCode ++ funsCode, l'') where
    (funCode, l') = funs_gen fs label
    (funsCode, l'') = _innerfuns_gen ss l'
_innerfuns_gen (_:ss) label = _innerfuns_gen ss label

--Generate code for statments
stmt_gen :: I_stmt -> Label -> (String,Label)
stmt_gen(IASS(lv,o,[],e)) label
  = (expr_gen e ++ pointer_gen lv ++ "\tSTORE_O " ++ show o++"\n",label)
stmt_gen (IWHILE (guard, loop)) label
  = ("\tJUMP label" ++ show(fst lGuard) ++ "\n"
  ++startLabel
  ++stmtCode
  ++guardLabel
  ++exprCode
  ++ "\t APP NOT\n"
  ++ "\tJUMP_C label" ++ show (fst lLoop) ++ "\n",
  lGuard) where
    (startLabel,lLoop) = label_gen label
    (stmtCode, l') = stmt_gen loop lLoop
    (guardLabel,lGuard) = label_gen l'
    exprCode = expr_gen guard
stmt_gen(ICOND(e,s1,s2)) label
  = (exprCode
  ++ "\tJUMP_C label" ++ show(fst lCond) ++ "\n"
  ++elseCode
  ++"\tJUMP label" ++ show (fst lElse) ++ "\n"
  ++ ifLabel
    ++ thenCode
    ++ outLabel,
    lElse) where
      exprCode = expr_gen e
      (elseCode, l') = stmt_gen s1 label
      (ifLabel,lCond) = label_gen l'
      (thenCode, l'') = stmt_gen s2 lCond
      (outLabel, lElse) = label_gen l''

stmt_gen (IREAD_B (lv,o,[])) label
  =  ("\tREAD_B\n"
  ++ pointer_gen lv
  ++ "\tSTORE_O " ++ show o ++ "\n",
  label)
stmt_gen (IREAD_I (lv,o,[])) label
  =  ("\tREAD_I\n"
  ++ pointer_gen lv
  ++ "\tSTORE_O " ++ show o ++ "\n",
  label)
stmt_gen (IREAD_F (lv,o,[])) label
  =  ("\tREAD_F\n"
  ++ pointer_gen lv
  ++ "\tSTORE_O " ++ show o ++ "\n",
  label)
stmt_gen (IPRINT_B e) label
  = (expr_gen e ++ "\tPRINT_B\n", label)
stmt_gen (IPRINT_I e) label
  = (expr_gen e ++ "\tPRINT_I\n", label)
stmt_gen (IPRINT_F e) label
  = (expr_gen e ++ "\tPRINT_F\n", label)
stmt_gen (IRETURN e) label
  =(expr_gen e, label)
stmt_gen (IBLOCK (fs,numVars,dims,ss)) label
  = (block_begin numVars dims
  ++ stmtCode
  ++ block_end numVars, l') where
    (stmtCode, l') = stmts_gen ss label
--Setup a block
block_begin :: Int -> [(Int,[I_expr])] -> String
block_begin numVars dims
  ="\tLOAD_R %fp\n"
  ++ "\tALLOC 2\n"
  ++ "\tLOAD_R %sp\n"
  ++"\tSTORE_R %fp\n"
  ++"\tALLOC " ++ show numVars ++ "\n"
  ++"\tLOAD_I " ++ show (numVars+3) ++ "\n"

--Tear down a block
block_end :: Int -> String
block_end numVars
  = "\tLOAD_R %fp\n"
  ++ "\tLOAD_O " ++ show(numVars+1) ++ "\n"
  ++ "\tAPP NEG\n"
  ++"\tALLOC_S\n"
  ++"\tSTORE_R %fp\n"

--Do code for a series of expresions
exprs_gen :: [I_expr] -> String
exprs_gen [] = ""
exprs_gen(e:[]) = expr_gen e
exprs_gen(e:es) = expr_gen e ++ exprs_gen es

--Generate code for given expression
expr_gen :: I_expr -> String
expr_gen (IINT i)
  = "\tLOAD_I "++ show i ++ "\n"
expr_gen (IREAL r)
  = "\tLOAD_F "++ show r ++ "\n"
expr_gen (IBOOL b)
  = "\tLOAD_B "++show b ++ "\n"
expr_gen (IID(l,o,[]))
  = pointer_gen l ++ "\tLOAD_O " ++ show o ++ "\n"
expr_gen (IAPP((ICALL f), es))
  = exprs_gen (reverse es) ++ op_gen (ICALL f)
expr_gen (IAPP(op,es))
  =exprs_gen es ++ op_gen op

--Generate code for given oprand
op_gen :: I_opn -> String
op_gen (ICALL (s,l))
  = "\tALLOC 1 \n" ++ pointer_gen l ++ "\tLOAD_R %fp\n" ++ "\tLOAD_R %cp\n \tJUMP f_" ++ s ++ "\n"
op_gen IADD = "\tAPP ADD\n"
op_gen IMUL = "\tAPP MUL\n"
op_gen ISUB = "\tAPP SUB\n"
op_gen IDIV = "\tAPP DIV\n"
op_gen INEG = "\tAPP NEG\n"
op_gen IADD_F = "\tAPP ADD_F\n"
op_gen IMUL_F = "\tAPP MUL_F\n"
op_gen ISUB_F = "\tAPP SUB_F\n"
op_gen IDIV_F = "\tAPP DIV_F\n"
op_gen INEG_F = "\tAPP NEG_F\n"
op_gen ILT  = "\tAPP LT\n"
op_gen ILE  = "\tAPP LE\n"
op_gen IGT  = "\tAPP GT\n"
op_gen IGE  = "\tAPP GE\n"
op_gen IEQ  = "\tAPP EQ\n"
op_gen ILT_F  = "\tAPP LT_F\n"
op_gen ILE_F  = "\tAPP LE_F\n"
op_gen IGT_F  = "\tAPP GT_F\n"
op_gen IGE_F  = "\tAPP GE_F\n"
op_gen IEQ_F  = "\tAPP EQ_F\n"
op_gen INOT   = "\tAPP NOT\n"
op_gen IAND   = "\tAPP AND\n"
op_gen IOR    = "\tAPP OR\n"
op_gen IFLOAT = "\tAPP FLOAT\n"
op_gen IFLOOR = "\tAPP FLOOR\n"
op_gen ICEIL  = "\tAPP CEIL\n"
