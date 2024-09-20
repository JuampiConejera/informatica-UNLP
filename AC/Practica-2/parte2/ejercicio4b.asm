          PA EQU 30H
          PB EQU 31H
          CA EQU 32H
          CB EQU 33H
          ORG 1000H
          MSJ DB "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS"
          FIN DB ?
          ORG 3000H
INI_PIO:  MOV AL, 0FDH
          OUT CA, AL
          MOV AL, 0
          OUT CB, AL
          RET
          ORG 3100H
POLL:     IN AL, PA
          AND AL, 1
          JNZ POLL
          RET
          ORG 3200H
FCO_ASCTE:IN AL, PA
          OR AL, 2
          OUT PA, AL
          AND AL, 0FDH
          OUT PA, AL
          RET
          ORG 3500H
IMP_CAR:  CALL POLL
          MOV AL, [BX]
          OUT PB,AL
          CALL FCO_ASCTE
          INC BX
          CMP BX, OFFSET FIN
          JNZ IMP_CAR
          RET
          ORG 2000H
          CALL INI_PIO
          MOV BX, OFFSET MSJ
          CALL IMP_CAR
          INT 0
          END