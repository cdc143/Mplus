module Main where

import SkelMp

import ErrM
import ParMp
import PrintMp
import AbsMp
import Data.Char
import IRGen
import CodeGen
import Data.List.Utils

import System.Environment


main = do
   args <- getArgs
   if length args < 2 then
     error "Usage is ./TestMP <<input file>> <<output file>>"
     else do
       conts <- readFile (args!!0)
       let tok = myLexer conts
       let ptree = pProg tok
       case ptree of
         Ok tree -> do
           let ast = transProg tree
           let ir = ir_gen ast
           case ir of
             Ok goodir -> do
               let code = code_gen goodir
               let codet = replace "True" "true" code
               let codef = replace "False" "false" codet
               writeFile (args!!1) codef
