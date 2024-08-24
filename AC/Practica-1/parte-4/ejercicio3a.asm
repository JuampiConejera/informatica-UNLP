        ORG 1000H
MENSAJE DB "holaaa"
CANT    DB ?
        ORG 3000H
CONTAR_CAR: MOV BX, OFFSET MENSAJE
        MOV AL, OFFSET CANT - OFFSET MENSAJE
        MOV CL, 0
        MOV DL, 0
LOOP:   CMP AL,DL
        JZ FIN
        INC DL
        MOV AH,97
        CMP BYTE PTR [BX], AH
        JZ SUMA
        INC BX
        JMP LOOP
SUMA:   INC CL
        JMP LOOP
FIN:    RET
        ORG 2000H
        CALL CONTAR_CAR
        INT 0
        END