.data
A: .word 999
B: .word 0

.code
ld $t0, A ($zero)
ld $t1, B ($zero)


andi $t0, $t0, 1
beqz $t0, es_par
daddi $t1, $zero, 1
j fin

es_par:
dadd $t1, $zero, $zero
j fin

fin:
sd $t1, B ($zero)
halt