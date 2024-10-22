.data
V: .word 0, 10, 10
RES: .word 0

.code
daddi $t9, $zero, 3
daddi $t7, $zero, 8

loop:
beq $t8, $t9, fin               ;t8 = t9 -> fin
dmul $t2, $t8, $t7              ; t2 = t8 * 8
ld $t0, V ($t2)
dadd $t1, $t1, $t0
daddi $t8, $t8, 1               ;t8++
j loop

fin:
sd $t1, RES ($zero)
halt