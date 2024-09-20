                        HDATO EQU 40H
                        HESTADO EQU 41H
                        ORG 1000H
                        MSJ DB "INGENIERIA E INFORMATICA"
                        FIN DB ?
                        ORG 3000H
IMPRIMIR_CARACTER_HAND: MOV BX, OFFSET MSJ
POLL:                   IN AL, HESTADO
                        AND AL, 1
                        JNZ POLL
                        MOV AL, [BX]
                        OUT HDATO, AL
                        INC BX
                        CMP BX, OFFSET FIN
                        JNZ POLL
                        RET
                        
                        ORG 2000H
                        ;Configuracion
                        IN AL, HESTADO
                        AND AL, 07FH
                        OUT HESTADO, AL
                        CALL IMPRIMIR_CARACTER_HAND
                        INT 0
                        END