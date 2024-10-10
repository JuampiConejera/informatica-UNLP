          PB EQU 31H
          CB EQU 33H
          ORG 1000H
          MSJ DB "UNLP"
          FIN DB ?
          
          ORG 3000H
INI_PIO:  MOV AL, 0
          OUT CB, AL
          RET
          ORG 3100H
IMP_0:    MOV AL, '0'
          OUT PB, AL
          RET
          
          ORG 2000H
          CALL INI_PIO
          MOV BX, OFFSET MSJ
LOOP:     CALL IMP_0
          MOV AL, [BX]
          OUT PB, AL
          INC BX
          CMP BX, OFFSET FIN
          JNZ LOOP
          MOV AL, 255
          OUT PB, AL
          INT 0
          END