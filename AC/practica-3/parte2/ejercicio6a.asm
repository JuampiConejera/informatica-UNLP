          CONT EQU 10H
          COMP EQU 11H
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
          C DB ?
          FIN DB 0

          ORG 3000H ;SUBRUTINA PARA LEER UN NUMERO
NUMERO:   MOV BX, OFFSET C
LOOP:     INT 6
          MOV AL, C
          CMP AL, 30H
          JS LOOP
          CMP AL, 40H
          JNS LOOP
          RET
          
          ORG 3100H ;SUBRUTINA PARA PRESIONAR SOLAMENTE 1 VEZ F10
SUB_F10:  PUSH AX
          MOV AL, 0FDH
          OUT IMR, AL
          MOV AL, 0
          OUT CONT, AL
          MOV AL, C
          OUT COMP, AL
          MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET

          ORG 3200H ;SUBRUTINA PARA CLOCK
SUB_TIMER:PUSH AX
          PUSH BX
          MOV BX, OFFSET C
          MOV AL, 1
          INT 7
          CMP C, 30H
          JNZ SIGUE
          MOV AL, 0FFH
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
          CALL NUMERO
          CLI
          MOV AL, 0FEH
          OUT IMR, AL
          MOV AL, F10
          OUT INT0, AL
          MOV AL, TIMER
          OUT INT1, AL
          STI
LAZO:     CMP FIN, 1
          JNZ LAZO
          INT 0
          END