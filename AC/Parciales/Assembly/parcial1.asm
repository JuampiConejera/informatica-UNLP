          PA EQU 30H
          PB EQU 31H
          CA EQU 32H
          CB EQU 33H
          
          ORG 1000H
          CHAR DB?
          ORG 1100H
          FINAL DB 0
          
          ORG 3000H
MODA:     MOV BX, OFFSET CHAR
          MOV [BX], AL
          MOV AL, 1
          INT 7
          RET
          
          ORG 3100H
MODB:     IN AL, PA
          AND AL, 10000000B
          CMP AL, 10000000B
          JNZ FIN
          IN AL, PB
          NOT AL
          OUT PB, AL
FIN:      RET

          ORG 3200H
MODC:     IN AL, PA
          CMP AL, 0
          JNZ T
          OUT PB, AL
          ADD FINAL, 1
T:        RET

          ORG 2000H
          MOV AL, 0FFH
          OUT CA, AL
          MOV AL, 0
          OUT CB,AL
LOOP:     IN AL, PA
          CALL MODA
          CALL MODB
          CALL MODC
          CMP FINAL, 1
          JNZ LOOP
          INT 0
          END