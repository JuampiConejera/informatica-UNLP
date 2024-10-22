.data
texto: .asciiz "Hola, Mundo!" ; El mensaje a mostrar
CONTROL: .word 0x10000
DATA: .word 0x10008
.code
ld $t0, CONTROL($zero) ; $t0 = dirección de CONTROL
ld $t1, DATA($zero) ; $t1 = dirección de DATA
daddi $t2, $zero, texto ; $t2 = dirección del mensaje a mostrar
sd $t2, 0($t1) ; DATA recibe el puntero al comienzo del mensaje
daddi $t8, $zero, 10 ; cantidad de repeticiones
loop:
daddi $t9, $zero, 4 ; $t2 = 4 -> función 4: salida de una cadena ASCII
sd $t9, 0($t0) ; CONTROL recibe 4 y produce la salida del mensaje
daddi $t8, $t8, -1
bnez $t8, loop
halt
