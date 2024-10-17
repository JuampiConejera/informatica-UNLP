          CONT EQU 10H
          COMP EQU 11H
          PIC EQU 20H
          EOI EQU 20H
          IMR EQU 21H
          INT0 EQU 24H
          INT1 EQU 25H

          F10 EQU 10
          TIMER EQU 20
          ORG 40
          IP_F10 DW SUB_F10
          ORG 80
          IP_TIMER DW SUB_TIMER

          ORG 1000H
          C DB 39H
          PAUSA DB 0
          FIN DB 0
          
          ORG 3100H ;SUBRUTINA PARA F10
SUB_F10:  PUSH AX
          CMP FIN, 1
          JNZ NO_REPETIR
          MOV FIN, 0
          MOV C, 39H
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 0FCH
          JMP CONT_F10
          
NO_REPETIR:CMP PAUSA, 0
          JZ PAUSAR
          MOV PAUSA, 0
          MOV AL, 0FCH
          JMP CONT_F10
          
PAUSAR:   MOV PAUSA,1
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 0FEH
CONT_F10: OUT IMR, AL
          MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET
          
          RET
          
          ORG 3200H ;SUBRUTINA PARA CLOCK
SUB_TIMER:PUSH AX
          PUSH BX
          MOV BX, OFFSET C
          MOV AL, 1
          INT 7
          CMP C, 30H
          JNZ SIGUE
          MOV AL, 0FEH
          OUT IMR, AL
          MOV FIN, 1
SIGUE:    DEC C
          MOV AL, 0
          OUT CONT, AL
          MOV AL, EOI
          OUT EOI, AL
          POP BX
          POP AX
          IRET
          
          ORG 2000H
          CLI
          MOV AL, 0FCH
          OUT IMR, AL
          MOV AL, F10
          OUT INT0, AL
          MOV AL, TIMER
          OUT INT1, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, 1
          OUT COMP, AL
          STI
LAZO:     JMP LAZO
          INT 0
          END