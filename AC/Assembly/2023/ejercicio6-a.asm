      ORG 1000H
      NUM1 DW 16
      NUM2 DW 16
      RES DW ?
      ORG 2000H
      ;INICIALIZO AX,BX
      MOV AX, 0
      MOV BX, NUM2
      CMP BX, 0
      JZ FIN
LOOP: ADD AX, NUM1
      DEC BX
      CMP BX, 0
      JNZ LOOP
FIN:  MOV RES, AX
      HLT
      END