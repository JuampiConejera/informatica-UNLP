        PA EQU 30H
        CA EQU 32H
        ORG 1000H
        ORG 1500H
        P DB "Llave prendida"
        A DB "Llave apagada"
        T DB ?
        ORG 2000H
        MOV AL, 11111111B
        OUT CA, AL
        IN AL, PA
        AND AL, 10000000B
        CMP AL, 10000000B
        JNZ AP
        MOV AL, OFFSET A - OFFSET P
        MOV BX, OFFSET P
        INT 7
        JMP FIN
AP:     MOV AL, OFFSET T - OFFSET A
        MOV BX, OFFSET A
        INT 7
FIN:    INT 0
        END