# AtividadeEngSoftware
aplicação dos padrões de projeto.

# Builder Pattern Example

## Problema Resolvido
O padrão Builder resolve o problema de criar objetos complexos com múltiplas opções de configuração. Ele evita:
1. Construtores longos e difíceis de entender.
2. Necessidade de configurar o objeto diretamente após a criação, tornando o código mais limpo e seguro.

## Estrutura
Este exemplo cria um vetor configurável com as seguintes etapas:
1. **Definir o tamanho do vetor**.
2. **Definir o valor inicial de todos os elementos**.
3. **Construir o vetor final** usando o Builder.

### Diagrama UML
+------------------+           +--------------------+
|     Builder      |<>-------->|    Product         |
+------------------+           +--------------------+
| + setSize()      |           | + vector<int> vec  |
| + setInitialVal()|           |                    |
| + build()        |           |                    |
+------------------+           +--------------------+
         ^
         |
+-------------------+
| VectorBuilder     |
+-------------------+
| - size            |
| - initialVal      |
+-------------------+


## Como Executar
1. Compile o código:
   ```bash
   g++ builder.cpp -o builder

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
+------------------+       +------------------+
|  VectorAdapter   |       |     Client       |
+------------------+       +------------------+
| + createVector() |<----> | - Uses Vector    |
| + printVector()  |       |                  |
| + destructor     |       +------------------+
+------------------+       


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
+------------------+           +-------------------+
|     Iterable     |<>-------->|     Iterator      |
+------------------+           +-------------------+
| + createIterator()|          | + hasNext()       |
+------------------+           | + next()          |
                               | + current()       |
                               +-------------------+
                                     ^
                                     |
                       +-------------+-------------+
                       |                           |
           +--------------------+        +--------------------+
           |   VectorIterable   |        |   VectorIterator   |
           +--------------------+        +--------------------+
           | - vector<int> vec  |        | - currentIndex     |
           +--------------------+        +--------------------+


## Como Executar
1. Compile o código:
   ```bash
   g++ iterator.cpp -o iterator

