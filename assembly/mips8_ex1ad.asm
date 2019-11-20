	.data
lista:	.word 453, 3, -2, 1, 27, 45
prompt: .asciiz "O conteudo do Array é: \n"
prompt2: .asciiz " - "

	.text
	.globl main
main:
	la $a0, prompt
	li $v0, 4
	syscall				#print_str
	
	li $t0, 0			#i=0
	la $t1, lista
	
for:
	bge $t0, 6, end_for
	
	mul $t4, $t0, 4
	addu $t2, $t1, $t4		#t2 = lista + i = &lista[i] -> endereço
	lw $t3, 0($t2)			#t2 = lista[i] -> conteudo
	
	addi $t0, $t0, 1		#i++
	
	move $a0, $t3
	li $v0, 1
	syscall				#print_int10
	
	la $a0, prompt2
	li $v0, 4
	syscall				#print_str
	
	j for
	
end_for:
	li $v0, 10
	syscall				#exit()