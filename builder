implementação do builder no meu codigo com base no https://refactoring.guru/design-patterns/builder
// ListaSequencial.h
#ifndef LISTASEQUENCIAL_H
#define LISTASEQUENCIAL_H

class ListaSequencial {
private:
    int *elementos;
    int tamanhoAtual;
    int capacidade;

    // Construtor privado para ser usado pelo Builder
    ListaSequencial(int capacidadeInicial);

    friend class ListaSequencialBuilder;

public:
    ~ListaSequencial();

    bool inserir(int elemento);
    bool remover(int indice);
    int buscar(int elemento);
    void imprimir();
    bool empty();
    bool isfull();
    int list_get_available();
};

class ListaSequencialBuilder {
private:
    int capacidade;

public:
    ListaSequencialBuilder();
    ListaSequencialBuilder &setCapacidade(int capacidade);
    ListaSequencial *build();
};

#endif

// ListaSequencial.cpp
#include "ListaSequencial.h"
#include <iostream>
using namespace std;

// Construtor privado
ListaSequencial::ListaSequencial(int capacidadeInicial) {
    this->capacidade = capacidadeInicial;
    this->elementos = new int[capacidadeInicial];
    this->tamanhoAtual = 0;
}

ListaSequencial::~ListaSequencial() {
    delete[] elementos;
}

bool ListaSequencial::inserir(int elemento) {
    if (tamanhoAtual >= capacidade) {
        return false; // Lista cheia
    }
    elementos[tamanhoAtual++] = elemento;
    return true;
}

bool ListaSequencial::remover(int indice) {
    if (indice < 0 || indice >= tamanhoAtual) {
        return false; // Índice inválido
    }
    for (int i = indice; i < tamanhoAtual - 1; i++) {
        elementos[i] = elementos[i + 1];
    }
    tamanhoAtual--;
    return true;
}

int ListaSequencial::buscar(int elemento) {
    for (int i = 0; i < tamanhoAtual; i++) {
        if (elementos[i] == elemento) {
            return i;
        }
    }
    return -1; // Não encontrado
}

void ListaSequencial::imprimir() {
    for (int i = 0; i < tamanhoAtual; i++) {
        cout << elementos[i] << " ";
    }
    cout << endl;
}

bool ListaSequencial::empty() {
    return tamanhoAtual == 0;
}

bool ListaSequencial::isfull() {
    return tamanhoAtual == capacidade;
}

int ListaSequencial::list_get_available() {
    return capacidade - tamanhoAtual;
}

// Implementação do Builder
ListaSequencialBuilder::ListaSequencialBuilder() : capacidade(10) {}

ListaSequencialBuilder &ListaSequencialBuilder::setCapacidade(int capacidade) {
    this->capacidade = capacidade;
    return *this;
}

ListaSequencial *ListaSequencialBuilder::build() {
    return new ListaSequencial(capacidade);
}

#include "ListaSequencial.h"
#include <iostream>
using namespace std;

int main() {
    ListaSequencialBuilder builder;
    ListaSequencial *lista = builder.setCapacidade(5).build();

    cout << "Lista está vazia? " << (lista->empty() ? "Sim" : "Não") << endl;

    lista->inserir(10);
    lista->inserir(20);
    lista->inserir(30);

    cout << "Lista após inserções: ";
    lista->imprimir();

    cout << "Lista está cheia? " << (lista->isfull() ? "Sim" : "Não") << endl;

    cout << "Espaços disponíveis: " << lista->list_get_available() << endl;

    lista->remover(1);
    cout << "Lista após remoção: ";
    lista->imprimir();

    delete lista;

    return 0;
}

