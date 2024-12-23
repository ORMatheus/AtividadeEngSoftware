# AtividadeEngSoftware
aplicação dos padrões de projeto.

O Builder é útil para construir objetos complexos, mas neste caso também pode ser usado para encapsular a lógica de construção da lista sequencial com configurações adicionais.

Essa abordagem encapsula o processo de criação do objeto e permite a adição futura de configurações mais complexas sem modificar diretamente a classe ListaSequencial.

# Adapter Pattern Example

## Problema Resolvido
O padrão Adapter foi aplicado para encapsular a manipulação de vetores alocados dinamicamente em uma classe moderna. Isso resolve o problema de:
1. Gerenciamento manual de memória.
2. Interface menos intuitiva para trabalhar com vetores alocados dinamicamente em C.
3. Possibilidade de uso de APIs modernas que exigem classes encapsuladas.

## Estrutura
O código original criava e manipulava um vetor utilizando alocação dinâmica (`malloc`) e ponteiros. O Adapter substitui isso por uma classe `VectorAdapter` baseada em `std::vector`, que fornece:
- Inicialização automática.
- Funções para manipulação de elementos (`setValue`).
- Métodos para exibição (`printVector`).

### Diagrama UML
![Diagrama UML](uml_diagram.png)

## Como Executar
1. Compile o código:
   ```bash
   g++ adapter.cpp -o adapter


# Iterator Pattern Example

## Problema Resolvido
O padrão Iterator resolve o problema de percorrer os elementos de uma coleção sem expor sua implementação interna. Ele fornece:
- **Abstração**: Encapsula a lógica de iteração.
- **Consistência**: Interface uniforme para navegação.
- **Modularidade**: Facilita mudanças na implementação sem impacto no código cliente.

## Estrutura
A implementação substitui o acesso direto ao vetor por um iterador, que:
1. Navega pelos elementos de forma encapsulada.
2. Oferece métodos como `hasNext()`, `next()` e `current()`.
3. Melhora a modularidade e segurança do código.

### Diagrama UML
![Diagrama UML](uml_diagram.png)

## Como Executar
1. Compile o código:
   ```bash
   g++ iterator.cpp -o iterator

