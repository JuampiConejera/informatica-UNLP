.data
V: .word 5, 2, 6
RES: .word 0
.code
dadd $t0, $zero, $zero      ;pongo en valor 0 $t0
ld $t9, V($t0)
dadd $t8, $t8, $t9
daddi $t0, $t0, 8
ld $t9, V($t0)
daddi $t0, $t0, 8
dadd $t8, $t8, $t9
ld $t9, V($t0)
dadd $t8, $t8, $t9

sd $t8, RES ($zero)
halt