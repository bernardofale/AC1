	.data
lista:	.space 40
	.eqv SIZE,10
	.eqv TRUE,1
	.eqv FALSE,0
	.eqv read_int10,5
	.eqv print_string,4
	.eqv print_int10,1
str1:	.asciiz "\nConteúdo do array:\n"
str2:	.asciiz ";"				#$t0=i,$t2=houvetroca,$t3=*p,$t4=size,$t5=lista+size
	.text					#$t6=lista[i], $t7=lista[i+1]
	.globl main				
main:	
	la $t3,lista
	li $t4,SIZE
	sll $t5,$t4,2
	addu $t5,$t5,$t3
	addi $t8,$t4,-1			#size-1
for1:	
	bge $t3,$t5,do
	li $v0,read_int10
	syscall
	sw $v0,0($t3)
	addiu $t3,$t3,4
	j for1
do:	
	li $t2,FALSE
	la $t3,lista		
	li $t0,0	
for:	
	bge $t0,$t8,while	
	sll $t9,$t0,2
	addu $t9,$t3,$t9	#&lista[i]
	lw $t6,0($t9)		#lista[i]
	lw $t7,4($t9)		#lista[i+1]
if:
	ble $t6,$t7,endif
	sw $t6,4($t9)
	sw $t7,0($t9)
	li $t2,TRUE
	j endif
endif:	
	addi $t0,$t0,1
	j for
while:	
	beq $t2,TRUE,do
	li $t0,0
	li $v0,print_string
	la $a0,str1
	syscall
for2:
	bge $t0,$t4,endp
	sll $t1,$t0,2
	addu $t1,$t3,$t1
	lw $t2,0($t1)
	li $v0,print_int10
	move $a0,$t2
	syscall
	li $v0,print_string
	la $a0,str2
	syscall
	addi $t0,$t0,1
	j for2
endp: 
	jr $ra

	
	
	
	
	