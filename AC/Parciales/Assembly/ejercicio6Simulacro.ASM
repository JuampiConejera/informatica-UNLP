          PA EQU 30H
          PB EQU 31H
          CA EQU 32H
          CB EQU 33H
          ORG 1000H
          MSJ DB "FIN DE PROGRAMA"
          FMSJ DB ?

          ORG 1100H
          FINALIZAR DB 0

          ORG 1200H
          MSJ2 DB "ARQUITECTURA DE COMPUTADORAS"
          FMSJ2 DB ?

          ORG 2000H
          MOV AL, 0FFH
          OUT CA, AL
          MOV AL, 0
          OUT CB, AL

BUCLE:    CALL C
          CMP FINALIZAR, 1
          JZ FIN
          IN AL, PA
          MOV DL, AL
          CALL A
          CALL B
          JMP BUCLE
FIN:      INT 0

          ORG 3000H
C:        IN AL, PA
          CMP AL, 0
          JNZ SALIR
          MOV BX, OFFSET MSJ
          MOV AL, OFFSET FMSJ - OFFSET MSJ
          INT 7
          MOV FINALIZAR, 1
SALIR:    RET

          ORG 3100H
A:        IN AL, PA
          CMP AL, DL
          JZ IGUAL
          IN AL, PB
          NOT AL
          OUT PB, AL
IGUAL:    RET

          ORG 3200H
B:        IN AL, PA
          AND AL, 10000000B
          JZ FUIRA
          MOV BX, OFFSET MSJ2
          MOV AL, OFFSET FMSJ2 - OFFSET MSJ2
          INT 7
FUIRA:    RET

          END