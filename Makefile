all:
	@./bin/build_fisher.sh ${LDC2010T04}
	@./bin/build_callhome.sh ${LDC96T17}

clean:
	@rm corpora/ldc/*.es
