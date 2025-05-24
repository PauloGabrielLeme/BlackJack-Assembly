; --- Mapeamento de Hardware ---
; P0.0-P0.3: Linhas do teclado
; P0.4-P0.6: Colunas do teclado

; --- Endereços das Cartas na RAM ---
carta1_1 equ 10h
carta2_1 equ 20h
carta3_1 equ 30h
carta4_1 equ 40h
carta1_2 equ 11h
carta2_2 equ 21h
carta3_2 equ 31h
carta4_2 equ 41h
carta1_3 equ 12h
carta2_3 equ 22h
carta3_3 equ 32h
carta4_3 equ 42h

; --- Flag de tecla pressionada ---
flag_tecla EQU 20h   

org 0000h
    LJMP START

org 0030h
START:
    ; Inicialização
    ;MOV TMOD, #01h
    MOV carta1_1, #0
    MOV carta2_1, #0
	MOV carta3_1, #0
    MOV carta4_1, #0
    MOV carta1_2, #0
    MOV carta2_2, #0
	MOV carta3_2, #0
    MOV carta4_2, #0
    MOV carta1_3, #0
    MOV carta2_3, #0
	MOV carta3_3, #0
    MOV carta4_3, #0
	acall rand4_carta1_1
	MOV a, #0
	acall rand4_carta2_1
	MOV a, #0
	acall rand4_carta1_2
	MOV a, #0
	acall rand4_carta2_2
	MOV a, #0
	acall rand4_carta1_3
	MOV a, #0
	acall rand4_carta2_3

MAIN_LOOP:
    ACALL leituraTeclado
    JNB flag_tecla, MAIN_LOOP

    MOV A, R0

    CJNE A, #11, CHECK_10
    ACALL gerar_carta3_1
    SJMP CONTINUE

CHECK_10:
    CJNE A, #10, CHECK_9
    ACALL gerar_carta4_1
    SJMP CONTINUE

CHECK_9:
    CJNE A, #9, CHECK_8
    ACALL gerar_carta3_2
    SJMP CONTINUE

CHECK_8:
    CJNE A, #8, CHECK_7
    ACALL gerar_carta4_2
    SJMP CONTINUE

CHECK_7:
    CJNE A, #7, CHECK_6
    ACALL gerar_carta3_3
    SJMP CONTINUE

CHECK_6:
    CJNE A, #6, CONTINUE
    ACALL gerar_carta4_3

CONTINUE:
    CLR flag_tecla
    SJMP MAIN_LOOP

; --- Subrotinas de Geração de Cartas ---
rand4_carta1_1:
    mov a, carta1_1
    jnz rand4b_carta1_1
    cpl a
    mov carta1_1, a
rand4b_carta1_1:
    anl a, r1       ; Máscara 4 bits: 00001101b
    mov c, p
    mov a, carta1_1
    rlc a
	anl a, r2   
    mov carta1_1, a
    ret

rand4_carta2_1:
    mov a, carta2_1
    jnz rand4b_carta2_1
    cpl a
    mov carta2_1, a
rand4b_carta2_1:
    anl a, r3       ; Máscara 4 bits: 00001011b
    mov c, p
    mov a, carta2_1
    rlc a
	anl a, r4
    mov carta2_1, a
    ret


gerar_carta3_1:
    ACALL start_timer
    MOV A, carta3_1
    JNZ gen_carta3_1
    CPL A
    MOV carta3_1, A
gen_carta3_1:
    ANL A, 0x0F
    MOV C, P
    MOV A, carta3_1
    RLC A
    ANL A, #0x0F
    MOV carta3_1, A
    ACALL stop_timer
    RET

gerar_carta4_1:
    ACALL start_timer
    MOV A, carta4_1
    JNZ gen_carta4_1
    CPL A
    MOV carta4_1, A
gen_carta4_1:
    ANL A, #0x06
    MOV C, P
    MOV A, carta4_1
    RLC A
    ANL A, #0x0F
    MOV carta4_1, A
    ACALL stop_timer
    RET

rand4_carta1_2:
    mov a, carta1_2
    jnz rand4b_carta1_2
    cpl a
    mov carta1_2, a
rand4b_carta1_2:
    anl a, r5       ; Máscara 4 bits: 00001101b
    mov c, p
    mov a, carta1_2
    rlc a
    anl a, r6   
    mov carta1_2, a
    ret

rand4_carta2_2:
    mov a, carta2_2
    jnz rand4b_carta2_2
    cpl a
    mov carta2_2, a
rand4b_carta2_2:
    anl a, r1       ; Máscara 4 bits: 00001011b
    mov c, p
    mov a, carta2_2
    rlc a
    anl a, r3
    mov carta2_2, a
    ret

gerar_carta3_2:
    ACALL start_timer
    MOV A, carta3_2
    JNZ gen_carta3_2
    CPL A
    MOV carta3_2, A
gen_carta3_2:
    ANL A, #0x0F
    MOV C, P
    MOV A, carta3_2
    RLC A
    ANL A, #0x0F
    MOV carta3_2, A
    ACALL stop_timer
    RET

gerar_carta4_2:
    ACALL start_timer
    MOV A, carta4_2
    JNZ gen_carta4_2
    CPL A
    MOV carta4_2, A
gen_carta4_2:
    ANL A, #0x0A
    MOV C, P
    MOV A, carta4_2
    RLC A
    ANL A, #0x0F
    MOV carta4_2, A
    ACALL stop_timer
    RET

rand4_carta1_3:
    mov a, carta1_3
    jnz rand4b_carta1_3
    cpl a
    mov carta1_3, a
rand4b_carta1_3:
    anl a, r2       ; Máscara 4 bits: 00001101b
    mov c, p
    mov a, carta1_3
    rlc a
    anl a, r4   
    mov carta1_3, a
    ret

rand4_carta2_3:
    mov a, carta2_3
    jnz rand4b_carta2_3
    cpl a
    mov carta2_3, a
rand4b_carta2_3:
    anl a, r5       ; Máscara 4 bits: 00001011b
    mov c, p
    mov a, carta2_3
    rlc a
    anl a, r1
    mov carta2_3, a
    ret

gerar_carta3_3:
    ACALL start_timer
    MOV A, carta3_3
    JNZ gen_carta3_3
    CPL A
    MOV carta3_3, A
gen_carta3_3:
    ANL A, #0x06
    MOV C, P
    MOV A, carta3_3
    RLC A
    ANL A, #0x0F
    MOV carta3_3, A
    ACALL stop_timer
    RET

gerar_carta4_3:
    ACALL start_timer
    MOV A, carta4_3
    JNZ gen_carta4_3
    CPL A
    MOV carta4_3, A
gen_carta4_3:
    ANL A, #0x03
    MOV C, P
    MOV A, carta4_3
    RLC A
    ANL A, #0x0F
    MOV carta4_3, A
    ACALL stop_timer
    RET


; --- Rotinas do Timer ---
start_timer:
    MOV TH0, #00h
    MOV TL0, #00h
    SETB TR0
    RET

stop_timer:
    CLR TR0
    RET

; --- Rotina de Leitura do Teclado ---
leituraTeclado:
    MOV R0, #0         ; Zera o número da tecla
    MOV A, #0FFh
    MOV P1, A          ; Garante todos os bits como 1 antes de começar

    ; Varre linha 0 (ativa P1.0)
    CLR P1.0
    SETB P1.1
    SETB P1.2
    SETB P1.3
    ACALL colScan
    JB flag_tecla, fim_leitura

    ; Varre linha 1 (ativa P1.1)
    SETB P1.0
    CLR P1.1
    SETB P1.2
    SETB P1.3
    ACALL colScan
    JB flag_tecla, fim_leitura

    ; Varre linha 2 (ativa P1.2)
    SETB P1.0
    SETB P1.1
    CLR P1.2
    SETB P1.3
    ACALL colScan
    JB flag_tecla, fim_leitura

    ; Varre linha 3 (ativa P1.3)
    SETB P1.0
    SETB P1.1
    SETB P1.2
    CLR P1.3
    ACALL colScan

fim_leitura:
    SETB P1.0
    SETB P1.1
    SETB P1.2
    SETB P1.3
    RET


colScan:
    JB P1.4, C1
    SETB flag_tecla
    RET
C1:
    INC R0
    JB P1.5, C2
    SETB flag_tecla
    RET
C2:
    INC R0
    JB P1.6, FIM_COLSCAN
    SETB flag_tecla
    RET
FIM_COLSCAN:
    INC R0
    RET


tecla_pressionada:
    SETB flag_tecla
    RET

; --- Fim do programa ---
end
