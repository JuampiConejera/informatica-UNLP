.data
F: .word 1
I: .word 1
N: .word 5

.code
ld $t0, F ($zero)
ld $t1, I ($zero)
ld $t2, N ($zero)


for:
dmul $t0, $t0, $t1      ; (F = F * I)
beq $t1, $t2, fin
daddi $t1, $t1, 1       ; (i++)
j for

fin: 
sd $t0, F ($zero)
halt