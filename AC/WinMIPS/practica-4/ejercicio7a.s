.data
V: .word 0,1,1,2,3,5,8,13,21,34
POS: .word 0
MAX: .word 0

.code
daddi $t0, $zero, 10
daddi $t2, $zero, V
daddi $t4, $zero, 2

loop:
ld $t1, 0 ($t2)
slt $t8, $t1, $zero             ;t1 < 0
beqz $t8, es_positivo           ;CONTAR POSITIVOS
vuelta:                         ;vuelve del es_positivo
sd $t8, MAX($zero)              ;cargo el numero Maximo
slt $t8, $t8, $t1               ; MAX < nuevo numero
beqz $t8, sigue                 ; t8 = 0 sigue , ELSE MAX = t2
sd $t1, MAX ($zero)             ; guardo el maximo
sigue:
dmul $t3, $t1, $t4              ;t1 * 2
sd $t3, 0 ($t2)                 ;cargo t1*2


daddi $t2, $t2, 8
daddi $t0, $t0, -1
bnez $t0, loop
j fin

es_positivo:
ld $t8, POS ($zero)             ;cargo la cantidad de positivos que llevo contados
daddi $t8, $t8, 1               ;t8++
sd $t8, POS ($zero)
j vuelta

fin:
halt
