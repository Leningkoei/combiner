main.lisp	= ./src/main.lisp
compiler.lisp	= ./compiler.lisp

compiler:	src/main.lisp	\
		compiler.lisp	\
		bin/
	ros run	--eval '(load "$(main.lisp)")'		\
		--eval '(load "$(compiler.lisp)")'	\
		--eval '(run-compiler)'			\
		--eval '(quit)'

bin/:
	mkdir	bin

clean:	bin/
	rm -r	bin/
