	.data
mome:	.asciiz	"Ola Mundo"

	.text
	.globl main
main:	la $a0, mome
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall		#exit()

	
