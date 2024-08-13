      ORG 1000H
      NUM1 DW 16
      NUM2 DW 1
      RES DW ?
      ORG 3000H
MUL:  MOV DX, 0
      CMP BX, 0
      JZ FIN
LOOP: ADD DX, AX
      DEC BX
      JNZ LOOP
FIN:  RET;
      ORG 2000H
      ;INICIALIZO AX,BX
      MOV AX, NUM1
      MOV BX, NUM2
      CALL MUL
      HLT
      END