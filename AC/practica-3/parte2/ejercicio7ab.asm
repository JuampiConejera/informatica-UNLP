;RTA B
;1. LA VELOCIDAD DE SIM ES MUY RAPIDA POR LO CUAL, EL PROGRAMA FINALIZA ANTES Y QUEDAN
;LETRAS EN EL BUFFER

;2. AL SER LA VELOCIDAD DE IMPRESION MAS RAPIDA QUE LA DE SIMULACION, NO LLEGAN A
;GUARDARSE DOS LETRAS EN EL BUFFER QUE YA SE IMPRIMEN.

;LA MEJOR MANERA ES LA SEGUNDA OPCION YA QUE NO TE QUEDAN LETRAS SIN IMPRIMIR.
          
          EOI EQU 20H
          IMR EQU 21H
          INT2 EQU 26H
          DATO EQU 40H
          ESTADO EQU 41H
          HND EQU 10

          ORG 40
          DW SUB_HND

          ORG 1000H
          MSJ DB "UNIVERSIDAD"
          FIN DB ?


          ORG 3000H
SUB_HND:  PUSH AX
          MOV AL, [BX]
          OUT DATO, AL
          INC BX
          DEC CL
          JNZ FINAL
          MOV AL, 0FFH
          OUT IMR, AL
FINAL:    MOV AL, EOI
          OUT EOI, AL
          POP AX
          IRET

          ORG 2000H
          MOV BX, OFFSET MSJ
          MOV CL, OFFSET FIN - OFFSET MSJ
          CLI
          MOV AL, 0FBH
          OUT IMR, AL
          MOV AL, HND
          OUT INT2, AL
          MOV AL, 80H
          OUT ESTADO, AL
          STI
LAZO:     CMP CL, 0
          JNZ LAZO
          IN AL, ESTADO
          AND AL, 7FH
          OUT ESTADO, AL
          INT 0
          END
