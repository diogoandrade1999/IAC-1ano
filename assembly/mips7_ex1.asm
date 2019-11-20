	.data
prompt1:	.asciiz "Introduza um numero\n"
strpar:		.asciiz "O numero é par\n"
strimpar:	.asciiz "O numero é impar\n"

	.text
	.globl main
main:	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	andi $v0, $v0, 1	#$t1 = a&1
	
if:	bne $v0, 0, else
	la $a0, strpar
	j endif
	
else:	la $a0, strimpar
	
endif:	li $v0, 4
	syscall
	li $v0, 10
	syscall		#exit()