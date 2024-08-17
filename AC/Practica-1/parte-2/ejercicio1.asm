        ORG 1000H
        MAYUS DB "A"
        ORG 2000H
        MOV BX, OFFSET MAYUS
        MOV AL, 91 - 65 ; CANTIDAD DE LETRAS DEL ABECEDARIO EN ASCII
        MOV AH, 0
        MOV CL, MAYUS
LOOP:   CMP AL, AH
        JZ FIN
        INC BX
        INC CL
        MOV [BX], CL
        INC AH
        JMP LOOP
FIN:    MOV BX, OFFSET MAYUS
        INT 7
        HLT
        END