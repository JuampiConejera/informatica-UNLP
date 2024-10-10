          CONT EQU 10H
          COMP EQU 11H
          EOI EQU 20H
          IMR EQU 21H
          INT1 EQU 25H
          TIMER EQU 10

          ORG 40
          IP_TIMER DW SUBT

          ORG 1000H
          MSJ DB "ESCRIBA 5 CARACTERES"
          FMSJ DB ?
          
          ORG 1100H
          LARGO DB 5
          STR DB ?

          ORG 2000H
          CLI
          MOV AL, 0FDH
          OUT IMR, AL
          MOV AL, TIMER
          OUT INT1, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 1
          OUT COMP, AL
          MOV BX, OFFSET STR
          LEER: INT 6
          INC BX
          DEC LARGO
          JNZ LEER
          MOV BX, OFFSET STR
          PUSH BX
          STI
          CALL SUB_IMP
          POP BX
          INT 0

          ORG 3000H
          SUB_IMP: ADD SP, 2
          POP BX
          MOV DH, 5
          CMP FINALIZAR, 1
          JNZ SUB_IMP
          SUB SP, 4
          RET

          ORG 3200H
          SUBT: MOV AL, 1
          INT 7
          INC BX
          DEC DH
          JNZ SIGUE
          MOV FINALIZAR, 1
          MOV AL, 0FFH
          OUT IMR, AL
          SIGUE: MOV AL, 0
          OUT CONT, AL
          MOV AL, EOI
          OUT EOI, AL
          IRET

          ORG 1300H
          FINALIZAR DB 0
          END