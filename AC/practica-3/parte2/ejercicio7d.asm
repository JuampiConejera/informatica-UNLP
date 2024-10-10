                 EOI EQU 20H
          IMR EQU 21H
          INT0 EQU 24H
          INT2 EQU 26H
          DATO EQU 40H
          ESTADO EQU 41H
          HND EQU 10
          F10 EQU 20

          ORG 80
          DW SUB_F10
          
          ORG 40
          DW SUB_HND

          ORG 1000H
          LARGO DB 10
          MSJ DB ?

          ORG 3200H
SUB_F10:  PUSH AX
          MOV AL, 0FFH
          OUT IMR, AL
          MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET
          ORG 3100H
LEER:     PUSH CX
          PUSH BX
          MOV CL, LARGO
          MOV BX, OFFSET MSJ
LOOP:     INT 6
          INC BX
          DEC CL
          JNZ LOOP
          POP BX
          POP CX
          RET
          
          ORG 3000H
SUB_HND:  PUSH AX
          MOV AL, [BX]
          OUT DATO, AL
          INC BX
          DEC CL
          JNZ SIGUE
          MOV AL, 0FFH
          OUT IMR, AL
SIGUE:    MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET

          ORG 2000H
          CALL LEER
          MOV LARGO, 10
          MOV BX, OFFSET MSJ
          MOV CL, LARGO
          CLI
          MOV AL, 0FAH
          OUT IMR, AL
          MOV AL, F10
          OUT INT0, AL
          MOV AL, HND
          OUT INT2, AL
          MOV AL, 80H
          OUT ESTADO, AL
          STI
          INT 0
          END
