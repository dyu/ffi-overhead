all:
	ocamlopt -o test.nat ../newplus/plus.o mlplus.c plus_ml.ml
	ocamlc -o test.bc -custom ../newplus/plus.o mlplus.c plus_ml.ml
