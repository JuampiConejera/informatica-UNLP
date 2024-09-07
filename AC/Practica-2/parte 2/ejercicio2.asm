        PA EQU 30H
        CA EQU 32H
        ORG 1000H
        si DB "Ocupada"
        no DB "Libre"
        ORG 2000H
        MOV AL, 0FEH;
        OUT CA, AL
        IN AL, PA
        AND AL, 1;
        JNZ OCUPADA
        MOV BX, OFFSET NO;
        MOV AL, 5
        INT 7
        JMP FIN
OCUPADA:MOV BX, OFFSET SI
        MOV AL, 7
        INT 7;
FIN:    INT 0
        END