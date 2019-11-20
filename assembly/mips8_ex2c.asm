	.data
minus: .asciiz "TEXTO EM MAIUSCULAS"
maius: .space 20

	.text
	.globl main
main:	li $t0, 0			#i = 0
	la $t1, minus
	
while:	
	add $t2, $t1, $t0		#t2 = minus + 1 -> endereço
	lb $t3, 0($t2)			#t3 = minus[i] -> conteudo
	beq $t3, '\0', endwhile
	
if:
	blt $t3, 'A', else
	bgt $t3, 'Z', else
	add $t3, $t3, 'a'
	sub $t3, $t3, 'A'		#t3 = minus[i] - 'A' + 'a'

else:
	la $t4, maius
	addu $t5, $t4, $t0		#t5 = maius + i = &maius[i]
	sb $t3, 0($t5)			#maius[i] = $t3
	addi $t0, $t0, 1		#i++
	j while
	
endwhile:
	la $a0, maius
	li $v0, 4
	syscall				#print maius
	li $v0, 10
	syscall				#exit()