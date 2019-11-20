	.data
prompt1:.asciiz "Introduza um numero\n"
result:	.asciiz "O fatorial do número inserido é: "

	.text
	.globl main
main:	la $a0, prompt1		#print
	li $v0, 4
	syscall
	
	li $v0, 5		#n = read_int()
	syscall
	
	move $t0, $v0
	li $t1, 1		#f = 1
	move $t2, $t0		#i = n
	
for:	ble $t2, 0, endfor	#i > 0
	mul $t1, $t1, $t2
	subi $t2, $t2, 1	#i--
	j for
	
endfor:	la $a0, result		#print
	li $v0, 4
	syscall
	
	move $a0, $t1		#print
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall			#exit()
	