          ORG 1000H
          C DB "@"
          RES DB ?
          ORG 3000H
ES_MAYUS: CMP AL, 91
          JNS ELSE
          CMP C, 65
          JNS THEN
ELSE:     MOV AH, 0
          JMP FIN
THEN:     MOV AH, 0FFH
FIN:      RET

          ORG 2000H
          MOV AL, C
          CALL ES_MAYUS
          MOV RES, AH
          HLT
          END