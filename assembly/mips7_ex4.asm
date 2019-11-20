	.data
prompt1:.asciiz "Introduza um numero: "
result:	.asciiz "\n O número em hexadecimal é: "

	.text
	.globl main
main:	la $a0, prompt1		#print
	li $v0, 4
	syscall
	
	li $v0, 5		#read
	syscall
	
	move $t0, $v0		#num = read
	
	la $a0, result		#print
	li $v0, 4
	syscall
	
	li $t1, 0		#n = 0
	
for:	bge $t1, 8, endfor
	andi $t2, $t0, 0xF0000000	#$t2 = num & 0xF0000000
	srl $t2, $t2, 28		#$t2 >> 28
	
	move $a0, $t2		#print
	li $v0, 34
	syscall
	
	sll $t0, $t0, 4		#num << 4
	addi $t1, $t1, 1	#n++
	j for
	
endfor:	li $v0, 10
	syscall			#exit()