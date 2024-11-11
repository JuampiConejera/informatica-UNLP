.data
A: .word 1
B: .word 2
.code
ld $t1, A($0)
ld $t2, B($0)
sd $t2, A($0)
sd $t1, B($0)
halt