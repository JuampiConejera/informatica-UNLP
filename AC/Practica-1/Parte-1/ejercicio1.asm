        ORG 1000H
MENSAJE DB "holaa"
CANT    DB ?
        ORG 2000H
        MOV BX, OFFSET MENSAJE ;INICIALIZO BX PARA USAR [BX]
        MOV CX, OFFSET CANT - OFFSET MENSAJE
        MOV DX, 0
        MOV CANT, 0
        
LOOP:   CMP CX, DX
        JZ FIN
        INC DX
        CMP BYTE PTR [BX], 97
        JZ SUMA
        INC BX
        JMP LOOP
SUMA:   INC CANT
        JMP LOOP
FIN:    HLT
        END