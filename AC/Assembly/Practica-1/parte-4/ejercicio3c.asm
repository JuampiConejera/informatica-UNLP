          ORG 1000H
          C DB "A"
          ORG 3000H
A_MINUS:  ADD AL,32
          RET
          ORG 2000H
          MOV AL, C
          CALL A_MINUS
          MOV C, AL
          HLT
          END