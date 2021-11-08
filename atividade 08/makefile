calc: html5.y html5.l
	bison -d html5.y --debug
	flex -o html5.l.c html5.l
	gcc -o html5 html5.l.c html5.tab.c -ll -lm 

clean:
	rm -f *.c *.h html5

