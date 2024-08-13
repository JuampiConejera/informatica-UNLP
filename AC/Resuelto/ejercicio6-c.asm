      ORG 1000H
      NUM1 DW 16
      NUM2 DW 16
      RES DW ?
      ORG 3000H
      ;INICIALIZAR AX, CX
MUL:  MOV BX, AX
      MOV AX, [BX]
      MOV BX, CX
      MOV CX, [BX]
      ;MULTIPLICAR
      CMP CX, 0
      JZ FIN
LOOP: ADD DX, AX
      DEC CX
      JNZ LOOP
FIN:  RET;
      ORG 2000H
      ;INICIALIZO AX,BX
      MOV AX, OFFSET NUM1
      MOV CX, OFFSET NUM2
      CALL MUL
      MOV RES, DX
      HLT
      END