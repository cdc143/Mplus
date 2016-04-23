module SymbolTable (ST, empty, s_insert, s_lookup,return_type, delete_scope, up_blkscope, up_funscope,get_level,get_currentlevel )
where

import AST
import SymbolTypes
import ErrM
--Implemented Symbol table as a balanced tree.
import qualified Data.Map.Lazy as M

type Level = (Int, Int, Int, [SYM_DESC], (Maybe M_type))
data ST = ST([Level], Int, (M.Map String [SYM_ATTR]))
data SYM_ATTR = S_ATTR(Int, SYM_I_DESC)

--Check if a is null. If not, return its value
val :: Maybe a -> a
val (Just a) = a
val Nothing = error "No assigned value for given element"

--Lookup something in a Symbol Table
s_lookup :: String -> ST -> Err SYM_I_DESC
s_lookup s (ST(_,_,m)) =
  case (M.lookup s m) of
    Just (a:_) -> Ok(attr a)
    Nothing -> Bad("Symbol " ++ s ++ " Not declared in current block")
    _ -> error "Empty symbol query"

--See what is defined in the program
defined :: Int -> [Level] -> [String]
defined n ls = foldr (\(_,_,_,s,_) l -> (map name s)++l) [] ls

--Get the name of various types of symbols
name :: SYM_DESC -> String
name (ARGUMENT(nm,_,_)) = nm
name (VARIABLE(nm,_,_)) = nm
name (FUNCTION(nm,_,_)) = nm

--Insert a symbol into the symbol table and return a new symbol table
s_insert :: SYM_DESC -> ST -> Err ST
s_insert _ (ST([],_,_)) = error "Trying to insert into invalid scope"

s_insert s (ST (l:ls, i, m))
  | not $ (name s) `elem` (defined n (l:ls))
    = Ok(ST (ls',i,M.insert ins [a] m))
  | otherwise
    =_s_insert n' s a (ST((l:ls),i,m))
  where
    (n,vars,args,desc,p) = l
    n' = case s of
      (FUNCTION _) -> n+1
      _       ->  n
    (a,ls',ins) = case s of
      (ARGUMENT (nm,t,d))
        -> ((S_ATTR (n, (I_VARIABLE (n, (-(args+4)),t,d)))),
          (n,vars,args+1,s:desc,p):ls, nm)
      (VARIABLE (nm,t,d))
        -> ((S_ATTR (n, (I_VARIABLE (n, (vars+1),t,d)))),
          (n,vars+1,args,s:desc,p):ls, nm)
      (FUNCTION (nm,as,t))
        -> ((S_ATTR (n, (I_FUNCTION (n,nm,as,t)))),
          (n+1,0,0,[],Just t):((n,vars,args,s:desc,p):ls), nm)

_s_insert n k a (ST(ls,nc,m))
  | not $ (name k)  `elem` (inLevel n ls)
      = Ok(ST(l',nc,m'))
  | otherwise
     = Bad (show (name k) ++ " is defined more than one time in the current block" )
    where
      as = val $ M.lookup (name k) m
      l = head ls
      (_,numV,numA,ts,r) = l
      l' = case k of
          (ARGUMENT _) -> (n,numV,numA+1,k:ts,r):(tail ls)
          (VARIABLE _) -> (n,numV+1,numA,k:ts,r):(tail ls)
          (FUNCTION (_,_,p)) -> (n+1,0,0,[],Just p):((n,numV,numA,k:ts,r):(tail ls))

      m' = M.insert (name k) (a:as) m

--Find all names defined in a level
inLevel :: Int -> [Level] -> [String]
inLevel n ls = defined n (filter (\(x,_,_,_,_) -> x==n) ls)

--Return return type of a level
ret :: Level -> Err M_type
ret (_,_,_,_,t) = case t of
  Just p -> Ok p
  _      -> Bad "No return type is present in current scope"

--Get return type of level in a symbol table
return_type :: ST -> Err M_type
return_type (ST ([],_,_)) = error "Scope is empty"
return_type (ST (lv:l,_,m)) = ret lv

--Create empty level
empty_level :: Level
empty_level = (0,0,0,[],Nothing)

--Create empty symbol table
empty :: ST
empty = ST([empty_level],0,(M.empty))

--Access desc in attr tuple
attr :: SYM_ATTR -> SYM_I_DESC
attr (S_ATTR(_,desc)) = desc

--Go up one block scope
up_blkscope :: ST -> ST
up_blkscope (ST([],_,_)) = error "Scope is empty"
up_blkscope (ST(l:ls,i,m)) = (ST(l':(l:ls),i,m)) where
  (n, numV, numA, ts, p) = l
  l' = (n+1, 0, 0, [], Nothing)

--Go up one function scope
up_funscope :: ST -> M_type -> ST
up_funscope (ST([],_,_)) _ = error "Scope is empty"
up_funscope (ST(l:ls,i,m)) r = (ST(l':(l:ls),i,m)) where
  (n, v, a, desc, p) = l
  l' = (n+1, 0, 0, [], Just r)

--Delete scope of symbol table
delete_scope :: ST -> (Int,ST)
delete_scope (ST([],desc,_)) = error "Scope is empty"
delete_scope (ST(_:[],desc,_)) = error "Cannot remove bottom scope"
delete_scope (ST(l:ls,desc,m))=delete_lv l (ST(ls,desc,m))

--Delete symbol table level l
delete_lv :: Level -> ST -> (Int, ST)
delete_lv _ (ST([],_,_)) = error "Invalid Scope"
delete_lv l (ST(ls,n',m))  = (vars, t')
  where
    t = (ST(ls,n',m))
    (n,vars,_,ts,_) = l
    def = foldr1 (++) (map (\(_,_,_,d,_)-> d) ls)
    t' = deleteAll def t
    deleteAll [] t = t
    deleteAll (a:as) t = deleteAll as (delete_s l t a)

--Delete a symbol from the table
delete_s :: Level -> ST -> SYM_DESC -> ST

delete_s _ (ST([],_,_)) _ = error "Invalid Scope"
delete_s l (ST(ls,n,m)) k
  | not inLevel =(ST(ls,n,m))
  | otherwise = (ST(ls,n,m'))
  where
    (i,_,_,def,_) = l
    inLevel = k `elem` def
    a = val $ M.lookup (name k) m
    m' = M.insert (name k) (filter (\x-> s_level x /= i) a) m

s_level :: SYM_ATTR -> Int
s_level (S_ATTR(a,_)) = a


--Get level l of symbol table
get_level :: ST -> Level
get_level (ST((l:ls),_,_)) = l

--Know which level of the symbol table we are currently at
get_currentlevel :: ST -> Int
get_currentlevel (ST((l,_,_,_,_):ls,_,_))=l
