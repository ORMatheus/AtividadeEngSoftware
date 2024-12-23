#include <iostream>
#include <vector>

// Produto final: o vetor configurável
class ConfigurableVector {
private:
    std::vector<int> vec;

public:
    ConfigurableVector(int size, int initialValue) : vec(size, initialValue) {}

    void printVector() const {
        for (int val : vec) {
            std::cout << val << " ";
        }
        std::cout << std::endl;
    }
};

// Builder para criar um ConfigurableVector
class VectorBuilder {
private:
    int size;
    int initialValue;

public:
    // Métodos para configuração
    VectorBuilder& setSize(int s) {
        size = s;
        return *this;
    }

    VectorBuilder& setInitialValue(int val) {
        initialValue = val;
        return *this;
    }

    // Método para construir o objeto final
    ConfigurableVector build() const {
        return ConfigurableVector(size, initialValue);
    }
};

int main() {
    std::cout << "Digite o tamanho do vetor: ";
    int size;
    std::cin >> size;

    std::cout << "Digite o valor inicial para o vetor: ";
    int initialValue;
    std::cin >> initialValue;

    // Usando o Builder para criar o vetor configurável
    ConfigurableVector myVector = VectorBuilder()
                                    .setSize(size)
                                    .setInitialValue(initialValue)
                                    .build();

    std::cout << "Vetor criado: ";
    myVector.printVector();

    return 0;
}

//com base no codigo do https://refactoring.guru/design-patterns/builder
