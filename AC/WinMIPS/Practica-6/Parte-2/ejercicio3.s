.data
A: .word 1
B: .word 3
C: .word 0
.code
ld $t2, B($0)
ld $t1, A($0)
loop: daddi $t2, $t2, -1
dsll $t1, $t1, 1
bnez $t2, loop
sd $t1, C($0)
halt