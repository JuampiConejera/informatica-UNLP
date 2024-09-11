                  PA EQU 30H

                  ORG 3000H
flanco_ascendente:IN AL, PA ;STROBE 0
                  AND AL, 0FDH
                  OUT PA, AL

                  IN AL,PA ;STROBE 1
                  OR AL, 10B
                  OUT PA, AL
                  RET
                  ORG 2000H
                  CALL flanco_ascendente
                  INT 0
                  END