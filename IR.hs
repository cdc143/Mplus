module IR where
--Check IR docs on Robin's website for details on IR datatype
data I_prog  = IPROG    ([I_fbody],Int,[(Int,[I_expr])],[I_stmt]) deriving (Eq)

data I_fbody = IFUN     (String,[I_fbody],Int,Int,[(Int,[I_expr])],[I_stmt]) deriving (Eq)

data I_stmt = IASS      (Int,Int,[I_expr],I_expr)
            | IWHILE    (I_expr,I_stmt)
            | ICOND     (I_expr,I_stmt,I_stmt)
            | IREAD_F   (Int,Int,[I_expr])
            | IREAD_I   (Int,Int,[I_expr])
            | IREAD_B   (Int,Int,[I_expr])
            | IPRINT_F  I_expr
            | IPRINT_I  I_expr
            | IPRINT_B  I_expr
            | IRETURN   I_expr
            | IBLOCK    ([I_fbody],Int,[(Int,[I_expr])],[I_stmt]) deriving (Eq)

data I_expr = IINT      Integer
            | IREAL     Double
            | IBOOL     Bool
            | IID       (Int,Int,[I_expr])
            | IAPP      (I_opn,[I_expr])
      | ISIZE     (Int,Int,Int) deriving (Eq)

data I_opn = ICALL      (String,Int)
           | IADD_F | IMUL_F | ISUB_F | IDIV_F | INEG_F
           | ILT_F  | ILE_F  | IGT_F  | IGE_F  | IEQ_F
           | IADD | IMUL | ISUB | IDIV | INEG
           | ILT  | ILE  | IGT  | IGE  | IEQ
           | INOT | IAND | IOR | IFLOAT | ICEIL |IFLOOR deriving (Eq,Show)
statementClosure :: I_stmt -> [I_stmt]
statementClosure s = case s of
  (IWHILE (e,s1))    -> s:(statementClosure s1)
  (ICOND (e,s1,s2))  -> s:((statementClosure s1) ++  (statementClosure s2))
  (IBLOCK (fs,_,_,ss)) -> s:((concat (map statementClosure (concat (map funStmts fs)))) ++ (concat (map statementClosure ss)))
  _                   -> []
funStmts :: I_fbody -> [I_stmt]
funStmts (IFUN (_,fs,_,_,_,ss)) = ss ++ (concat (map funStmts fs))
--Code for pretty printing needs to go below
instance Show I_prog where
  show (IPROG(fb,numVars,numArgs,stmts))="IPROG (\n \t" ++ (show fb ++ show numVars ++ ",\n" ++ show numArgs ++ ",\n" ++ show stmts ++ "\n")

instance Show I_fbody where
  show(IFUN(name,fs,numVars,numArgs,as,stmts))= "IFUN "++ name ++ "(\n \t" ++ show fs ++ show numVars ++ ",\n" ++ show numArgs ++ ",\n" ++ show as ++ ",\n" ++ show stmts ++"\n)"

instance Show I_stmt where
  show (IASS(l,off,ai,e)) = "IASS (" ++ show (l,off,ai) ++ ",\n \t " ++ show e ++ "\n)"
  show (IWHILE(guard,loop)) = "IWHILE (" ++ show guard ++ ",\n \t" ++ show loop ++ "\n)"
  show (ICOND(e,s1,s2)) = "ICOND (" ++ show e ++",\n \t" ++ show [s1,s2] ++"\n"
  show (IRETURN e) = "IRETURN (" ++ show e ++ ")"
  show (IBLOCK(fb,numVars,as,stmts)) = "IBLOCK (\n \t" ++ show fb ++ show numVars ++ ",\n"++show as ++ ",\n" ++ show stmts ++ "\n)"
  show (IPRINT_B b) = "IPRINT_B (" ++ show b ++ ")"
  show (IPRINT_I i) = "IPRINT_I (" ++ show i ++ ")"
  show (IPRINT_F r) = "IPRINT_F (" ++ show r ++ ")"
  show (IREAD_I (c,n,es)) = "IREAD_I (" ++ show (c,n,es) ++ ")"
  show (IREAD_F (c,n,es)) = "IREAD_F (" ++ show (c,n,es) ++ ")"
  show (IREAD_B (c,n,es)) = "IREAD_B (" ++ show (c,n,es) ++ ")"

instance Show I_expr where
  show(IINT i) = "IINT " ++ show i
  show(IREAL r) = "IREAL " ++ show r
  show(IBOOL b) = "IBVOOL " ++ show b
  show (IID (l,o,[])) = "IID (" ++ show l ++ "," ++ show o ++",[])"
  show (IID (l,o,es)) = "IID (" ++ show l ++ "," ++ show o ++ "," ++ show es ++ ")"
  show (IAPP(op,[])) = "IAPP (" ++ show op ++ ",[])"
  show (IAPP(op,es)) = "IAPP (" ++ show op ++ "," ++ show es ++ ")"
  show (ISIZE a) = "ISIZE" ++ show a
