; Definição dos endereços
carta1_1 EQU 00h
carta2_1 EQU 10h
carta3_1 EQU 20h
carta4_1 EQU 30h

carta1_2 EQU 01h
carta2_2 EQU 11h
carta3_2 EQU 21h
carta4_2 EQU 31h

carta1_3 EQU 02h
carta2_3 EQU 12h
carta3_3 EQU 22h
carta4_3 EQU 32h

carta1_4 EQU 03h
carta2_4 EQU 13h
carta3_4 EQU 23h
carta4_4 EQU 33h

ORG 0000H
LJMP INICIO

ORG 0100H

; ---- Sub-rotinas de geração para cada carta ----

rand8_carta1_1:
    mov a, carta1_1
    jnz rand8b_carta1_1
    cpl a
    mov carta1_1, a
    acall rand8_limit_carta1_1

rand8b_carta1_1:
    anl a, #0xC8
    mov c, p
    mov a, carta1_1
    rlc a
    mov carta1_1, a
    ret

rand8_limit_carta1_1:
    acall rand8b_carta1_1
    mov a, carta1_1
    cjne a, #15, check_less_carta1_1
    sjmp rand8_carta1_1
check_less_carta1_1:
    jc rand8_done_carta1_1
    sjmp rand8_carta1_1
rand8_done_carta1_1:
    ret

; --------------------------------------------

rand8_carta2_1:
    mov a, carta2_1
    jnz rand8b_carta2_1
    cpl a
    mov carta2_1, a
    acall rand8_limit_carta2_1

rand8b_carta2_1:
    anl a, #0xD5
    mov c, p
    mov a, carta2_1
    rlc a
    mov carta2_1, a
    ret

rand8_limit_carta2_1:
    acall rand8b_carta2_1
    mov a, carta2_1
    cjne a, #15, check_less_carta2_1
    sjmp rand8_carta2_1
check_less_carta2_1:
    jc rand8_done_carta2_1
    sjmp rand8_carta2_1
rand8_done_carta2_1:
    ret

; --------------------------------------------

rand8_carta3_1:
    mov a, carta3_1
    jnz rand8b_carta3_1
    cpl a
    mov carta3_1, a
    acall rand8_limit_carta3_1

rand8b_carta3_1:
    anl a, #0xD7
    mov c, p
    mov a, carta3_1
    rlc a
    mov carta3_1, a
    ret

rand8_limit_carta3_1:
    acall rand8b_carta3_1
    mov a, carta3_1
    cjne a, #15, check_less_carta3_1
    sjmp rand8_carta3_1
check_less_carta3_1:
    jc rand8_done_carta3_1
    sjmp rand8_carta3_1
rand8_done_carta3_1:
    ret

; --------------------------------------------

rand8_carta4_1:
    mov a, carta4_1
    jnz rand8b_carta4_1
    cpl a
    mov carta4_1, a
    acall rand8_limit_carta4_1

rand8b_carta4_1:
    anl a, #0xC3
    mov c, p
    mov a, carta4_1
    rlc a
    mov carta4_1, a
    ret

rand8_limit_carta4_1:
    acall rand8b_carta4_1
    mov a, carta4_1
    cjne a, #15, check_less_carta4_1
    sjmp rand8_carta4_1
check_less_carta4_1:
    jc rand8_done_carta4_1
    sjmp rand8_carta4_1
rand8_done_carta4_1:
    ret

rand8_carta1_2:
    mov a, carta1_2
    jnz rand8b_carta1_2
    cpl a
    mov carta1_2, a
    acall rand8_limit_carta1_2

rand8b_carta1_2:
    anl a, #0xA5
    mov c, p
    mov a, carta1_2
    rlc a
    mov carta1_2, a
    ret

rand8_limit_carta1_2:
    acall rand8b_carta1_2
    mov a, carta1_2
    cjne a, #15, check_less_carta1_2
    sjmp rand8_carta1_2
check_less_carta1_2:
    jc rand8_done_carta1_2
    sjmp rand8_carta1_2
rand8_done_carta1_2:
    ret

; ------------------------------------------------

rand8_carta2_2:
    mov a, carta2_2
    jnz rand8b_carta2_2
    cpl a
    mov carta2_2, a
    acall rand8_limit_carta2_2

rand8b_carta2_2:
    anl a, #0xA8
    mov c, p
    mov a, carta2_2
    rlc a
    mov carta2_2, a
    ret

rand8_limit_carta2_2:
    acall rand8b_carta2_2
    mov a, carta2_2
    cjne a, #15, check_less_carta2_2
    sjmp rand8_carta2_2
check_less_carta2_2:
    jc rand8_done_carta2_2
    sjmp rand8_carta2_2
rand8_done_carta2_2:
    ret

; ------------------------------------------------

rand8_carta3_2:
    mov a, carta3_2
    jnz rand8b_carta3_2
    cpl a
    mov carta3_2, a
    acall rand8_limit_carta3_2

rand8b_carta3_2:
    anl a, #0xA3
    mov c, p
    mov a, carta3_2
    rlc a
    mov carta3_2, a
    ret

rand8_limit_carta3_2:
    acall rand8b_carta3_2
    mov a, carta3_2
    cjne a, #15, check_less_carta3_2
    sjmp rand8_carta3_2
check_less_carta3_2:
    jc rand8_done_carta3_2
    sjmp rand8_carta3_2
rand8_done_carta3_2:
    ret

; ------------------------------------------------

rand8_carta4_2:
    mov a, carta4_2
    jnz rand8b_carta4_2
    cpl a
    mov carta4_2, a
    acall rand8_limit_carta4_2

rand8b_carta4_2:
    anl a, #0xC8
    mov c, p
    mov a, carta4_2
    rlc a
    mov carta4_2, a
    ret

rand8_limit_carta4_2:
    acall rand8b_carta4_2
    mov a, carta4_2
    cjne a, #15, check_less_carta4_2
    sjmp rand8_carta4_2
check_less_carta4_2:
    jc rand8_done_carta4_2
    sjmp rand8_carta4_2
rand8_done_carta4_2:
    ret

rand8_carta1_3:
    mov a, carta1_3
    jnz rand8b_carta1_3
    cpl a
    mov carta1_3, a
    acall rand8_limit_carta1_3

rand8b_carta1_3:
    anl a, #0xB8
    mov c, p
    mov a, carta1_3
    rlc a
    mov carta1_3, a
    ret

rand8_limit_carta1_3:
    acall rand8b_carta1_3
    mov a, carta1_3
    cjne a, #15, check_less_carta1_3
    sjmp rand8_carta1_3
check_less_carta1_3:
    jc rand8_done_carta1_3
    sjmp rand8_carta1_3
rand8_done_carta1_3:
    ret

; ------------------------------------------------

rand8_carta2_3:
    mov a, carta2_3
    jnz rand8b_carta2_3
    cpl a
    mov carta2_3, a
    acall rand8_limit_carta2_3

rand8b_carta2_3:
    anl a, #0xC4
    mov c, p
    mov a, carta2_3
    rlc a
    mov carta2_3, a
    ret

rand8_limit_carta2_3:
    acall rand8b_carta2_3
    mov a, carta2_3
    cjne a, #15, check_less_carta2_3
    sjmp rand8_carta2_3
check_less_carta2_3:
    jc rand8_done_carta2_3
    sjmp rand8_carta2_3
rand8_done_carta2_3:
    ret

; ------------------------------------------------

rand8_carta3_3:
    mov a, carta3_3
    jnz rand8b_carta3_3
    cpl a
    mov carta3_3, a
    acall rand8_limit_carta3_3

rand8b_carta3_3:
    anl a, #0xB8
    mov c, p
    mov a, carta3_3
    rlc a
    mov carta3_3, a
    ret

rand8_limit_carta3_3:
    acall rand8b_carta3_3
    mov a, carta3_3
    cjne a, #15, check_less_carta3_3
    sjmp rand8_carta3_3
check_less_carta3_3:
    jc rand8_done_carta3_3
    sjmp rand8_carta3_3
rand8_done_carta3_3:
    ret

; ------------------------------------------------

rand8_carta4_3:
    mov a, carta4_3
    jnz rand8b_carta4_3
    cpl a
    mov carta4_3, a
    acall rand8_limit_carta4_3

rand8b_carta4_3:
    anl a, #0xB8
    mov c, p
    mov a, carta4_3
    rlc a
    mov carta4_3, a
    ret

rand8_limit_carta4_3:
    acall rand8b_carta4_3
    mov a, carta4_3
    cjne a, #15, check_less_carta4_3
    sjmp rand8_carta4_3
check_less_carta4_3:
    jc rand8_done_carta4_3
    sjmp rand8_carta4_3
rand8_done_carta4_3:
    ret

rand8_carta1_4:
    mov a, carta1_4
    jnz rand8b_carta1_4
    cpl a
    mov carta1_4, a
    acall rand8_limit_carta1_4

rand8b_carta1_4:
    anl a, #0xA6
    mov c, p
    mov a, carta1_4
    rlc a
    mov carta1_4, a
    ret

rand8_limit_carta1_4:
    acall rand8b_carta1_4
    mov a, carta1_4
    cjne a, #15, check_less_carta1_4
    sjmp rand8_carta1_4
check_less_carta1_4:
    jc rand8_done_carta1_4
    sjmp rand8_carta1_4
rand8_done_carta1_4:
    ret

; ------------------------------------------------

rand8_carta2_4:
    mov a, carta2_4
    jnz rand8b_carta2_4
    cpl a
    mov carta2_4, a
    acall rand8_limit_carta2_4

rand8b_carta2_4:
    anl a, #0xC2
    mov c, p
    mov a, carta2_4
    rlc a
    mov carta2_4, a
    ret

rand8_limit_carta2_4:
    acall rand8b_carta2_4
    mov a, carta2_4
    cjne a, #15, check_less_carta2_4
    sjmp rand8_carta2_4
check_less_carta2_4:
    jc rand8_done_carta2_4
    sjmp rand8_carta2_4
rand8_done_carta2_4:
    ret

; ------------------------------------------------

rand8_carta3_4:
    mov a, carta3_4
    jnz rand8b_carta3_4
    cpl a
    mov carta3_4, a
    acall rand8_limit_carta3_4

rand8b_carta3_4:
    anl a, #0xB8
    mov c, p
    mov a, carta3_4
    rlc a
    mov carta3_4, a
    ret

rand8_limit_carta3_4:
    acall rand8b_carta3_4
    mov a, carta3_4
    cjne a, #15, check_less_carta3_4
    sjmp rand8_carta3_4
check_less_carta3_4:
    jc rand8_done_carta3_4
    sjmp rand8_carta3_4
rand8_done_carta3_4:
    ret

; ------------------------------------------------

rand8_carta4_4:
    mov a, carta4_4
    jnz rand8b_carta4_4
    cpl a
    mov carta4_4, a
    acall rand8_limit_carta4_4

rand8b_carta4_4:
    anl a, #0xB8
    mov c, p
    mov a, carta4_4
    rlc a
    mov carta4_4, a
    ret

rand8_limit_carta4_4:
    acall rand8b_carta4_4
    mov a, carta4_4
    cjne a, #15, check_less_carta4_4
    sjmp rand8_carta4_4
check_less_carta4_4:
    jc rand8_done_carta4_4
    sjmp rand8_carta4_4
rand8_done_carta4_4:
    ret



; Chamada de geração aleatória para todas as 16 cartas (4x4)
INICIO:
    acall rand8_carta1_1
    acall rand8_carta2_1

    acall rand8_carta1_2
    acall rand8_carta2_2

    acall rand8_carta1_3
    acall rand8_carta2_3

    acall rand8_carta1_4
	acall rand8_carta2_4


	SJMP $
