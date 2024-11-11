.data
res: .word 0
.code
daddi $t3, $0, 0
daddi $t1, $0, 4
daddi $t2, $0, 3
loop:daddi $t1,$t1,-1
dadd $t3,$t3,$t2
bnez $t1, loop
sd $t3,res($0)
halt