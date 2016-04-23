module AST where

data M_prog = M_prog ([M_decl],[M_stmt]) deriving (Eq,Show)

data M_decl = M_var (String,[M_expr],M_type)
    | M_fun (String,[(String,Int,M_type)],M_type,[M_decl],[M_stmt]) deriving (Eq,Show)

data M_stmt = M_ass (String,[M_expr],M_expr)
    | M_while (M_expr,M_stmt)
    | M_cond (M_expr,M_stmt,M_stmt)
    | M_read (String,[M_expr])
    | M_print M_expr
    | M_return M_expr
    | M_block ([M_decl],[M_stmt]) deriving (Eq,Show)

data M_type = M_int | M_bool | M_real deriving (Eq, Show)

data M_expr = M_ival Integer
    | M_rval Double
    | M_bval Bool
    | M_size (String,Int)
    | M_id (String,[M_expr])
    | M_app (M_operation,[M_expr]) deriving (Eq,Show)

data M_operation = M_fn String
    | M_add | M_mul | M_sub | M_div | M_neg
    | M_lt | M_le | M_gt | M_ge | M_eq | M_not | M_and | M_or
    | M_float | M_floor | M_ceil  deriving (Eq, Show)
