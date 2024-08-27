          ORG 1000H
        A DB 10
        B DB 10
      RES DW ?
          ORG 3000H
MUL:      CMP AH, 0
          JZ FIN
          DEC AH
LOOP:     ADD AL, A
          DEC AH
          JZ FIN
          JMP LOOP
FIN:      RET
          ORG 2000H
          MOV AL, A
          MOV AH, B
          CALL MUL
          MOV RES, AX
          INT 0
          END