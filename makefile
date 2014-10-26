# usando g++ como compilador
CC = g++

# compiler flags:
#  -g        adiciona informações de debug no executável
#  -Wall     ativa a maioria dos erros de compilação
#  -std=c+11 usa o standard mais recente
CFLAGS  = -g -Wall -std=c++11 -L bin

default: clean all

teste: bin/teste.o bin/metodosNumericos.o bin/tempo.o bin/libfuncoes.a
	$(CC) $(CFLAGS) -o bin/teste bin/teste.o bin/metodosNumericos.o bin/tempo.o -lfuncoes
	bin/teste | less

testeAchador: bin/testeAchador.o bin/tempo.o bin/metodosNumericos.o bin/libfuncoes.a
	$(CC) $(CFLAGS) -o bin/testeAchador bin/testeAchador.o bin/metodosNumericos.o bin/tempo.o -lfuncoes
	bin/testeAchador | less

testeTabela: bin/testeTabela.o bin/aplicacoes.o bin/tabela.o bin/metodosNumericos.o bin/tempo.o bin/libfuncoes.a
	$(CC) $(CFLAGS) -o bin/testeTabela bin/testeTabela.o bin/tabela.o bin/aplicacoes.o  bin/metodosNumericos.o bin/tempo.o -lfuncoes
	bin/testeTabela

bin/teste.o: src/teste.cpp src/funções/funcoes.h src/métodos/metodosNumericos.h
	$(CC) $(CFLAGS) -c src/teste.cpp -o bin/teste.o

bin/testeAchador.o: src/testeAchador.cpp src/funções/funcoes.h src/métodos/metodosNumericos.h
	$(CC) $(CFLAGS) -c src/testeAchador.cpp -o bin/testeAchador.o

bin/testeTabela.o: src/testeTabela.cpp src/aplicações/aplicacoes.h
	$(CC) $(CFLAGS) -c src/testeTabela.cpp -o bin/testeTabela.o

bin/libfuncoes.a:
	$(CC) $(CFLAGS) -c src/funções/implementadas/exponencial.cpp -o bin/exponencial.o
	$(CC) $(CFLAGS) -c src/funções/implementadas/funcaoReal.cpp -o bin/funcaoReal.o
	$(CC) $(CFLAGS) -c src/funções/implementadas/funcoesReais.cpp -o bin/funcoesReais.o
	$(CC) $(CFLAGS) -c src/funções/implementadas/identidade.cpp -o bin/identidade.o
	$(CC) $(CFLAGS) -c src/funções/implementadas/polinomios.cpp -o bin/polinomios.o
	$(CC) $(CFLAGS) -c src/funções/operadores.cpp -o bin/operadores.o
	ar rvs bin/libfuncoes.a bin/exponencial.o bin/funcaoReal.o bin/funcoesReais.o bin/identidade.o bin/polinomios.o bin/operadores.o
	rm bin/exponencial.o bin/funcaoReal.o bin/funcoesReais.o bin/identidade.o bin/polinomios.o bin/operadores.o

bin/metodosNumericos.o: src/métodos/metodosNumericos.cpp src/métodos/metodosNumericos.h src/funções/funcoesReais.h
	$(CC) $(CFLAGS) -c src/métodos/metodosNumericos.cpp -o bin/metodosNumericos.o

bin/aplicacoes.o: bin/tabela.o src/aplicações/aplicacoes.cpp src/aplicações/aplicacoes.h src/funções/funcoes.h src/métodos/metodosNumericos.h src/auxiliar/tabela.h
	$(CC) $(CFLAGS) -c src/aplicações/aplicacoes.cpp -o bin/aplicacoes.o

bin/tempo.o: src/auxiliar/tempo.cpp
	$(CC) $(CFLAGS) -c src/auxiliar/tempo.cpp -o bin/tempo.o

bin/tabela.o: src/auxiliar/tabela.cpp src/auxiliar/tabela.h
	$(CC) $(CFLAGS) -c src/auxiliar/tabela.cpp -o bin/tabela.o

clean:
	-rm -f bin/*