        ORG 1000H
        A DB 8
        B DB 5
        C DB 4
        D DB ?
        ORG 3000H
CALC:   MOV DL, AL;COMPLETAR
        ADD DL, AH
        SUB DL, CL
        RET;COMPLETAR
        ORG 2000H
        MOV AL, A;COMPLETAR
        MOV AH, B;COMPLETAR
        MOV CL, C
        CALL CALC;COMPLETAR
        MOV D, DL
        HLT
        END