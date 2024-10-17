	.data
A:	.word 10
B:	.word 8
S:	.word 0
P:	.word 0
D:	.word 0

	.text
main:	ld $t8, A($zero)
	ld $t9, B($zero)
	dadd $t0, $t8, $t9
	sd $t0, S($zero)
	dmul $t1, $t8, $t9
	daddi $t1, $t1, 2
	sd $t1, P($zero)
	dmul $t2, $t8, $t8
	ddiv $t2, $st2, $t9
	sd $t2, D($zero)
	halt