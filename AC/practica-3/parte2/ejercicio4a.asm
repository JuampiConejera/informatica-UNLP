          EOI EQU 20H
          IMR EQU 21H
          INT0 EQU 24H
          F10 EQU 15
          ORG 60
          IP_F10 DW SUB_F10
          ORG 1000H
          MSJ DB "VAMOS LAS INTERRUPCIONES!"
          FMSJ DB " "

          ORG 3000H
SUB_F10:  PUSH AX
          PUSH BX
          MOV AL, OFFSET FMSJ - OFFSET MSJ
          MOV BX, OFFSET MSJ
          INT 7
          MOV AL, EOI
          OUT EOI, AL
          POP BX
          POP AX
          IRET
          
          ORG 2000H
          ;INICIO CONFIGURACION
          CLI
          MOV AL, 0FEH
          OUT IMR, AL
          MOV AL, F10
          OUT INT0, AL
          STI
          ;FIN CONFIGURACION
LAZO:     JMP LAZO
          INT 0
          END