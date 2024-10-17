.data
A: .word 16
B: .word 8
C: .word 9

.code
ld $t0, A ($zero)
ld $t1, B ($zero)
ld $t2, C ($zero)

beqz $t0, then ; if ( A = 0)

;(A != 0)
slt $t8, $t0, $t1 ;else: if(A > B)
beqz $t8, elseThen


dadd $t2, $t1, $zero ;(A < B)
j end


elseThen: ;(A > B)
daddi $t9, $t9, 2
dmul $t2, $t0, $t9
j end

then: ; (A = 0)
dadd $t2, $zero, $zero


end:
sd $t2, C ($zero)
halt