{-# OPTIONS_GHC -w #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParMp where
import AbsMp
import LexMp
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn34 :: (Ident) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> (Ident)
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
happyIn35 :: (Integer) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> (Integer)
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
happyIn36 :: (Double) -> (HappyAbsSyn )
happyIn36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn36 #-}
happyOut36 :: (HappyAbsSyn ) -> (Double)
happyOut36 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut36 #-}
happyIn37 :: (Prog) -> (HappyAbsSyn )
happyIn37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn37 #-}
happyOut37 :: (HappyAbsSyn ) -> (Prog)
happyOut37 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut37 #-}
happyIn38 :: (Block) -> (HappyAbsSyn )
happyIn38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn38 #-}
happyOut38 :: (HappyAbsSyn ) -> (Block)
happyOut38 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut38 #-}
happyIn39 :: (Declarations) -> (HappyAbsSyn )
happyIn39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn39 #-}
happyOut39 :: (HappyAbsSyn ) -> (Declarations)
happyOut39 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut39 #-}
happyIn40 :: (Declaration) -> (HappyAbsSyn )
happyIn40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn40 #-}
happyOut40 :: (HappyAbsSyn ) -> (Declaration)
happyOut40 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut40 #-}
happyIn41 :: (Var_declaration) -> (HappyAbsSyn )
happyIn41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn41 #-}
happyOut41 :: (HappyAbsSyn ) -> (Var_declaration)
happyOut41 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut41 #-}
happyIn42 :: (Type) -> (HappyAbsSyn )
happyIn42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn42 #-}
happyOut42 :: (HappyAbsSyn ) -> (Type)
happyOut42 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut42 #-}
happyIn43 :: (Array_dimensions) -> (HappyAbsSyn )
happyIn43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn43 #-}
happyOut43 :: (HappyAbsSyn ) -> (Array_dimensions)
happyOut43 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut43 #-}
happyIn44 :: (Fun_declaration) -> (HappyAbsSyn )
happyIn44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn44 #-}
happyOut44 :: (HappyAbsSyn ) -> (Fun_declaration)
happyOut44 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut44 #-}
happyIn45 :: (Fun_block) -> (HappyAbsSyn )
happyIn45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn45 #-}
happyOut45 :: (HappyAbsSyn ) -> (Fun_block)
happyOut45 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut45 #-}
happyIn46 :: (Param_list) -> (HappyAbsSyn )
happyIn46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn46 #-}
happyOut46 :: (HappyAbsSyn ) -> (Param_list)
happyOut46 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut46 #-}
happyIn47 :: (Parameters) -> (HappyAbsSyn )
happyIn47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn47 #-}
happyOut47 :: (HappyAbsSyn ) -> (Parameters)
happyOut47 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut47 #-}
happyIn48 :: (More_parameters) -> (HappyAbsSyn )
happyIn48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn48 #-}
happyOut48 :: (HappyAbsSyn ) -> (More_parameters)
happyOut48 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut48 #-}
happyIn49 :: (Basic_declaration) -> (HappyAbsSyn )
happyIn49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn49 #-}
happyOut49 :: (HappyAbsSyn ) -> (Basic_declaration)
happyOut49 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut49 #-}
happyIn50 :: (Basic_array_dimensions) -> (HappyAbsSyn )
happyIn50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn50 #-}
happyOut50 :: (HappyAbsSyn ) -> (Basic_array_dimensions)
happyOut50 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut50 #-}
happyIn51 :: (Program_body) -> (HappyAbsSyn )
happyIn51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn51 #-}
happyOut51 :: (HappyAbsSyn ) -> (Program_body)
happyOut51 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut51 #-}
happyIn52 :: (Fun_body) -> (HappyAbsSyn )
happyIn52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn52 #-}
happyOut52 :: (HappyAbsSyn ) -> (Fun_body)
happyOut52 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut52 #-}
happyIn53 :: (Prog_stmts) -> (HappyAbsSyn )
happyIn53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn53 #-}
happyOut53 :: (HappyAbsSyn ) -> (Prog_stmts)
happyOut53 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut53 #-}
happyIn54 :: (Prog_stmt) -> (HappyAbsSyn )
happyIn54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn54 #-}
happyOut54 :: (HappyAbsSyn ) -> (Prog_stmt)
happyOut54 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut54 #-}
happyIn55 :: (Identifier) -> (HappyAbsSyn )
happyIn55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn55 #-}
happyOut55 :: (HappyAbsSyn ) -> (Identifier)
happyOut55 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut55 #-}
happyIn56 :: (Expr) -> (HappyAbsSyn )
happyIn56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn56 #-}
happyOut56 :: (HappyAbsSyn ) -> (Expr)
happyOut56 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut56 #-}
happyIn57 :: (Bint_term) -> (HappyAbsSyn )
happyIn57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn57 #-}
happyOut57 :: (HappyAbsSyn ) -> (Bint_term)
happyOut57 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut57 #-}
happyIn58 :: (Bint_factor) -> (HappyAbsSyn )
happyIn58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn58 #-}
happyOut58 :: (HappyAbsSyn ) -> (Bint_factor)
happyOut58 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut58 #-}
happyIn59 :: (Compare_op) -> (HappyAbsSyn )
happyIn59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn59 #-}
happyOut59 :: (HappyAbsSyn ) -> (Compare_op)
happyOut59 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut59 #-}
happyIn60 :: (Int_expr) -> (HappyAbsSyn )
happyIn60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn60 #-}
happyOut60 :: (HappyAbsSyn ) -> (Int_expr)
happyOut60 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut60 #-}
happyIn61 :: (Addop) -> (HappyAbsSyn )
happyIn61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn61 #-}
happyOut61 :: (HappyAbsSyn ) -> (Addop)
happyOut61 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut61 #-}
happyIn62 :: (Int_term) -> (HappyAbsSyn )
happyIn62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn62 #-}
happyOut62 :: (HappyAbsSyn ) -> (Int_term)
happyOut62 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut62 #-}
happyIn63 :: (Mulop) -> (HappyAbsSyn )
happyIn63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn63 #-}
happyOut63 :: (HappyAbsSyn ) -> (Mulop)
happyOut63 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut63 #-}
happyIn64 :: (Int_factor) -> (HappyAbsSyn )
happyIn64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn64 #-}
happyOut64 :: (HappyAbsSyn ) -> (Int_factor)
happyOut64 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut64 #-}
happyIn65 :: (Modifier_list) -> (HappyAbsSyn )
happyIn65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn65 #-}
happyOut65 :: (HappyAbsSyn ) -> (Modifier_list)
happyOut65 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut65 #-}
happyIn66 :: (Arguments) -> (HappyAbsSyn )
happyIn66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn66 #-}
happyOut66 :: (HappyAbsSyn ) -> (Arguments)
happyOut66 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut66 #-}
happyIn67 :: (More_arguments) -> (HappyAbsSyn )
happyIn67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn67 #-}
happyOut67 :: (HappyAbsSyn ) -> (More_arguments)
happyOut67 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut67 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x83\x00\x83\x00\x83\x00\x83\x00\xb7\x01\x2a\x01\xca\x01\xc1\x01\x83\x00\xd8\x01\xb0\x01\xd1\x01\xad\x01\xc5\x01\x25\x00\xbf\x01\x4a\x01\x4a\x01\xac\x01\xff\xff\xff\xff\xff\xff\xa3\x01\x0f\x00\xcb\x00\x0f\x00\x1e\x00\x0f\x00\xd7\x00\xff\xff\xce\x01\xa7\x01\x00\x00\xa6\x01\xff\xff\xd7\x00\x00\x00\x00\x00\xfd\xff\xcf\x01\x00\x00\x7c\x01\x1e\x00\x00\x00\xa2\x01\xff\xff\x0f\x00\xcd\x01\x00\x00\xcc\x01\xcb\x01\xff\xff\xc8\x01\x00\x00\x00\x00\x00\x00\x00\x00\x9d\x01\xff\xff\xff\xff\x9d\x01\x9d\x01\x00\x00\x00\x00\x03\x00\x9d\x01\x00\x00\x00\x00\x05\x00\x9d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x9d\x01\x01\x00\x8f\x00\xba\x01\x9a\x01\x9a\x01\xbe\x01\xff\xff\xff\xff\x99\x01\xff\xff\x83\x00\x98\x01\xb9\x01\x97\x01\x4a\x01\x97\x01\x00\x00\x4a\x01\x97\x01\xae\x01\xb1\x01\x94\x01\x94\x01\x93\x01\x92\x01\xb8\x01\x8d\x01\x91\x01\xa8\x01\xaf\x01\x00\x00\x00\x00\x8a\x01\x8b\x01\x8b\x01\x89\x01\x89\x01\x89\x01\x00\x00\x00\x00\x00\x00\x89\x01\x89\x01\x89\x01\x89\x01\x25\x00\x89\x01\x00\x00\x00\x00\xa5\x01\xb3\x01\x83\x00\x00\x00\xaa\x01\x00\x00\xa1\x01\xab\x01\x9b\x01\x87\x01\x83\x01\x4a\x01\x73\x01\xf7\xff\x00\x00\x6f\x01\xdf\xff\xff\xff\x00\x00\xff\xff\xff\xff\x0f\x00\x0f\x00\xf6\xff\x95\x01\x65\x01\x00\x00\xff\xff\xff\xff\xff\xff\x00\x00\x14\x00\x0f\x00\x00\x00\x00\x00\xfd\xff\x00\x00\xcb\x00\x00\x00\x10\x00\x0d\x00\x0c\x00\x7f\x01\x00\x00\x76\x01\x00\x00\x1e\x00\x00\x00\x85\x01\x5b\x01\x4a\x01\x4a\x01\x00\x00\x00\x00\xff\xff\x00\x00\x00\x00\x2a\x01\x00\x00\x00\x00\x00\x00\x7b\x01\x71\x01\x2a\x01\x2a\x01\x00\x00\x07\x00\x00\x00\x5e\x01\x00\x00\x5c\x01\x00\x00\x00\x00\x00\x00\x00\x00\x4a\x01\x38\x01\x21\x01\x00\x00\x83\x00\x00\x00\x00\x00\x1a\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x6a\x01\x9e\x01\xa4\x01\x62\x01\x36\x01\x2e\x01\x29\x01\x23\x01\x96\x01\x1f\x01\xa8\x00\x1b\x01\xa2\x00\x14\x01\xc0\x00\x05\x01\x20\x01\xfa\x00\x6f\x00\x10\x01\x37\x01\x42\x01\x09\x01\x64\x01\x00\x01\x52\x00\xfc\x00\x78\x00\x6e\x00\x4a\x00\xf2\x00\x00\x00\x00\x00\x00\x00\x07\x01\x3b\x00\x00\x00\x00\x00\xe9\x00\x00\x00\x00\x00\x6d\x00\xe4\x00\x00\x00\x00\x00\xfe\x00\x71\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3f\x00\xdf\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe4\x00\x00\x00\x00\x00\x00\x00\xe1\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xea\x00\x00\x00\x00\x00\x00\x00\xd6\x00\xcd\x00\x2e\x00\xae\x00\x90\x01\x00\x00\x00\x00\x00\x00\xf8\x00\x00\x00\x00\x00\xef\x00\x00\x00\x00\x00\xda\x00\x00\x00\x00\x00\x91\x00\x00\x00\xd8\x00\x00\x00\x4f\x00\xb9\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe2\x00\xc2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x98\x00\x00\x00\x00\x00\x00\x00\x9b\x00\x97\x00\x72\x01\x00\x00\x00\x00\x00\x00\x93\x00\x00\x00\x8a\x00\x00\x00\x00\x00\xc7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa5\x00\x00\x00\x2f\x01\x3a\x01\x47\x00\x1b\x00\x00\x00\x00\x00\x80\x00\x00\x00\x9c\x00\x7d\x00\x74\x00\x00\x00\x00\x00\x61\x01\x00\x00\x00\x00\x37\x00\x00\x00\xfa\xff\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x60\x00\x00\x00\xe8\xff\x00\x00\x00\x00\x00\x00\xf1\x00\xc9\x00\x00\x00\x00\x00\x6b\x00\x00\x00\x00\x00\x27\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x17\x00\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x67\x00\x00\x00\x00\x00\x00\x00\x88\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xda\xff\xda\xff\xda\xff\x00\x00\x00\x00\x00\x00\xd2\xff\x00\x00\xda\xff\x00\x00\xcd\xff\xcb\xff\x00\x00\xc8\xff\xc3\xff\x00\x00\xc3\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd2\xff\x99\xff\x97\xff\x00\x00\xe0\xff\x00\x00\x00\x00\xd2\xff\xa1\xff\xa0\xff\x97\xff\xba\xff\xb8\xff\xb5\xff\xae\xff\xaa\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9e\xff\x00\x00\x00\x00\x00\x00\x00\x00\x9f\xff\xdf\xff\xde\xff\x9b\xff\x00\x00\x99\xff\x00\x00\x00\x00\x00\x00\xa9\xff\xa8\xff\x00\x00\x00\x00\xad\xff\xac\xff\x00\x00\x00\x00\xb3\xff\xb4\xff\xb1\xff\xb2\xff\xb0\xff\x00\x00\x00\x00\x00\x00\xd2\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xda\xff\x00\x00\x00\x00\x00\x00\xc3\xff\x00\x00\xc6\xff\xc3\xff\x00\x00\x00\x00\xc8\xff\x00\x00\x00\x00\x00\x00\x00\x00\xcb\xff\x00\x00\xcd\xff\x00\x00\x00\x00\xd9\xff\xd8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd4\xff\xd6\xff\xd5\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc3\xff\x00\x00\xdd\xff\xdc\xff\xd2\xff\x00\x00\xda\xff\xd0\xff\x00\x00\xce\xff\xcb\xff\x00\x00\xc8\xff\x00\x00\x00\x00\xc3\xff\x00\x00\x00\x00\xc0\xff\xbe\xff\x00\x00\x00\x00\xbc\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb7\xff\x00\x00\x00\x00\x00\x00\x9d\xff\x00\x00\x00\x00\x9a\xff\xa2\xff\x97\xff\x98\xff\xb6\xff\xa7\xff\x00\x00\x00\x00\x00\x00\xc8\xff\x9c\xff\xd2\xff\xab\xff\xaf\xff\xb9\xff\xbb\xff\xbf\xff\x00\x00\x00\x00\xbd\xff\xc4\xff\x00\x00\xc7\xff\xc9\xff\x00\x00\xcc\xff\xcf\xff\xdb\xff\x00\x00\x00\x00\x00\x00\x00\x00\xca\xff\x00\x00\xc1\xff\x00\x00\xd3\xff\x00\x00\xa4\xff\xa5\xff\xa3\xff\xa6\xff\x00\x00\x00\x00\x00\x00\xd7\xff\xda\xff\xc5\xff\xc2\xff\x00\x00\xd1\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x02\x00\x01\x00\x06\x00\x25\x00\x1d\x00\x07\x00\x04\x00\x12\x00\x2a\x00\x05\x00\x08\x00\x07\x00\x16\x00\x08\x00\x03\x00\x03\x00\x02\x00\x0b\x00\x03\x00\x15\x00\x1b\x00\x07\x00\x03\x00\x19\x00\x1a\x00\x1b\x00\x00\x00\x01\x00\x02\x00\x1f\x00\x08\x00\x2a\x00\x2a\x00\x04\x00\x24\x00\x15\x00\x26\x00\x08\x00\x2a\x00\x19\x00\x1a\x00\x1b\x00\x2c\x00\x2d\x00\x2e\x00\x00\x00\x08\x00\x2f\x00\x2a\x00\x2f\x00\x24\x00\x2f\x00\x26\x00\x2a\x00\x2a\x00\x13\x00\x1e\x00\x2a\x00\x2c\x00\x2d\x00\x2e\x00\x2a\x00\x00\x00\x01\x00\x02\x00\x1d\x00\x15\x00\x09\x00\x20\x00\x21\x00\x00\x00\x01\x00\x02\x00\x00\x00\x01\x00\x02\x00\x28\x00\x29\x00\x00\x00\x10\x00\x2c\x00\x00\x00\x01\x00\x02\x00\x16\x00\x17\x00\x18\x00\x21\x00\x1a\x00\x1f\x00\x1c\x00\x0d\x00\x1e\x00\x0f\x00\x20\x00\x16\x00\x17\x00\x18\x00\x1c\x00\x1a\x00\x1e\x00\x1c\x00\x00\x00\x1e\x00\x09\x00\x20\x00\x00\x00\x01\x00\x02\x00\x1c\x00\x00\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x00\x00\x01\x00\x02\x00\x09\x00\x00\x00\x01\x00\x02\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x00\x00\x16\x00\x17\x00\x18\x00\x15\x00\x1a\x00\x19\x00\x1c\x00\x1b\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x1f\x00\x1a\x00\x1e\x00\x1c\x00\x00\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x1e\x00\x1a\x00\x00\x00\x1c\x00\x10\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x1c\x00\x0f\x00\x0e\x00\x00\x00\x0c\x00\x09\x00\x00\x00\x01\x00\x02\x00\x00\x00\x11\x00\x27\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x0f\x00\x16\x00\x17\x00\x18\x00\x0d\x00\x1a\x00\x0f\x00\x1c\x00\x2a\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x2f\x00\x1a\x00\x00\x00\x1c\x00\x00\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x00\x00\x1a\x00\x00\x00\x1c\x00\x12\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x05\x00\x11\x00\x07\x00\x13\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x02\x00\x13\x00\x14\x00\x15\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x00\x00\x16\x00\x17\x00\x18\x00\x0e\x00\x1a\x00\x11\x00\x1c\x00\x10\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x00\x00\x1a\x00\x00\x00\x1c\x00\x09\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x00\x00\x1a\x00\x00\x00\x1c\x00\x1b\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x1d\x00\x13\x00\x14\x00\x15\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x21\x00\x13\x00\x14\x00\x15\x00\x14\x00\x15\x00\x00\x00\x01\x00\x02\x00\x21\x00\x16\x00\x17\x00\x18\x00\x12\x00\x1a\x00\x1d\x00\x1c\x00\x1b\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x00\x00\x1a\x00\x19\x00\x1c\x00\x10\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x0e\x00\x1a\x00\x0c\x00\x1c\x00\x0a\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x09\x00\x13\x00\x14\x00\x15\x00\x08\x00\x00\x00\x01\x00\x02\x00\x00\x00\x01\x00\x02\x00\x07\x00\x14\x00\x00\x00\x01\x00\x02\x00\x00\x00\x01\x00\x02\x00\x2b\x00\x17\x00\x18\x00\x1e\x00\x1a\x00\x29\x00\x1c\x00\x22\x00\x1e\x00\x17\x00\x18\x00\x18\x00\x1a\x00\x18\x00\x1c\x00\x1a\x00\x1e\x00\x1c\x00\x18\x00\x1e\x00\x1a\x00\x18\x00\x1c\x00\x1a\x00\x1e\x00\x1c\x00\x03\x00\x1e\x00\x00\x00\x01\x00\x02\x00\x00\x00\x01\x00\x02\x00\x1d\x00\x06\x00\x07\x00\x20\x00\x21\x00\x0a\x00\x03\x00\x04\x00\x05\x00\x06\x00\x07\x00\x28\x00\x29\x00\x0a\x00\x17\x00\x2c\x00\x05\x00\x06\x00\x07\x00\x09\x00\x1a\x00\x0a\x00\x1c\x00\x1a\x00\x1e\x00\x1c\x00\x05\x00\x1e\x00\x07\x00\x09\x00\x2a\x00\x01\x00\x11\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x05\x00\x06\x00\x07\x00\x11\x00\x2c\x00\x0a\x00\x0b\x00\x04\x00\x05\x00\x06\x00\x07\x00\x03\x00\x2a\x00\x0a\x00\x05\x00\x06\x00\x07\x00\x2b\x00\x18\x00\x0a\x00\x0b\x00\x04\x00\x05\x00\x06\x00\x07\x00\x23\x00\x06\x00\x0a\x00\x05\x00\x06\x00\x07\x00\x11\x00\x03\x00\x0a\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x09\x00\x02\x00\x11\x00\x2c\x00\x2f\x00\x2f\x00\x0b\x00\x13\x00\x2f\x00\x2c\x00\x06\x00\x2c\x00\x12\x00\x2f\x00\x11\x00\x2f\x00\x0b\x00\x2c\x00\x2f\x00\x2f\x00\x0a\x00\x2f\x00\x02\x00\x11\x00\x2f\x00\x02\x00\x02\x00\x02\x00\x01\x00\x2f\x00\x13\x00\x2c\x00\x06\x00\x2f\x00\x11\x00\x06\x00\x2c\x00\x2c\x00\x02\x00\x11\x00\x2c\x00\x1c\x00\x27\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x2e\x00\x92\x00\x23\x00\xb0\x00\x93\x00\x2f\x00\x3f\x00\xaa\x00\x91\x00\x43\x00\x40\x00\x44\x00\xb1\x00\xca\x00\xc5\x00\xc6\x00\x2e\x00\xca\x00\xc7\x00\x30\x00\x92\x00\x2f\x00\xa4\x00\x31\x00\x32\x00\x33\x00\x23\x00\x24\x00\x25\x00\x34\x00\xcb\x00\x91\x00\x91\x00\x3f\x00\x35\x00\x30\x00\x36\x00\x40\x00\x91\x00\x31\x00\x32\x00\x33\x00\x21\x00\x37\x00\x38\x00\x4e\x00\xbe\x00\xff\xff\x91\x00\xff\xff\x35\x00\xff\xff\x36\x00\x91\x00\x91\x00\x5e\x00\xaa\x00\x91\x00\x21\x00\x37\x00\x38\x00\x91\x00\x23\x00\x24\x00\x25\x00\x53\x00\x8b\x00\x38\x00\x54\x00\x55\x00\x23\x00\x24\x00\x25\x00\x23\x00\x24\x00\x25\x00\x56\x00\x57\x00\x60\x00\xc3\x00\x21\x00\x23\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\xa1\x00\x29\x00\x9f\x00\x2a\x00\x81\x00\x2b\x00\x65\x00\x95\x00\x26\x00\x27\x00\x28\x00\xab\x00\x29\x00\x2b\x00\x2a\x00\x4e\x00\x2b\x00\xc2\x00\x2c\x00\x23\x00\x24\x00\x25\x00\x40\x00\x4e\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x23\x00\x24\x00\x25\x00\x38\x00\x23\x00\x24\x00\x25\x00\xce\x00\x51\x00\x23\x00\x24\x00\x25\x00\xa7\x00\xbf\x00\x27\x00\x28\x00\x4f\x00\x29\x00\x9d\x00\x2a\x00\x92\x00\x2b\x00\xa4\x00\x27\x00\x28\x00\x39\x00\x29\x00\x9b\x00\x2a\x00\x60\x00\x2b\x00\xa5\x00\x27\x00\x28\x00\x3c\x00\x29\x00\x4e\x00\x2a\x00\xb5\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x6e\x00\x83\x00\xb7\x00\x60\x00\xba\x00\xbb\x00\x23\x00\x24\x00\x25\x00\x60\x00\x7c\x00\x6f\x00\x5c\x00\x58\x00\x51\x00\x23\x00\x24\x00\x25\x00\x61\x00\xa6\x00\x27\x00\x28\x00\x64\x00\x29\x00\x65\x00\x2a\x00\x91\x00\x2b\x00\xae\x00\x27\x00\x28\x00\xff\xff\x29\x00\x4e\x00\x2a\x00\x7d\x00\x2b\x00\x8a\x00\x27\x00\x28\x00\x4e\x00\x29\x00\x4e\x00\x2a\x00\x80\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x43\x00\x5b\x00\x44\x00\x5c\x00\x58\x00\x51\x00\x23\x00\x24\x00\x25\x00\x3b\x00\xb2\x00\x58\x00\x51\x00\xc0\x00\x51\x00\x23\x00\x24\x00\x25\x00\x7e\x00\x8c\x00\x27\x00\x28\x00\x82\x00\x29\x00\x3c\x00\x2a\x00\x84\x00\x2b\x00\x8d\x00\x27\x00\x28\x00\x4e\x00\x29\x00\x4e\x00\x2a\x00\x8f\x00\x2b\x00\x94\x00\x27\x00\x28\x00\x4e\x00\x29\x00\x4e\x00\x2a\x00\x92\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x93\x00\x86\x00\x58\x00\x51\x00\xc1\x00\x51\x00\x23\x00\x24\x00\x25\x00\x9e\x00\x87\x00\x58\x00\x51\x00\x50\x00\x51\x00\x23\x00\x24\x00\x25\x00\x21\x00\x9c\x00\x27\x00\x28\x00\x59\x00\x29\x00\x3d\x00\x2a\x00\x41\x00\x2b\x00\xa0\x00\x27\x00\x28\x00\x4e\x00\x29\x00\x45\x00\x2a\x00\x5e\x00\x2b\x00\x4d\x00\x27\x00\x28\x00\x62\x00\x29\x00\x66\x00\x2a\x00\x6f\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x70\x00\x57\x00\x58\x00\x51\x00\x71\x00\x23\x00\x24\x00\x25\x00\x23\x00\x24\x00\x25\x00\x75\x00\x73\x00\x23\x00\x24\x00\x25\x00\x23\x00\x24\x00\x25\x00\xd1\x00\xad\x00\x28\x00\x74\x00\x29\x00\xcd\x00\x2a\x00\x75\x00\x2b\x00\x4c\x00\x28\x00\xce\x00\x29\x00\xac\x00\x2a\x00\x29\x00\x2b\x00\x2a\x00\x97\x00\x2b\x00\x29\x00\x4b\x00\x2a\x00\x29\x00\x2b\x00\x2a\x00\xc8\x00\x2b\x00\x23\x00\x24\x00\x25\x00\x23\x00\x24\x00\x25\x00\x53\x00\x76\x00\x6a\x00\x54\x00\x55\x00\x6b\x00\x7a\x00\x7b\x00\x79\x00\x69\x00\x6a\x00\x56\x00\x57\x00\x6b\x00\xc9\x00\x21\x00\xb9\x00\x69\x00\x6a\x00\xbd\x00\xa2\x00\x6b\x00\x2a\x00\x44\x00\x2b\x00\x2a\x00\x43\x00\x2b\x00\x44\x00\xbe\x00\x91\x00\x92\x00\x3c\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\x68\x00\x69\x00\x6a\x00\x60\x00\x21\x00\x6b\x00\xcf\x00\x89\x00\x79\x00\x69\x00\x6a\x00\xa9\x00\x91\x00\x6b\x00\x68\x00\x69\x00\x6a\x00\xb2\x00\xb5\x00\x6b\x00\x6c\x00\x78\x00\x79\x00\x69\x00\x6a\x00\xb4\x00\x64\x00\x6b\x00\x77\x00\x69\x00\x6a\x00\x60\x00\xb9\x00\x6b\x00\x47\x00\x48\x00\x49\x00\x4a\x00\x4b\x00\xb7\x00\x68\x00\x3c\x00\x21\x00\xff\xff\xff\xff\x80\x00\x5b\x00\xff\xff\x21\x00\x64\x00\x21\x00\x86\x00\xff\xff\x60\x00\xff\xff\x89\x00\x21\x00\xff\xff\xff\xff\x8f\x00\xff\xff\x97\x00\x3c\x00\xff\xff\x99\x00\x9a\x00\x9b\x00\x92\x00\xff\xff\x5b\x00\x21\x00\x23\x00\xff\xff\x60\x00\x64\x00\x21\x00\x21\x00\x68\x00\x3c\x00\x21\x00\x6e\x00\x6f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (31, 104) [
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75),
	(76 , happyReduce_76),
	(77 , happyReduce_77),
	(78 , happyReduce_78),
	(79 , happyReduce_79),
	(80 , happyReduce_80),
	(81 , happyReduce_81),
	(82 , happyReduce_82),
	(83 , happyReduce_83),
	(84 , happyReduce_84),
	(85 , happyReduce_85),
	(86 , happyReduce_86),
	(87 , happyReduce_87),
	(88 , happyReduce_88),
	(89 , happyReduce_89),
	(90 , happyReduce_90),
	(91 , happyReduce_91),
	(92 , happyReduce_92),
	(93 , happyReduce_93),
	(94 , happyReduce_94),
	(95 , happyReduce_95),
	(96 , happyReduce_96),
	(97 , happyReduce_97),
	(98 , happyReduce_98),
	(99 , happyReduce_99),
	(100 , happyReduce_100),
	(101 , happyReduce_101),
	(102 , happyReduce_102),
	(103 , happyReduce_103),
	(104 , happyReduce_104)
	]

happy_n_terms = 48 :: Int
happy_n_nonterms = 34 :: Int

happyReduce_31 = happySpecReduce_1  0# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn34
		 (Ident happy_var_1
	)}

happyReduce_32 = happySpecReduce_1  1# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TI happy_var_1)) -> 
	happyIn35
		 ((read ( happy_var_1)) :: Integer
	)}

happyReduce_33 = happySpecReduce_1  2# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TD happy_var_1)) -> 
	happyIn36
		 ((read ( happy_var_1)) :: Double
	)}

happyReduce_34 = happySpecReduce_1  3# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut38 happy_x_1 of { happy_var_1 -> 
	happyIn37
		 (AbsMp.ProgBlock happy_var_1
	)}

happyReduce_35 = happySpecReduce_2  4# happyReduction_35
happyReduction_35 happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut51 happy_x_2 of { happy_var_2 -> 
	happyIn38
		 (AbsMp.Block1 happy_var_1 happy_var_2
	)}}

happyReduce_36 = happySpecReduce_3  5# happyReduction_36
happyReduction_36 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut40 happy_x_1 of { happy_var_1 -> 
	case happyOut39 happy_x_3 of { happy_var_3 -> 
	happyIn39
		 (AbsMp.Declarations1 happy_var_1 happy_var_3
	)}}

happyReduce_37 = happySpecReduce_0  5# happyReduction_37
happyReduction_37  =  happyIn39
		 (AbsMp.Declarations2
	)

happyReduce_38 = happySpecReduce_1  6# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOut41 happy_x_1 of { happy_var_1 -> 
	happyIn40
		 (AbsMp.DeclarationVar_declaration happy_var_1
	)}

happyReduce_39 = happySpecReduce_1  6# happyReduction_39
happyReduction_39 happy_x_1
	 =  case happyOut44 happy_x_1 of { happy_var_1 -> 
	happyIn40
		 (AbsMp.DeclarationFun_declaration happy_var_1
	)}

happyReduce_40 = happyReduce 5# 7# happyReduction_40
happyReduction_40 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut34 happy_x_2 of { happy_var_2 -> 
	case happyOut43 happy_x_3 of { happy_var_3 -> 
	case happyOut42 happy_x_5 of { happy_var_5 -> 
	happyIn41
		 (AbsMp.Var_declaration1 happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_41 = happySpecReduce_1  8# happyReduction_41
happyReduction_41 happy_x_1
	 =  happyIn42
		 (AbsMp.Type_int
	)

happyReduce_42 = happySpecReduce_1  8# happyReduction_42
happyReduction_42 happy_x_1
	 =  happyIn42
		 (AbsMp.Type_real
	)

happyReduce_43 = happySpecReduce_1  8# happyReduction_43
happyReduction_43 happy_x_1
	 =  happyIn42
		 (AbsMp.Type_bool
	)

happyReduce_44 = happyReduce 4# 9# happyReduction_44
happyReduction_44 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_2 of { happy_var_2 -> 
	case happyOut43 happy_x_4 of { happy_var_4 -> 
	happyIn43
		 (AbsMp.Array_dimensions1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_45 = happySpecReduce_0  9# happyReduction_45
happyReduction_45  =  happyIn43
		 (AbsMp.Array_dimensions2
	)

happyReduce_46 = happyReduce 8# 10# happyReduction_46
happyReduction_46 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut34 happy_x_2 of { happy_var_2 -> 
	case happyOut46 happy_x_3 of { happy_var_3 -> 
	case happyOut42 happy_x_5 of { happy_var_5 -> 
	case happyOut45 happy_x_7 of { happy_var_7 -> 
	happyIn44
		 (AbsMp.Fun_declaration1 happy_var_2 happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest}}}}

happyReduce_47 = happySpecReduce_2  11# happyReduction_47
happyReduction_47 happy_x_2
	happy_x_1
	 =  case happyOut39 happy_x_1 of { happy_var_1 -> 
	case happyOut52 happy_x_2 of { happy_var_2 -> 
	happyIn45
		 (AbsMp.Fun_block1 happy_var_1 happy_var_2
	)}}

happyReduce_48 = happySpecReduce_3  12# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut47 happy_x_2 of { happy_var_2 -> 
	happyIn46
		 (AbsMp.Param_list1 happy_var_2
	)}

happyReduce_49 = happySpecReduce_2  13# happyReduction_49
happyReduction_49 happy_x_2
	happy_x_1
	 =  case happyOut49 happy_x_1 of { happy_var_1 -> 
	case happyOut48 happy_x_2 of { happy_var_2 -> 
	happyIn47
		 (AbsMp.Parameters1 happy_var_1 happy_var_2
	)}}

happyReduce_50 = happySpecReduce_0  13# happyReduction_50
happyReduction_50  =  happyIn47
		 (AbsMp.Parameters2
	)

happyReduce_51 = happySpecReduce_3  14# happyReduction_51
happyReduction_51 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut49 happy_x_2 of { happy_var_2 -> 
	case happyOut48 happy_x_3 of { happy_var_3 -> 
	happyIn48
		 (AbsMp.More_parameters1 happy_var_2 happy_var_3
	)}}

happyReduce_52 = happySpecReduce_0  14# happyReduction_52
happyReduction_52  =  happyIn48
		 (AbsMp.More_parameters2
	)

happyReduce_53 = happyReduce 4# 15# happyReduction_53
happyReduction_53 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut34 happy_x_1 of { happy_var_1 -> 
	case happyOut50 happy_x_2 of { happy_var_2 -> 
	case happyOut42 happy_x_4 of { happy_var_4 -> 
	happyIn49
		 (AbsMp.Basic_declaration1 happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_54 = happySpecReduce_3  16# happyReduction_54
happyReduction_54 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut50 happy_x_3 of { happy_var_3 -> 
	happyIn50
		 (AbsMp.Basic_array_dimensions1 happy_var_3
	)}

happyReduce_55 = happySpecReduce_0  16# happyReduction_55
happyReduction_55  =  happyIn50
		 (AbsMp.Basic_array_dimensions2
	)

happyReduce_56 = happySpecReduce_3  17# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut53 happy_x_2 of { happy_var_2 -> 
	happyIn51
		 (AbsMp.Program_body1 happy_var_2
	)}

happyReduce_57 = happySpecReduce_1  17# happyReduction_57
happyReduction_57 happy_x_1
	 =  case happyOut53 happy_x_1 of { happy_var_1 -> 
	happyIn51
		 (AbsMp.Program_bodyProg_stmts happy_var_1
	)}

happyReduce_58 = happyReduce 6# 18# happyReduction_58
happyReduction_58 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut53 happy_x_2 of { happy_var_2 -> 
	case happyOut56 happy_x_4 of { happy_var_4 -> 
	happyIn52
		 (AbsMp.Fun_body1 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_59 = happySpecReduce_3  19# happyReduction_59
happyReduction_59 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut54 happy_x_1 of { happy_var_1 -> 
	case happyOut53 happy_x_3 of { happy_var_3 -> 
	happyIn53
		 (AbsMp.Prog_stmts1 happy_var_1 happy_var_3
	)}}

happyReduce_60 = happySpecReduce_0  19# happyReduction_60
happyReduction_60  =  happyIn53
		 (AbsMp.Prog_stmts2
	)

happyReduce_61 = happyReduce 6# 20# happyReduction_61
happyReduction_61 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_2 of { happy_var_2 -> 
	case happyOut54 happy_x_4 of { happy_var_4 -> 
	case happyOut54 happy_x_6 of { happy_var_6 -> 
	happyIn54
		 (AbsMp.Prog_stmt1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_62 = happyReduce 4# 20# happyReduction_62
happyReduction_62 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_2 of { happy_var_2 -> 
	case happyOut54 happy_x_4 of { happy_var_4 -> 
	happyIn54
		 (AbsMp.Prog_stmt2 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_63 = happySpecReduce_2  20# happyReduction_63
happyReduction_63 happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_2 of { happy_var_2 -> 
	happyIn54
		 (AbsMp.Prog_stmt3 happy_var_2
	)}

happyReduce_64 = happySpecReduce_3  20# happyReduction_64
happyReduction_64 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut55 happy_x_1 of { happy_var_1 -> 
	case happyOut56 happy_x_3 of { happy_var_3 -> 
	happyIn54
		 (AbsMp.Prog_stmt4 happy_var_1 happy_var_3
	)}}

happyReduce_65 = happySpecReduce_2  20# happyReduction_65
happyReduction_65 happy_x_2
	happy_x_1
	 =  case happyOut56 happy_x_2 of { happy_var_2 -> 
	happyIn54
		 (AbsMp.Prog_stmt5 happy_var_2
	)}

happyReduce_66 = happySpecReduce_3  20# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut38 happy_x_2 of { happy_var_2 -> 
	happyIn54
		 (AbsMp.Prog_stmt6 happy_var_2
	)}

happyReduce_67 = happySpecReduce_2  21# happyReduction_67
happyReduction_67 happy_x_2
	happy_x_1
	 =  case happyOut34 happy_x_1 of { happy_var_1 -> 
	case happyOut43 happy_x_2 of { happy_var_2 -> 
	happyIn55
		 (AbsMp.Identifier1 happy_var_1 happy_var_2
	)}}

happyReduce_68 = happySpecReduce_3  22# happyReduction_68
happyReduction_68 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut56 happy_x_1 of { happy_var_1 -> 
	case happyOut57 happy_x_3 of { happy_var_3 -> 
	happyIn56
		 (AbsMp.Expr1 happy_var_1 happy_var_3
	)}}

happyReduce_69 = happySpecReduce_1  22# happyReduction_69
happyReduction_69 happy_x_1
	 =  case happyOut57 happy_x_1 of { happy_var_1 -> 
	happyIn56
		 (AbsMp.ExprBint_term happy_var_1
	)}

happyReduce_70 = happySpecReduce_3  23# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut57 happy_x_1 of { happy_var_1 -> 
	case happyOut58 happy_x_3 of { happy_var_3 -> 
	happyIn57
		 (AbsMp.Bint_term1 happy_var_1 happy_var_3
	)}}

happyReduce_71 = happySpecReduce_1  23# happyReduction_71
happyReduction_71 happy_x_1
	 =  case happyOut58 happy_x_1 of { happy_var_1 -> 
	happyIn57
		 (AbsMp.Bint_termBint_factor happy_var_1
	)}

happyReduce_72 = happySpecReduce_2  24# happyReduction_72
happyReduction_72 happy_x_2
	happy_x_1
	 =  case happyOut58 happy_x_2 of { happy_var_2 -> 
	happyIn58
		 (AbsMp.Bint_factor1 happy_var_2
	)}

happyReduce_73 = happySpecReduce_3  24# happyReduction_73
happyReduction_73 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	case happyOut59 happy_x_2 of { happy_var_2 -> 
	case happyOut60 happy_x_3 of { happy_var_3 -> 
	happyIn58
		 (AbsMp.Bint_factor2 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_74 = happySpecReduce_1  24# happyReduction_74
happyReduction_74 happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	happyIn58
		 (AbsMp.Bint_factorInt_expr happy_var_1
	)}

happyReduce_75 = happySpecReduce_1  25# happyReduction_75
happyReduction_75 happy_x_1
	 =  happyIn59
		 (AbsMp.Compare_op1
	)

happyReduce_76 = happySpecReduce_1  25# happyReduction_76
happyReduction_76 happy_x_1
	 =  happyIn59
		 (AbsMp.Compare_op2
	)

happyReduce_77 = happySpecReduce_1  25# happyReduction_77
happyReduction_77 happy_x_1
	 =  happyIn59
		 (AbsMp.Compare_op3
	)

happyReduce_78 = happySpecReduce_1  25# happyReduction_78
happyReduction_78 happy_x_1
	 =  happyIn59
		 (AbsMp.Compare_op4
	)

happyReduce_79 = happySpecReduce_1  25# happyReduction_79
happyReduction_79 happy_x_1
	 =  happyIn59
		 (AbsMp.Compare_op5
	)

happyReduce_80 = happySpecReduce_3  26# happyReduction_80
happyReduction_80 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut60 happy_x_1 of { happy_var_1 -> 
	case happyOut61 happy_x_2 of { happy_var_2 -> 
	case happyOut62 happy_x_3 of { happy_var_3 -> 
	happyIn60
		 (AbsMp.Int_expr1 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_81 = happySpecReduce_1  26# happyReduction_81
happyReduction_81 happy_x_1
	 =  case happyOut62 happy_x_1 of { happy_var_1 -> 
	happyIn60
		 (AbsMp.Int_exprInt_term happy_var_1
	)}

happyReduce_82 = happySpecReduce_1  27# happyReduction_82
happyReduction_82 happy_x_1
	 =  happyIn61
		 (AbsMp.Addop1
	)

happyReduce_83 = happySpecReduce_1  27# happyReduction_83
happyReduction_83 happy_x_1
	 =  happyIn61
		 (AbsMp.Addop2
	)

happyReduce_84 = happySpecReduce_3  28# happyReduction_84
happyReduction_84 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut62 happy_x_1 of { happy_var_1 -> 
	case happyOut63 happy_x_2 of { happy_var_2 -> 
	case happyOut64 happy_x_3 of { happy_var_3 -> 
	happyIn62
		 (AbsMp.Int_term1 happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_85 = happySpecReduce_1  28# happyReduction_85
happyReduction_85 happy_x_1
	 =  case happyOut64 happy_x_1 of { happy_var_1 -> 
	happyIn62
		 (AbsMp.Int_termInt_factor happy_var_1
	)}

happyReduce_86 = happySpecReduce_1  29# happyReduction_86
happyReduction_86 happy_x_1
	 =  happyIn63
		 (AbsMp.Mulop1
	)

happyReduce_87 = happySpecReduce_1  29# happyReduction_87
happyReduction_87 happy_x_1
	 =  happyIn63
		 (AbsMp.Mulop2
	)

happyReduce_88 = happySpecReduce_3  30# happyReduction_88
happyReduction_88 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut56 happy_x_2 of { happy_var_2 -> 
	happyIn64
		 (AbsMp.Int_factor1 happy_var_2
	)}

happyReduce_89 = happyReduce 5# 30# happyReduction_89
happyReduction_89 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut34 happy_x_3 of { happy_var_3 -> 
	case happyOut50 happy_x_4 of { happy_var_4 -> 
	happyIn64
		 (AbsMp.Int_factor2 happy_var_3 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_90 = happyReduce 4# 30# happyReduction_90
happyReduction_90 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_3 of { happy_var_3 -> 
	happyIn64
		 (AbsMp.Int_factor3 happy_var_3
	) `HappyStk` happyRest}

happyReduce_91 = happyReduce 4# 30# happyReduction_91
happyReduction_91 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_3 of { happy_var_3 -> 
	happyIn64
		 (AbsMp.Int_factor4 happy_var_3
	) `HappyStk` happyRest}

happyReduce_92 = happyReduce 4# 30# happyReduction_92
happyReduction_92 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut56 happy_x_3 of { happy_var_3 -> 
	happyIn64
		 (AbsMp.Int_factor5 happy_var_3
	) `HappyStk` happyRest}

happyReduce_93 = happySpecReduce_2  30# happyReduction_93
happyReduction_93 happy_x_2
	happy_x_1
	 =  case happyOut34 happy_x_1 of { happy_var_1 -> 
	case happyOut65 happy_x_2 of { happy_var_2 -> 
	happyIn64
		 (AbsMp.Int_factor6 happy_var_1 happy_var_2
	)}}

happyReduce_94 = happySpecReduce_1  30# happyReduction_94
happyReduction_94 happy_x_1
	 =  case happyOut35 happy_x_1 of { happy_var_1 -> 
	happyIn64
		 (AbsMp.Int_factorInteger happy_var_1
	)}

happyReduce_95 = happySpecReduce_1  30# happyReduction_95
happyReduction_95 happy_x_1
	 =  case happyOut36 happy_x_1 of { happy_var_1 -> 
	happyIn64
		 (AbsMp.Int_factorDouble happy_var_1
	)}

happyReduce_96 = happySpecReduce_1  30# happyReduction_96
happyReduction_96 happy_x_1
	 =  happyIn64
		 (AbsMp.Int_factor_true
	)

happyReduce_97 = happySpecReduce_1  30# happyReduction_97
happyReduction_97 happy_x_1
	 =  happyIn64
		 (AbsMp.Int_factor_false
	)

happyReduce_98 = happySpecReduce_2  30# happyReduction_98
happyReduction_98 happy_x_2
	happy_x_1
	 =  case happyOut64 happy_x_2 of { happy_var_2 -> 
	happyIn64
		 (AbsMp.Int_factor7 happy_var_2
	)}

happyReduce_99 = happySpecReduce_3  31# happyReduction_99
happyReduction_99 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut66 happy_x_2 of { happy_var_2 -> 
	happyIn65
		 (AbsMp.Modifier_list1 happy_var_2
	)}

happyReduce_100 = happySpecReduce_1  31# happyReduction_100
happyReduction_100 happy_x_1
	 =  case happyOut43 happy_x_1 of { happy_var_1 -> 
	happyIn65
		 (AbsMp.Modifier_listArray_dimensions happy_var_1
	)}

happyReduce_101 = happySpecReduce_2  32# happyReduction_101
happyReduction_101 happy_x_2
	happy_x_1
	 =  case happyOut56 happy_x_1 of { happy_var_1 -> 
	case happyOut67 happy_x_2 of { happy_var_2 -> 
	happyIn66
		 (AbsMp.Arguments1 happy_var_1 happy_var_2
	)}}

happyReduce_102 = happySpecReduce_0  32# happyReduction_102
happyReduction_102  =  happyIn66
		 (AbsMp.Arguments2
	)

happyReduce_103 = happySpecReduce_3  33# happyReduction_103
happyReduction_103 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut56 happy_x_2 of { happy_var_2 -> 
	case happyOut67 happy_x_3 of { happy_var_3 -> 
	happyIn67
		 (AbsMp.More_arguments1 happy_var_2 happy_var_3
	)}}

happyReduce_104 = happySpecReduce_0  33# happyReduction_104
happyReduction_104  =  happyIn67
		 (AbsMp.More_arguments2
	)

happyNewToken action sts stk [] =
	happyDoAction 47# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TS _ 41) -> cont 41#;
	PT _ (TS _ 42) -> cont 42#;
	PT _ (TS _ 43) -> cont 43#;
	PT _ (TV happy_dollar_dollar) -> cont 44#;
	PT _ (TI happy_dollar_dollar) -> cont 45#;
	PT _ (TD happy_dollar_dollar) -> cont 46#;
	_ -> happyError' (tk:tks)
	}

happyError_ 47# tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pProg tks = happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut37 x))

pBlock tks = happySomeParser where
  happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (happyOut38 x))

pDeclarations tks = happySomeParser where
  happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (happyOut39 x))

pDeclaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (happyOut40 x))

pVar_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (happyOut41 x))

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (happyOut42 x))

pArray_dimensions tks = happySomeParser where
  happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (happyOut43 x))

pFun_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (happyOut44 x))

pFun_block tks = happySomeParser where
  happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (happyOut45 x))

pParam_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (happyOut46 x))

pParameters tks = happySomeParser where
  happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (happyOut47 x))

pMore_parameters tks = happySomeParser where
  happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (happyOut48 x))

pBasic_declaration tks = happySomeParser where
  happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (happyOut49 x))

pBasic_array_dimensions tks = happySomeParser where
  happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (happyOut50 x))

pProgram_body tks = happySomeParser where
  happySomeParser = happyThen (happyParse 14# tks) (\x -> happyReturn (happyOut51 x))

pFun_body tks = happySomeParser where
  happySomeParser = happyThen (happyParse 15# tks) (\x -> happyReturn (happyOut52 x))

pProg_stmts tks = happySomeParser where
  happySomeParser = happyThen (happyParse 16# tks) (\x -> happyReturn (happyOut53 x))

pProg_stmt tks = happySomeParser where
  happySomeParser = happyThen (happyParse 17# tks) (\x -> happyReturn (happyOut54 x))

pIdentifier tks = happySomeParser where
  happySomeParser = happyThen (happyParse 18# tks) (\x -> happyReturn (happyOut55 x))

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse 19# tks) (\x -> happyReturn (happyOut56 x))

pBint_term tks = happySomeParser where
  happySomeParser = happyThen (happyParse 20# tks) (\x -> happyReturn (happyOut57 x))

pBint_factor tks = happySomeParser where
  happySomeParser = happyThen (happyParse 21# tks) (\x -> happyReturn (happyOut58 x))

pCompare_op tks = happySomeParser where
  happySomeParser = happyThen (happyParse 22# tks) (\x -> happyReturn (happyOut59 x))

pInt_expr tks = happySomeParser where
  happySomeParser = happyThen (happyParse 23# tks) (\x -> happyReturn (happyOut60 x))

pAddop tks = happySomeParser where
  happySomeParser = happyThen (happyParse 24# tks) (\x -> happyReturn (happyOut61 x))

pInt_term tks = happySomeParser where
  happySomeParser = happyThen (happyParse 25# tks) (\x -> happyReturn (happyOut62 x))

pMulop tks = happySomeParser where
  happySomeParser = happyThen (happyParse 26# tks) (\x -> happyReturn (happyOut63 x))

pInt_factor tks = happySomeParser where
  happySomeParser = happyThen (happyParse 27# tks) (\x -> happyReturn (happyOut64 x))

pModifier_list tks = happySomeParser where
  happySomeParser = happyThen (happyParse 28# tks) (\x -> happyReturn (happyOut65 x))

pArguments tks = happySomeParser where
  happySomeParser = happyThen (happyParse 29# tks) (\x -> happyReturn (happyOut66 x))

pMore_arguments tks = happySomeParser where
  happySomeParser = happyThen (happyParse 30# tks) (\x -> happyReturn (happyOut67 x))

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 19 "<built-in>" #-}
{-# LINE 1 "/usr/local/Cellar/ghc/7.10.3b/lib/ghc-7.10.3/include/ghcversion.h" #-}


















{-# LINE 20 "<built-in>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 


{-# LINE 13 "templates/GenericTemplate.hs" #-}





-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif

{-# LINE 46 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList






{-# LINE 67 "templates/GenericTemplate.hs" #-}


{-# LINE 77 "templates/GenericTemplate.hs" #-}










infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          

          case action of
                0#           -> {- nothing -}
                                     happyFail i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     

                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = indexShortOffAddr happyActOffsets st
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st


indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)


{-# LINE 170 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = indexShortOffAddr happyGotoOffsets st1
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i



          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = indexShortOffAddr happyGotoOffsets st
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

