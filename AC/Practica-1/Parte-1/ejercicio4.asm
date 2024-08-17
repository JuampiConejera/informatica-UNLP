        ORG 1000H
        MENSAJE DB "HOLA, BUENAS TARDES"
        F DB ?
        ORG 2000H
        MOV BX, OFFSET MENSAJE
        MOV AL, OFFSET F - OFFSET MENSAJE
        MOV AH, 0
LOOP:   CMP AL, AH
        JZ FIN
        ;INICIO IF( ([BX] < 91) AND ([BX] > 65)
        CMP BYTE PTR [BX], 91
        JNS ELSE
        CMP BYTE PTR [BX], 65
        JS ELSE
        ;SIGUE EL FOR
        MOV CL, [BX]
        ADD CL, 32
        MOV [BX], CL
ELSE:   INC BX
        INC AH
        JMP LOOP
FIN:    SUB BX, OFFSET F - OFFSET MENSAJE
        INT 7
        HLT
        END