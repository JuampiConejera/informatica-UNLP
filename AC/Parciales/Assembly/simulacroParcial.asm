          ORG 1000H
          MSJ DB "LLAVES PRENDIDAS"
          FMSJ DB ?
          ORG 1100H
          MSJ2 DB "LLAVES APAGADAS"
          FMSJ2 DB ?
          
          PA EQU 30H
          CA EQU 32H
          INT1 EQU 25H
          IMR EQU 21H
          EOI EQU 20H
          TIMER EQU 10
          CONT EQU 10H
          COMP EQU 11H

          ORG 1200H
          FINALIZA DB 0

          ORG 40
          IP_TIMER DW SUBT

          ORG 2000H
          CLI
          MOV AL, IMR
          OUT IMR, AL
          MOV AL, TIMER
          OUT INT1, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 3
          OUT COMP, AL
          MOV AL, 1
          OUT CA, AL
          STI
BUCLE:    IN AL, PA
          AND AL, 11110000B
          CMP AL, 11110000B
          JNZ SIGUE
          MOV BX, OFFSET MSJ
          MOV AX, OFFSET FMSJ - OFFSET MSJ
          PUSH AX
          CALL IMP
          POP AX
SIGUE:    CMP FINALIZA, 1
          JNZ BUCLE
          INT 0

          ORG 3000H
IMP:      MOV DX, SP
          ADD SP, 2
          POP AX
          INT 7
          ADD FINALIZA, 1
          RET

          ORG 3100H
SUBT:     CLI
          MOV AL, 0FFH
          OUT IMR, AL
          STI
          MOV BX, OFFSET MSJ2
          MOV AX, OFFSET FMSJ2 - OFFSET MSJ2
          PUSH AX
          CALL IMP
          POP AX
          CLI
          MOV AL, EOI
          OUT EOI, AL
          STI
          IRET
          
          END