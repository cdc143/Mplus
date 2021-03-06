{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
module PrintMp where

-- pretty-printer generated by the BNF converter

import AbsMp
import Data.Char


-- the top-level printing method
printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : "," :ts -> showString t . space "," . rend i ts
    t  : ")" :ts -> showString t . showChar ')' . rend i ts
    t  : "]" :ts -> showString t . showChar ']' . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else (' ':s))

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- the printer class does the job
class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j<i then parenth else id


instance Print Integer where
  prt _ x = doc (shows x)


instance Print Double where
  prt _ x = doc (shows x)


instance Print Ident where
  prt _ (Ident i) = doc (showString ( i))



instance Print Prog where
  prt i e = case e of
    ProgBlock block -> prPrec i 0 (concatD [prt 0 block])

instance Print Block where
  prt i e = case e of
    Block1 declarations programbody -> prPrec i 0 (concatD [prt 0 declarations, prt 0 programbody])

instance Print Declarations where
  prt i e = case e of
    Declarations1 declaration declarations -> prPrec i 0 (concatD [prt 0 declaration, doc (showString ";"), prt 0 declarations])
    Declarations2 -> prPrec i 0 (concatD [])

instance Print Declaration where
  prt i e = case e of
    DeclarationVar_declaration vardeclaration -> prPrec i 0 (concatD [prt 0 vardeclaration])
    DeclarationFun_declaration fundeclaration -> prPrec i 0 (concatD [prt 0 fundeclaration])

instance Print Var_declaration where
  prt i e = case e of
    Var_declaration1 id arraydimensions type_ -> prPrec i 0 (concatD [doc (showString "var"), prt 0 id, prt 0 arraydimensions, doc (showString ":"), prt 0 type_])

instance Print Type where
  prt i e = case e of
    Type_int -> prPrec i 0 (concatD [doc (showString "int")])
    Type_real -> prPrec i 0 (concatD [doc (showString "real")])
    Type_bool -> prPrec i 0 (concatD [doc (showString "bool")])

instance Print Array_dimensions where
  prt i e = case e of
    Array_dimensions1 expr arraydimensions -> prPrec i 0 (concatD [doc (showString "["), prt 0 expr, doc (showString "]"), prt 0 arraydimensions])
    Array_dimensions2 -> prPrec i 0 (concatD [])

instance Print Fun_declaration where
  prt i e = case e of
    Fun_declaration1 id paramlist type_ funblock -> prPrec i 0 (concatD [doc (showString "fun"), prt 0 id, prt 0 paramlist, doc (showString ":"), prt 0 type_, doc (showString "{"), prt 0 funblock, doc (showString "}")])

instance Print Fun_block where
  prt i e = case e of
    Fun_block1 declarations funbody -> prPrec i 0 (concatD [prt 0 declarations, prt 0 funbody])

instance Print Param_list where
  prt i e = case e of
    Param_list1 parameters -> prPrec i 0 (concatD [doc (showString "("), prt 0 parameters, doc (showString ")")])

instance Print Parameters where
  prt i e = case e of
    Parameters1 basicdeclaration moreparameters -> prPrec i 0 (concatD [prt 0 basicdeclaration, prt 0 moreparameters])
    Parameters2 -> prPrec i 0 (concatD [])

instance Print More_parameters where
  prt i e = case e of
    More_parameters1 basicdeclaration moreparameters -> prPrec i 0 (concatD [doc (showString ","), prt 0 basicdeclaration, prt 0 moreparameters])
    More_parameters2 -> prPrec i 0 (concatD [])

instance Print Basic_declaration where
  prt i e = case e of
    Basic_declaration1 id basicarraydimensions type_ -> prPrec i 0 (concatD [prt 0 id, prt 0 basicarraydimensions, doc (showString ":"), prt 0 type_])

instance Print Basic_array_dimensions where
  prt i e = case e of
    Basic_array_dimensions1 basicarraydimensions -> prPrec i 0 (concatD [doc (showString "["), doc (showString "]"), prt 0 basicarraydimensions])
    Basic_array_dimensions2 -> prPrec i 0 (concatD [])

instance Print Program_body where
  prt i e = case e of
    Program_body1 progstmts -> prPrec i 0 (concatD [doc (showString "begin"), prt 0 progstmts, doc (showString "end")])
    Program_bodyProg_stmts progstmts -> prPrec i 0 (concatD [prt 0 progstmts])

instance Print Fun_body where
  prt i e = case e of
    Fun_body1 progstmts expr -> prPrec i 0 (concatD [doc (showString "begin"), prt 0 progstmts, doc (showString "return"), prt 0 expr, doc (showString ";"), doc (showString "end")])

instance Print Prog_stmts where
  prt i e = case e of
    Prog_stmts1 progstmt progstmts -> prPrec i 0 (concatD [prt 0 progstmt, doc (showString ";"), prt 0 progstmts])
    Prog_stmts2 -> prPrec i 0 (concatD [])

instance Print Prog_stmt where
  prt i e = case e of
    Prog_stmt1 expr progstmt1 progstmt2 -> prPrec i 0 (concatD [doc (showString "if"), prt 0 expr, doc (showString "then"), prt 0 progstmt1, doc (showString "else"), prt 0 progstmt2])
    Prog_stmt2 expr progstmt -> prPrec i 0 (concatD [doc (showString "while"), prt 0 expr, doc (showString "do"), prt 0 progstmt])
    Prog_stmt3 identifier -> prPrec i 0 (concatD [doc (showString "read"), prt 0 identifier])
    Prog_stmt4 identifier expr -> prPrec i 0 (concatD [prt 0 identifier, doc (showString ":="), prt 0 expr])
    Prog_stmt5 expr -> prPrec i 0 (concatD [doc (showString "print"), prt 0 expr])
    Prog_stmt6 block -> prPrec i 0 (concatD [doc (showString "{"), prt 0 block, doc (showString "}")])

instance Print Identifier where
  prt i e = case e of
    Identifier1 id arraydimensions -> prPrec i 0 (concatD [prt 0 id, prt 0 arraydimensions])

instance Print Expr where
  prt i e = case e of
    Expr1 expr bintterm -> prPrec i 0 (concatD [prt 0 expr, doc (showString "||"), prt 0 bintterm])
    ExprBint_term bintterm -> prPrec i 0 (concatD [prt 0 bintterm])

instance Print Bint_term where
  prt i e = case e of
    Bint_term1 bintterm bintfactor -> prPrec i 0 (concatD [prt 0 bintterm, doc (showString "&&"), prt 0 bintfactor])
    Bint_termBint_factor bintfactor -> prPrec i 0 (concatD [prt 0 bintfactor])

instance Print Bint_factor where
  prt i e = case e of
    Bint_factor1 bintfactor -> prPrec i 0 (concatD [doc (showString "not"), prt 0 bintfactor])
    Bint_factor2 intexpr1 compareop intexpr2 -> prPrec i 0 (concatD [prt 0 intexpr1, prt 0 compareop, prt 0 intexpr2])
    Bint_factorInt_expr intexpr -> prPrec i 0 (concatD [prt 0 intexpr])

instance Print Compare_op where
  prt i e = case e of
    Compare_op1 -> prPrec i 0 (concatD [doc (showString "=")])
    Compare_op2 -> prPrec i 0 (concatD [doc (showString "<")])
    Compare_op3 -> prPrec i 0 (concatD [doc (showString ">")])
    Compare_op4 -> prPrec i 0 (concatD [doc (showString "=<")])
    Compare_op5 -> prPrec i 0 (concatD [doc (showString ">=")])

instance Print Int_expr where
  prt i e = case e of
    Int_expr1 intexpr addop intterm -> prPrec i 0 (concatD [prt 0 intexpr, prt 0 addop, prt 0 intterm])
    Int_exprInt_term intterm -> prPrec i 0 (concatD [prt 0 intterm])

instance Print Addop where
  prt i e = case e of
    Addop1 -> prPrec i 0 (concatD [doc (showString "+")])
    Addop2 -> prPrec i 0 (concatD [doc (showString "-")])

instance Print Int_term where
  prt i e = case e of
    Int_term1 intterm mulop intfactor -> prPrec i 0 (concatD [prt 0 intterm, prt 0 mulop, prt 0 intfactor])
    Int_termInt_factor intfactor -> prPrec i 0 (concatD [prt 0 intfactor])

instance Print Mulop where
  prt i e = case e of
    Mulop1 -> prPrec i 0 (concatD [doc (showString "*")])
    Mulop2 -> prPrec i 0 (concatD [doc (showString "/")])

instance Print Int_factor where
  prt i e = case e of
    Int_factor1 expr -> prPrec i 0 (concatD [doc (showString "("), prt 0 expr, doc (showString ")")])
    Int_factor2 id basicarraydimensions -> prPrec i 0 (concatD [doc (showString "size"), doc (showString "("), prt 0 id, prt 0 basicarraydimensions, doc (showString ")")])
    Int_factor3 expr -> prPrec i 0 (concatD [doc (showString "float"), doc (showString "("), prt 0 expr, doc (showString ")")])
    Int_factor4 expr -> prPrec i 0 (concatD [doc (showString "floor"), doc (showString "("), prt 0 expr, doc (showString ")")])
    Int_factor5 expr -> prPrec i 0 (concatD [doc (showString "ceil"), doc (showString "("), prt 0 expr, doc (showString ")")])
    Int_factor6 id modifierlist -> prPrec i 0 (concatD [prt 0 id, prt 0 modifierlist])
    Int_factorInteger n -> prPrec i 0 (concatD [prt 0 n])
    Int_factorDouble d -> prPrec i 0 (concatD [prt 0 d])
    Int_factor_true -> prPrec i 0 (concatD [doc (showString "true")])
    Int_factor_false -> prPrec i 0 (concatD [doc (showString "false")])
    Int_factor7 intfactor -> prPrec i 0 (concatD [doc (showString "-"), prt 0 intfactor])

instance Print Modifier_list where
  prt i e = case e of
    Modifier_list1 arguments -> prPrec i 0 (concatD [doc (showString "("), prt 0 arguments, doc (showString ")")])
    Modifier_listArray_dimensions arraydimensions -> prPrec i 0 (concatD [prt 0 arraydimensions])

instance Print Arguments where
  prt i e = case e of
    Arguments1 expr morearguments -> prPrec i 0 (concatD [prt 0 expr, prt 0 morearguments])
    Arguments2 -> prPrec i 0 (concatD [])

instance Print More_arguments where
  prt i e = case e of
    More_arguments1 expr morearguments -> prPrec i 0 (concatD [doc (showString ","), prt 0 expr, prt 0 morearguments])
    More_arguments2 -> prPrec i 0 (concatD [])


