#main
	.data
prompt1: .asciiz "Introduza um numero\n"
result: .asciiz "O fatorial do número inserido é: "

	.text
	.globl main
main:	
	la $a0, prompt1
	li $v0, 4
	syscall				#print_str
	
	li $v0, 5
	syscall				#read_int
	
	move $a0, $v0			#n=a0
	
	jal factorial			#chama a função
	move $t0, $v0			#t0=fatorial(n)
	
	la $a0, result
	li $v0, 4
	syscall				#print_str
	
	move	$a0, $t0
	li $v0, 1
	syscall				#print_int
	
	li $v0, 10
	syscall				#exit


#função factorial
factorial:
	li $v0, 1			#res=1
	move $t0, $a0			#i=num
	
fact_for:
	ble $t0, 0, end_fact_for
	mul $v0, $v0, $t0		#res=res*i
	subi $t0, $t0, 1		#i--
	j fact_for
	
end_fact_for:
	jr $ra