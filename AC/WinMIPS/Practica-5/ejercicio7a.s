.data
miString: .asciiz "abc"
resultado: .word 0

.code
ld $a0, miString($0)

jal longitud

sd $v0, resultado($0)

halt

longitud:
dadd $v0, $0, $0
loop:
lbu $t1, 0($a0)
beqz $t1, fin
daddi $v0, $v0, 1
daddi $a0, $a0, 1
j loop
fin:
jr $ra