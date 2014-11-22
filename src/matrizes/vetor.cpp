#include "matrizes.h"
#include <stdexcept>

double tnw::Vetor::operator()(unsigned i) const {
	if (i < tamanho)
		return v[i];
	throw std::out_of_range("Argumento fora do tamanho");
}
double& tnw::Vetor::operator()(unsigned i) {
	if (i < tamanho)
		return v[i];
	throw std::out_of_range("Argumento fora do tamanho");
}

unsigned tnw::Vetor::getTamanho() const {
	return tamanho;
}

std::string tnw::Vetor::toString() const {
	std::string output,aux;
	for (unsigned i = 0; i < tamanho; ++i)
	{
		output += "| ";
		aux = std::to_string(v[i]);
		aux.erase(aux.find_last_not_of('0') + 1, std::string::npos);
		if(aux.back() == '.') aux.pop_back();
		output+= aux + " ";
		output += "|\n";
	}
	return output;
}

tnw::Vetor::Vetor(unsigned n) {
	tamanho = n;
	for (unsigned i = 0; i < n; ++i)
		v.push_back(0);
}
tnw::Vetor::Vetor(std::initializer_list<double> l) {
	tamanho = l.size();
	v.insert(v.end(), l.begin(), l.end());
}