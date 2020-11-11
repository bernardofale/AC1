	.data
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:	.asciiz ";"
str2:	.asciiz "\nConteúdo do array:\n"
	.eqv SIZE,10
	.eqv print_int10, 1
	.eqv print_string, 4
	.text
	.globl main
main:	
	la $t0,lista
	li $t1, SIZE
	sll $t2,$t1,2
	addu $t2,$t2,$t0	#lista+size
	li $v0,print_string
	la $a0,str2
	syscall
loop:	bgeu $t0,$t2,endloop
	lw $t5,0($t0)
	li $v0,print_int10
	move $a0,$t5
	syscall
	li $v0,print_string
	la $a0,str1
	syscall
	addiu $t0,$t0,4
	j loop
endloop:
	jr $ra
	
	
	