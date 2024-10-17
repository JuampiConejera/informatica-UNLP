          CONT EQU 10H
          COMP EQU 11H
          EOI EQU 20H
          IMR EQU 21H
          INT1 EQU 25H
          TIMER EQU 20

          ORG 80
          IP_F10 DW SUB_TIMER

          ORG 1000H
          MSJ DB "VAMOS LAS INTERRUPCIONES!"
          FMSJ DB ?
          CANT DB 0
          
          ORG 2000H
          CLI
          MOV AL, 0FDH
          OUT IMR, AL
          MOV AL, TIMER
          OUT INT1, AL
          MOV AL, 2
          OUT COMP, AL
          MOV AL, 0
          OUT CONT, AL
          STI
LAZO:     CMP CANT, 5
          JNZ LAZO
          INT 0
          ORG 3000H
SUB_TIMER:PUSH AX
          PUSH BX
          MOV BX, OFFSET MSJ
          MOV AL, OFFSET FMSJ - OFFSET MSJ
          INT 7
          INC CANT
          CMP CANT, 5
          JNZ SIGUE
          MOV AL, 0FFH
          OUT IMR, AL
SIGUE:    MOV AL, EOI
          OUT EOI, AL
          MOV AL, 0
          OUT CONT, AL
          POP BX
          POP AX
          IRET

          END