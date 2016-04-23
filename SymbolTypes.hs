module SymbolTypes where

import AST


data SYM_DESC = ARGUMENT (String,M_type,Int)
              | VARIABLE (String,M_type,Int)
              | FUNCTION (String,[(M_type,Int)],M_type) deriving (Eq,Show)

data SYM_I_DESC = I_VARIABLE (Int,Int,M_type,Int)
                    | I_FUNCTION (Int,String,[(M_type,Int)],M_type)
