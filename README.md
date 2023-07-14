# Nome da materia
- Gabriel Victor - 11878296
- Pedro Monici - 10816732
- 

## Soluçao do exercicio 1

[Encontra-se no readme da pasta hack01](./hack01/README.md)

## Solucao do exercicio 2

### b - Explain the illustrated return-oriented exploit

Como o binário é compilado a flag `-z execstack`, o bit de proteção contra execução na stack está
desabilitado. Isso permite que escrevamos o seguinte input:
- shellcode, código malicioso que vamos executar, precedido de NOP Sled
- padding, para alcançar o final do buffer
- endereço de retorno, apontando para o nosso buffer de forma que o shellcode seja executado

### c - The example runs within the debugger but not outside it, due to the security mechanisms implemented by the runtime. Explain those mechanisms, including address-space layout randomization, stack protector (canary).

O Address Space Layout Randomization (ASLR), é uma medida de segurança em binários que aleatoriza o endereço base das regiões de memória
do programa, por exemplo o endereço base da heap. Esses endereços, então, recebem valores diferentes a cada execução, o que torna um script "estático",
em que os endereços vulneráveis ou utilizados maliciosamente são hardcodados, insuficiente para atacar binários com essa proteção.

Já o stack canary consiste de um valor aleatório inserido entre a stack frame de cada função e o endereço de retorno - ao entrar na função esse valor é 
armazenado em uma região de memoria e, antes da função retornar, o seu valor é checado entre o valor na stack e o armazenado. Caso o valor seja 
diferente, pode-se afirmar que a stack foi corrompida.

A lógica por trás desse mecanismo é que se o atacante quer sobrescrever o endereço de retorno, ele terá que sobrescrever o endereço do canário também, mas, por esse valor ser aleatório e grande (64 bits), a chance de acerta-lo é ínfima.