-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParMp where
import AbsMp
import LexMp
import ErrM

}

%name pProg Prog
%name pBlock Block
%name pDeclarations Declarations
%name pDeclaration Declaration
%name pVar_declaration Var_declaration
%name pType Type
%name pArray_dimensions Array_dimensions
%name pFun_declaration Fun_declaration
%name pFun_block Fun_block
%name pParam_list Param_list
%name pParameters Parameters
%name pMore_parameters More_parameters
%name pBasic_declaration Basic_declaration
%name pBasic_array_dimensions Basic_array_dimensions
%name pProgram_body Program_body
%name pFun_body Fun_body
%name pProg_stmts Prog_stmts
%name pProg_stmt Prog_stmt
%name pIdentifier Identifier
%name pExpr Expr
%name pBint_term Bint_term
%name pBint_factor Bint_factor
%name pCompare_op Compare_op
%name pInt_expr Int_expr
%name pAddop Addop
%name pInt_term Int_term
%name pMulop Mulop
%name pInt_factor Int_factor
%name pModifier_list Modifier_list
%name pArguments Arguments
%name pMore_arguments More_arguments
-- no lexer declaration
%monad { Err } { thenM } { returnM }
%tokentype {Token}
%token
  '&&' { PT _ (TS _ 1) }
  '(' { PT _ (TS _ 2) }
  ')' { PT _ (TS _ 3) }
  '*' { PT _ (TS _ 4) }
  '+' { PT _ (TS _ 5) }
  ',' { PT _ (TS _ 6) }
  '-' { PT _ (TS _ 7) }
  '/' { PT _ (TS _ 8) }
  ':' { PT _ (TS _ 9) }
  ':=' { PT _ (TS _ 10) }
  ';' { PT _ (TS _ 11) }
  '<' { PT _ (TS _ 12) }
  '=' { PT _ (TS _ 13) }
  '=<' { PT _ (TS _ 14) }
  '>' { PT _ (TS _ 15) }
  '>=' { PT _ (TS _ 16) }
  '[' { PT _ (TS _ 17) }
  ']' { PT _ (TS _ 18) }
  'begin' { PT _ (TS _ 19) }
  'bool' { PT _ (TS _ 20) }
  'ceil' { PT _ (TS _ 21) }
  'do' { PT _ (TS _ 22) }
  'else' { PT _ (TS _ 23) }
  'end' { PT _ (TS _ 24) }
  'false' { PT _ (TS _ 25) }
  'float' { PT _ (TS _ 26) }
  'floor' { PT _ (TS _ 27) }
  'fun' { PT _ (TS _ 28) }
  'if' { PT _ (TS _ 29) }
  'int' { PT _ (TS _ 30) }
  'not' { PT _ (TS _ 31) }
  'print' { PT _ (TS _ 32) }
  'read' { PT _ (TS _ 33) }
  'real' { PT _ (TS _ 34) }
  'return' { PT _ (TS _ 35) }
  'size' { PT _ (TS _ 36) }
  'then' { PT _ (TS _ 37) }
  'true' { PT _ (TS _ 38) }
  'var' { PT _ (TS _ 39) }
  'while' { PT _ (TS _ 40) }
  '{' { PT _ (TS _ 41) }
  '||' { PT _ (TS _ 42) }
  '}' { PT _ (TS _ 43) }

L_ident  { PT _ (TV $$) }
L_integ  { PT _ (TI $$) }
L_doubl  { PT _ (TD $$) }


%%

Ident   :: { Ident }   : L_ident  { Ident $1 }
Integer :: { Integer } : L_integ  { (read ( $1)) :: Integer }
Double  :: { Double }  : L_doubl  { (read ( $1)) :: Double }

Prog :: { Prog }
Prog : Block { AbsMp.ProgBlock $1 }
Block :: { Block }
Block : Declarations Program_body { AbsMp.Block1 $1 $2 }
Declarations :: { Declarations }
Declarations : Declaration ';' Declarations { AbsMp.Declarations1 $1 $3 }
             | {- empty -} { AbsMp.Declarations2 }
Declaration :: { Declaration }
Declaration : Var_declaration { AbsMp.DeclarationVar_declaration $1 }
            | Fun_declaration { AbsMp.DeclarationFun_declaration $1 }
Var_declaration :: { Var_declaration }
Var_declaration : 'var' Ident Array_dimensions ':' Type { AbsMp.Var_declaration1 $2 $3 $5 }
Type :: { Type }
Type : 'int' { AbsMp.Type_int }
     | 'real' { AbsMp.Type_real }
     | 'bool' { AbsMp.Type_bool }
Array_dimensions :: { Array_dimensions }
Array_dimensions : '[' Expr ']' Array_dimensions { AbsMp.Array_dimensions1 $2 $4 }
                 | {- empty -} { AbsMp.Array_dimensions2 }
Fun_declaration :: { Fun_declaration }
Fun_declaration : 'fun' Ident Param_list ':' Type '{' Fun_block '}' { AbsMp.Fun_declaration1 $2 $3 $5 $7 }
Fun_block :: { Fun_block }
Fun_block : Declarations Fun_body { AbsMp.Fun_block1 $1 $2 }
Param_list :: { Param_list }
Param_list : '(' Parameters ')' { AbsMp.Param_list1 $2 }
Parameters :: { Parameters }
Parameters : Basic_declaration More_parameters { AbsMp.Parameters1 $1 $2 }
           | {- empty -} { AbsMp.Parameters2 }
More_parameters :: { More_parameters }
More_parameters : ',' Basic_declaration More_parameters { AbsMp.More_parameters1 $2 $3 }
                | {- empty -} { AbsMp.More_parameters2 }
Basic_declaration :: { Basic_declaration }
Basic_declaration : Ident Basic_array_dimensions ':' Type { AbsMp.Basic_declaration1 $1 $2 $4 }
Basic_array_dimensions :: { Basic_array_dimensions }
Basic_array_dimensions : '[' ']' Basic_array_dimensions { AbsMp.Basic_array_dimensions1 $3 }
                       | {- empty -} { AbsMp.Basic_array_dimensions2 }
Program_body :: { Program_body }
Program_body : 'begin' Prog_stmts 'end' { AbsMp.Program_body1 $2 }
             | Prog_stmts { AbsMp.Program_bodyProg_stmts $1 }
Fun_body :: { Fun_body }
Fun_body : 'begin' Prog_stmts 'return' Expr ';' 'end' { AbsMp.Fun_body1 $2 $4 }
Prog_stmts :: { Prog_stmts }
Prog_stmts : Prog_stmt ';' Prog_stmts { AbsMp.Prog_stmts1 $1 $3 }
           | {- empty -} { AbsMp.Prog_stmts2 }
Prog_stmt :: { Prog_stmt }
Prog_stmt : 'if' Expr 'then' Prog_stmt 'else' Prog_stmt { AbsMp.Prog_stmt1 $2 $4 $6 }
          | 'while' Expr 'do' Prog_stmt { AbsMp.Prog_stmt2 $2 $4 }
          | 'read' Identifier { AbsMp.Prog_stmt3 $2 }
          | Identifier ':=' Expr { AbsMp.Prog_stmt4 $1 $3 }
          | 'print' Expr { AbsMp.Prog_stmt5 $2 }
          | '{' Block '}' { AbsMp.Prog_stmt6 $2 }
Identifier :: { Identifier }
Identifier : Ident Array_dimensions { AbsMp.Identifier1 $1 $2 }
Expr :: { Expr }
Expr : Expr '||' Bint_term { AbsMp.Expr1 $1 $3 }
     | Bint_term { AbsMp.ExprBint_term $1 }
Bint_term :: { Bint_term }
Bint_term : Bint_term '&&' Bint_factor { AbsMp.Bint_term1 $1 $3 }
          | Bint_factor { AbsMp.Bint_termBint_factor $1 }
Bint_factor :: { Bint_factor }
Bint_factor : 'not' Bint_factor { AbsMp.Bint_factor1 $2 }
            | Int_expr Compare_op Int_expr { AbsMp.Bint_factor2 $1 $2 $3 }
            | Int_expr { AbsMp.Bint_factorInt_expr $1 }
Compare_op :: { Compare_op }
Compare_op : '=' { AbsMp.Compare_op1 }
           | '<' { AbsMp.Compare_op2 }
           | '>' { AbsMp.Compare_op3 }
           | '=<' { AbsMp.Compare_op4 }
           | '>=' { AbsMp.Compare_op5 }
Int_expr :: { Int_expr }
Int_expr : Int_expr Addop Int_term { AbsMp.Int_expr1 $1 $2 $3 }
         | Int_term { AbsMp.Int_exprInt_term $1 }
Addop :: { Addop }
Addop : '+' { AbsMp.Addop1 } | '-' { AbsMp.Addop2 }
Int_term :: { Int_term }
Int_term : Int_term Mulop Int_factor { AbsMp.Int_term1 $1 $2 $3 }
         | Int_factor { AbsMp.Int_termInt_factor $1 }
Mulop :: { Mulop }
Mulop : '*' { AbsMp.Mulop1 } | '/' { AbsMp.Mulop2 }
Int_factor :: { Int_factor }
Int_factor : '(' Expr ')' { AbsMp.Int_factor1 $2 }
           | 'size' '(' Ident Basic_array_dimensions ')' { AbsMp.Int_factor2 $3 $4 }
           | 'float' '(' Expr ')' { AbsMp.Int_factor3 $3 }
           | 'floor' '(' Expr ')' { AbsMp.Int_factor4 $3 }
           | 'ceil' '(' Expr ')' { AbsMp.Int_factor5 $3 }
           | Ident Modifier_list { AbsMp.Int_factor6 $1 $2 }
           | Integer { AbsMp.Int_factorInteger $1 }
           | Double { AbsMp.Int_factorDouble $1 }
           | 'true' { AbsMp.Int_factor_true }
           | 'false' { AbsMp.Int_factor_false }
           | '-' Int_factor { AbsMp.Int_factor7 $2 }
Modifier_list :: { Modifier_list }
Modifier_list : '(' Arguments ')' { AbsMp.Modifier_list1 $2 }
              | Array_dimensions { AbsMp.Modifier_listArray_dimensions $1 }
Arguments :: { Arguments }
Arguments : Expr More_arguments { AbsMp.Arguments1 $1 $2 }
          | {- empty -} { AbsMp.Arguments2 }
More_arguments :: { More_arguments }
More_arguments : ',' Expr More_arguments { AbsMp.More_arguments1 $2 $3 }
               | {- empty -} { AbsMp.More_arguments2 }
{

returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
}

