	.data
frase1: .space 20
frase2: .space 20
frase3: .space 40
prompt1: .asciiz "\nInsira a frase1: "
prompt2: .asciiz "\nInsira a frase2: "
prompt3: .asciiz "\n O numero de caracteres da frase1 é: " 
prompt4: .asciiz "\nA frase concatenada é: "

	.text
	.globl main
main:
	la $a0, prompt1
	li $v0, 4
	syscall				#print_str
	
	la $a0, frase1
	li $a1, 20
	li $v0, 8
	syscall				#read_string
	
	la $a0, prompt2
	li $v0, 4
	syscall				#print_str
	
	la $a0, frase2
	li $a1, 20
	li $v0, 8
	syscall				#read_string
	
	la $a0, prompt3
	li $v0, 4
	syscall				#print_str
	
	la $a0, frase1
	jal strlen
	move $a0, $v0
	
	li $v0, 1
	syscall				#print_int10
	
	la $a0,frase3
	la $a1,frase1
	
	jal strcopy
	
	la $a0, frase3
	la $a1,frase2
	jal strcat
	
	la $a0,prompt4
	li $v0,4
	syscall				#print_string
	
	la $a0,frase3
	li $v0,4
	syscall				#print_string
	
	li $v0,10
	syscall				#exit


strlen:
	li $v0, 0			#n=0
	li $t0, 0			#i=0
	
strlen_while:	
	add $t1, $a0, $t0		#t1=str+i=&str[i] ->endereço
	lb $t2, 0($t1)			#t2=str[i] ->conteudo
	addi $t0, $t0, 1		#i++
	beq $t2, '\0', end_strlen_while
	addi $v0, $v0, 1		#n++
	j strlen_while
	
end_strlen_while:
	jr $ra
	
strcopy:
	li $t0, 0			#i=0
	
strcopy_while:
	addu $t1, $a1, $t0		#t1=&src[i]
	lb $t2, 0($t1)			#t2=src[i]
	
	beq $t2, '\0', end_strcopy_while
	addu $t3, $a0, $t0		#t3=&dst[i]
	sb $t2, 0($t3)			#dst[i]=src[i]
	addi $t0, $t0, 1		#i++
	j strcopy_while
	
end_strcopy_while:
	addu $t3, $a0, $t0		#t3=&dst[i]
	sb $0, 0($t3)			#dst[i] = '\0'
	move $v0, $a0			#return dst
	jr $ra
	
strcat:
	subu $sp, $sp, 8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	move $s0, $a0			#aux=dist
	
strcat_while:
	lb $t0, 0($a0)			#t0=*dst
	
	beq $t0, '\0', end_strcat_while
	addiu $a0, $a0, 1		#dst++
	j strcat_while
	
end_strcat_while:
	jal strcopy
	move $v0, $s0			#return aux
	
	lw $s0, 4($sp)
	lw $ra, 0($sp)
	addu $sp, $sp, 8
	jr $ra
