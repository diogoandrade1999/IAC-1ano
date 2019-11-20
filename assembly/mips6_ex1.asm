	.text
	.globl main
main:	li	$t0, 0x12345678
	li	$t1, 0x0000000F

	and $t2,$t0,$t1
#	or $t2,$t0,$t1
#	nor $t2,$t0,$t1
#	xor $t2,$t0,$t1

	li $v0,10
	syscall		#exit()