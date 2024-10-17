          ORG 1100H
          MSJWIN DB "GANASTE!"
          FMSJWIN DB ?
          ORG 1200H
          MSJLOSE DB "PERDISTE, EL STRING ERA "
          FMSJLOSE DB ?
          ORG 1300H
          MSJ DB "INGRESÁ LA PALABRA A ADIVINAR: "
          FMSJ DB ?
          ORG 1400H
          MSJ2 DB "COMENZÁ A ADIVINAR!  "
          FMSJ2 DB ?
          ORG 1500H
          CORTE DB 46 ; "."N
          INTENTOS DB 1 ;CANTIDAD INTENTOS
          ORG 1600H
          LARGO_STR DB 0 ;PARA SABER LA CANTIDAD DE CARACTERES DEL STR ESCRITO
          STR DB ?
          ORG 1700H
          lARGO_ADV DB 0 ;UTILIZADO PARA SABER DONDE ESTAMOS SITUADOS AL ADIVINAR
          ADV_STR DB ?
          ORG 3000H
IMP_MSJ:  MOV BX, OFFSET MSJ
          MOV AL, OFFSET FMSJ - OFFSET MSJ
          INT 7
          RET

          ORG 3050H
ESCRIBIR: MOV BX, OFFSET STR
LOOP:     INT 6
          CMP BYTE PTR [BX], 46
          JZ CORTAR ;SI DA 0 (".") TERMINA DE ESCRIBIR EL STR, SINO SIGUE
          INC BX
          INC LARGO_STR
          JMP LOOP
CORTAR:   MOV BX, OFFSET MSJ2
          MOV AL, OFFSET FMSJ2 - OFFSET MSJ2
          RET

          ORG 3100H
ADIVINAR: INT 6
          MOV DL, [BX]
          CMP [BX], DL
          JNZ NO ;SI DA 0 ES CORRECTO, SINO INTENTOS - 1
          MOV AL, 1
          INT 7
          INC BX
          INC LARGO_ADV
          JMP FADIVINAR
NO:       DEC INTENTOS
FADIVINAR:RET
          
          ORG 3500H
GANASTE:  MOV BX, OFFSET MSJWIN
          MOV AL, OFFSET FMSJWIN - OFFSET MSJWIN
          INT 7
          RET

          ORG 3550H
PERDISTE: MOV BX, OFFSET MSJLOSE
          MOV AL, OFFSET FMSJLOSE - OFFSET MSJLOSE
          INT 7
          MOV BX, OFFSET STR
          MOV AL, LARGO_STR
          INT 7
          RET
          
          ORG 2000H
          CALL IMP_MSJ
          CALL ESCRIBIR
          MOV CL, LARGO_STR
          MOV BX, OFFSET ADV_STR
BUCLE:    CALL ADIVINAR
          CMP CL, LARGO_ADV
          JZ WIN
          CMP INTENTOS, 0
          JZ FIN
          JMP BUCLE
WIN:      CALL GANASTE
          JMP FIN
LOSE:     CALL PERDISTE
          JMP FIN
FIN:      INT 0
          END