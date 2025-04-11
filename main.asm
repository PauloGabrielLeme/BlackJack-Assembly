; Definindo rand8reg na memória de dados, no endereço 30h
rand8reg  EQU 30h    ; rand8reg é mapeado para o endereço 30h de memória

rand8:
    mov a, rand8reg    ; Move o valor de rand8reg para o acumulador (A)
    jnz rand8b         ; Se A não for zero, vai para rand8b
    cpl a              ; Complementa os bits do acumulador
    mov rand8reg, a    ; Armazena o valor de A em rand8reg
rand8b:
    anl a, #0xB8       ; Realiza a operação AND com 10111000b (0xB8)
    mov c, p           ; Move o valor do bit de carry para o bit C
    mov a, rand8reg    ; Move rand8reg para A
    rlc a              ; Rotaciona os bits de A para a esquerda com carry
    mov rand8reg, a    ; Armazena o novo valor de A em rand8reg
    ret                ; Retorna da função
