EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H;___________
N_F10 EQU 15
ORG 60;___________
IP_F10 DW RUT_F10
ORG 2000H
CLI
MOV AL, 0FEH
OUT IMR, AL;___________
MOV AL, N_F10;___________
OUT INT0, AL
MOV DX, 0
STI
LAZO:JMP LAZO
ORG 3000H
RUT_F10:PUSH AX
INC DX;___________
MOV AL, EOI
OUT EOI, AL;___________
POP AX
IRET
END
;A. ¿Qué hacen las instrucciones CLI y STI? ¿Qué podría suceder 
;si no están las mismas y la persona que usa el programa presiona F10 
;rápidamente durante la configuración del PIC?
        ;RTA= CLI y STI son para bloquear las demás interrupciones, por lo que podríamos
             ;dejar inconclusa la configuración y provocar bugs.

;B. ¿Por qué se usa el valor 0FEH en el programa?
        ;RTA= FE:11111101 (habilita el F10)

;C. ¿Qué instrucciones le indican al PIC que la interrupción ha terminado?
    ;OUT EOI, AL

;D. ¿En qué dirección se encuentra la subrutina que atiende las interrupciones del F10?
    ;En la dirección 60 (15x4);