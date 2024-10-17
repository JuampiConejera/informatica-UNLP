        ORG 1000H
        C DB "@"
        RES DB ?
        ORG 2000H
        CMP C, 91
        JNS ELSE
        CMP C, 65
        JNS THEN
ELSE:   MOV RES, 0
        JMP FIN
THEN:   MOV RES, 0FFH
FIN:    HLT
        END