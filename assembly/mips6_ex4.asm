	.text
	.globl main
main:	li $t1, 0x12345678
	
	andi $a0, $t1, 0xF0000000
	srl $a0, $a0, 28
	li $v0, 34
	syscall
	
	li $a0, ' '
	li $v0, 11
	syscall

	andi $a0, $t1, 0x0F000000
	srl $a0, $a0, 24
	li $v0, 34
	syscall
	
	li $a0, ' '
	li $v0, 11
	syscall
	
	li $v0, 10
	syscall		#exit()