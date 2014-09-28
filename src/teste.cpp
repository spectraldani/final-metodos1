#include "funções/funcoesReais.h"
#include <cstdio>
#include <iostream>
#include <memory>
#include <cmath>

using namespace tnw::op;

int main(int argc, char const *argv[])
{
	printf("\nTeste de Sanidade!\n");
	printf("Função f(x) = x²-3\n");

	auto f = newFun(tnw::Polinomio({-3,0,1}));

	printf("f(1) = %lf\n", f->eval(1));
	printf("f(2) = %lf\n", f->eval(2));
	printf("f(1.7320508) = %le ~= 0\n", f->eval(1.7320508));
	printf("∫f(x) dx;[1,2] = %lf ~= -0.66667\n", f->evalIntegral(1,2));
	printf("f(x) = %s\n", f->toString().c_str());

	printf("\nFunção f(x) = e^(x^2)\n");
	f = compose(newFun(tnw::Exponencial()),newFun(tnw::Polinomio({0,0,1})));

	printf("f(1) = %lf ~= 2.7182\n", f->eval(1));
	printf("f(2) = %lf ~= 54.5981\n", f->eval(2));
	printf("∫f(x) dx;[1,2] = %lf ~= 14.99\n", f->evalIntegral(1,2));
	printf("f(x) = %s\n", f->toString().c_str());

	printf("\nFunção f(x) = e^(2x+3x^2)\n");
	f = compose(newFun(tnw::Exponencial()),newFun(tnw::Polinomio({0,2,3})));

	printf("f(0.4) = %lf ~= 3.59664\n", f->eval(0.4));
	printf("f'(0.4) = %lf ~= 15.8252\n", f->evalDerivada(0.4));
	printf("f(x) = %s\n", f->toString().c_str());

	printf("\nFunção f(x) = sin(x)\n");
	f = newFun(tnw::FuncaoExistente(std::sin,"sin"));

	printf("f(2) = %lf\n",f->eval(2));
	printf("f'(2) = %lf ~= -0.416147\n", f->evalDerivada(2));
	printf("∫f(x) dx;[0,pi] = %lf ~= 2\n", f->evalIntegral(0,3.1416));
	printf("f(x) = %s\n", f->toString().c_str());

	return 0;
}