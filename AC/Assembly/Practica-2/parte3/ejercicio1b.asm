          PA EQU 30H
          PB EQU 31H
          CA EQU 32H
          CB EQU 33H
          ORG 1000H
          MSJ DB "ASD0"
          FINMSJ DB ?

          ORG 3000H
INI_PIO:  MOV AL, 1
          OUT CA, AL
          MOV AL, 0
          OUT CB, AL
          RET
          ORG 3100H
CONF:     MOV AL, 0FFH
          OUT PB, AL
          RET
          ORG 3200H
LEER:     IN AL, PA
          RET
          ORG 2000H
          CALL INI_PIO
LOOP:     CALL CONF
          CALL LEER
          CMP AL, '0'
          JZ FIN
          JMP LOOP
FIN:      INT 0
          END