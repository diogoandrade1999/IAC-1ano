	.data
prompt1:	.asciiz "Introduza um numero\n"

	.text
	.globl main
main:	la $a0, prompt1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0		#i=0
for:	bge $t1, $t0, endfor	#i<a
	li $v0, 11
	li $a0, '-'
	syscall			#print('-')
	
	addi $t1, $t1, 1	#i++
	j for
	
endfor:	li $v0, 10
	syscall		#exit()