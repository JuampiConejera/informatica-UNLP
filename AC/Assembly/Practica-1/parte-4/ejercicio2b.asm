      ORG 1000H
    A DB 8
    B DB 5
    C DB 4
    D DB ?
      ORG 3000H
CALC: PUSH BX
      MOV BX, SP
      ADD BX, 8;
      MOV DL, [BX]
      SUB BX, 2
      ADD DL, [BX];
      SUB BX, 2
      SUB DL,[BX];
      POP BX
      RET;
      ORG 2000H
      MOV AL, A
      PUSH AX
      MOV AL, B;
      PUSH AX
      MOV AL, C;
      PUSH AX
      CALL CALC
      MOV D, DL
      POP AX;
      POP AX;
      POP AX;
      HLT
      END