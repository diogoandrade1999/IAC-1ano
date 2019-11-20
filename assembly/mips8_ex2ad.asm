	.data
prompt: .asciiz  "Insira 6 numeros: "

	.align 2
lista:	.space 6

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
	
	li $v0, 5
	syscall
	
	mul $t2, $t0, 4
	addu $t3, $t1, $t2		#t3 = lista + i = &lista[i] -> endereço
	sw $v0, 0($t3)			#t3 = lista[i] -> conteudo
	
	addi $t0, $t0, 1
	
	j for
	
end_for:
	li $v0, 10
	syscall				#exit()
	