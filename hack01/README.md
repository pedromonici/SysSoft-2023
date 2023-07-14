# Membros:

Pedro Henrique Borges Monici - 10816732

Matheus Luis Oliveira da Silva -

Gabriel Victor Cardoso Fernandes -

Rodrigo Lopes Assaf -

Guilherme Machado Rios - 11222839


## Primeira Parte - A Função authorize():

Primeiramente temos de contornar o problema de autenticação.
Para isso, foi analisado o programa docrypt com o auxilio da ferramenta
objdump (`objdump -d docrypt | less`) para inspecionar o assembly do programa.

Após isso, foi percebido que existe uma função authorize() que é chamada na
main() do programa. Essa função não está presente no código do programa.
Portanto, investigamos a biblioteca dinâmica libauth.so e la estava a função.
Depois de analisar o código da função, percebemos que ao final de todas as
verificações, ela simplesmente retorna um valor inteiro de confimação de
validade.

Portanto, para burlar o procedimento, seria através da emulação
de um valor verdade igual ao retornado. Dessa forma, iremos modificar a
função authorize() para simplesmente retornar o valor de confirmação de
validade.

Para isso, foi criado um Makefile para realizar esse redirecionamento para a
nova função authorize(). Apenas é necessário fazer o comando `make all`

## Segunda Parte - chave de decriptação:

Analisando o programa encrypt, com o auxílio do objdump foi verificado
que a senha de criptográfica está embutida no próprio binário do programa.
Para isso, foi analisado a diretiva data do assembly do programa encrypt onde
foi possível encontrar o <encrypt_key> que possuia os valores em hexadecimais
65 61 73 79, e quando convertemos isso para char temos a string 'easy'.

O comando run do programa Makefile ja coloca essa chave na execução do decrypt.
Dessa forma, para executar o programa apenas é necessário rodar `make run`

## Recomendações de melhorias para evitar essa vulnerabilidade

* Evitar o uso de chaves criptográficas como strings estáticas, pois são
facilmente inspecionáveis na seção correspondente de dados. Em vez disso,
considere o uso de variáveis globais ou variáveis inicializadas posteriormente,
a fim de dificultar o acesso não autorizado.

* Realizar uma verificação rigorosa da origem das funções utilizadas em tempo
de execução, especialmente em casos de vinculação dinâmica. Isso ajudará a
prevenir ataques de redirecionamento de funções e a inserção de software malicioso.
