	.data
fibs:	.word	0 : 12
size:	.word	12
	.text
	.globl	main
main:	la	$t0, fibs
	la	$t5, size
	lw	$t5, 0($t5)