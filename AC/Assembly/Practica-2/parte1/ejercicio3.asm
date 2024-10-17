        PA EQU 30H
        ORG 2000H
LOOP:   MOV AL, 0FFH
        OUT PA+2, AL
        IN AL, PA
        MOV CL, AL
        MOV AL, 0
        OUT PA+3, AL
        MOV AL, CL
        OUT PA+1, AL
        JMP LOOP
        INT 0
        END