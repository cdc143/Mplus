all:
	happy -gca ParMp.y
	alex -g LexMp.x
	ghc --make TestMp.hs -o TestMp

clean:
	-rm -f *.log *.aux *.hi *.o *.dvi

distclean: clean
	-rm -f DocMp.* LexMp.* LayoutMp.* SkelMp.* PrintMp.* TestMp.* AbsMp.* TestMp ErrM.* SharedString.* ComposOp.* Mp.dtd XMLMp.* Makefile*
	

