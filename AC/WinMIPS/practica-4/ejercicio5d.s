.data
L: .word 0
N: .word 6

.code
ld $t0, L ($zero)
ld $t1, N ($zero)
daddi $t9, $zero, 2

while:
slt $t8, $zero, $t1       ; while(N > 0) 
beq $t8, $zero, fin         ; salta si $t8 = 1
ddiv $t1, $t1, $t9          ; N = N / 2
daddi $t0, $t0, 1           ; L = L + 1
j while



fin:
sd $t0, L ($zero)
halt