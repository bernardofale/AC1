	.data
lista:	.space 20
	.eqv SIZE,5
	.eqv print_string,4
	.eqv read_int,5
str_1:	.asciiz "\nIntroduza um número: "
	.text
	.globl main
main:	
	la $t1,lista
	li $t0,0	#i=0;
	li $t2,SIZE	#size
loop:	bge $t0,$t2,endloop
	li $v0,print_string
	la $a0,str_1
	syscall
	sll $t3,$t0,2
	addu $t3,$t1,$t3
	li $v0,read_int
	syscall
	sw $v0,0($t3)
	addi $t0,$t0,1
	j loop
endloop:jr $ra
	
	