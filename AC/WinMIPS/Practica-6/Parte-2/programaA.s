.data
A: .word 0
.code
daddi $t1,$0,5
daddi $t2, $0, 7
slt $t3,$t1,$t2
daddi $t1,$0,1
and $t4,$t3,$t1
daddi $t1,$0,8
sd $t4,A($t1)
halt
;no se puede modificar