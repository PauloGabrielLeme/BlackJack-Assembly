; Definindo rand8reg na memória de dados, no endereço 30h
rand8reg  EQU 30h    ; rand8reg é mapeado para o endereço 30h de memória

rand8:
    mov a, rand8reg
    jnz rand8b
    cpl a
    mov rand8reg, a

rand8b:
    anl a, #0xB8
    mov c, p
    mov a, rand8reg
    rlc a
    mov rand8reg, a

; A essa altura, o valor está em A. Agora limitamos até 56.
; Vamos fazer: enquanto A >= 15, repetir o algoritmo.

rand8_limit:
    mov a, rand8reg
    cjne a, #15, check_less
    sjmp rand8             ; Repetir se for igual a 15
check_less:
    jc rand8_done          ; JC é "jump if carry", ou seja, A < 15
    sjmp rand8             ; Se não for menor, repetir o algoritmo

rand8_done:
    ; Aqui o valor em A estará de 0 a 14
    ret


