	.data
str1:	.asciiz "Introduza dois números :"
str2:	.asciiz "A soma dos números é: " 

	.text
	.globl main
main:	la $a0, str1
	li $v0, 4
	syscall		#print string str1
	
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0
	
	la $a0, str2
	li $v0, 4
	syscall		#print string str2
	
	add $a0, $t0, $t1
	la $v0, 36	#na alinea 3.3 troca-se o 1 por 36
	syscall
	
	li $v0, 10
	syscall		#exit()