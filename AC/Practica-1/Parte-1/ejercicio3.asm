        ORG 1000H
        C DB "A"
        ORG 2000H
        MOV AL, C
        ADD AL, 32
        MOV C, AL
        HLT
        END