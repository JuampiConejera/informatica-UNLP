        ORG 3000H; SUBRUTINA MUL
MUL:    PUSH BX
        PUSH CX
        PUSH AX
        PUSH DX
        MOV BX, SP
        ADD BX, 12 ; CORRECCION POR EL IP(2), RES(2) Y LOS 4 REGISTROS (8)
        MOV CX, [BX]; CX = NUM2
        ADD BX, 2 ; BX APUNTA A NUM1
        MOV AX, [BX] ; ax = num1
        SUB BX, 4 ; bx apunta a la dir de resultado
        MOV BX, [BX] ; guardo
        MOV DX, 0
  SUMA: ADD DX, AX
        DEC CX
        JNZ SUMA
        MOV [BX], DX ; guardar resultado
        POP DX ;restaurar registros
        POP AX
        POP CX
        POP BX
        RET
        ORG 1000H ; Memoria de datos
        NUM1 DW 5H
        NUM2 DW 3H
        RES DW ?
        ORG 2000H; Prog principal
        ; parámetros
        MOV AX, NUM1
        PUSH AX
        MOV AX, NUM2
        PUSH AX
        MOV AX, OFFSET RES
        PUSH AX
        CALL MUL
        ; desapilar parámetros
        POP AX
        POP AX
        POP AX
        HLT
        END
;RTAS=
;A)¿Cuál es el modo de direccionamiento de la instrucción MOV AX, [BX]? ¿Qué se copia en el registro AX en este caso?
;RTA: Es un modo de direccionamiento indirecto. Se copia AX= 00 05.

;B)¿Qué función cumple el registro temporal ri que aparece al ejecutarse una instrucción como la anterior?
;RTA: Se utiliza para almacenar datos temporales y realizar operaciones lógicas.

;C)¿Qué se guarda en AX al ejecutarse MOV AX, OFFSET RES?
;RTA: 10 04, la ubicación en memoria de la variable RES

;D)¿Cómo se pasa la variable RES a la pila, por valor o por referencia? ¿Qué ventaja tiene esto?
;RTA:Se pasa con un modo de direccionamiento indirecto, por valor.

;E)¿Cómo trabajan las instrucciones PUSH y POP?
;RTA: La instrucción "PUSH (x)" Carga (x) en el tope de la pila.->
;La variable "POP (x)" Desapila el tope de la pila y lo carga en (x).