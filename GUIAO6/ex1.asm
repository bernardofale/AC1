    .data
s0: .asciiz "Array"
s1: .asciiz "de"
s2: .asciiz "ponteiros"
char: .asciiz "\n"
array: .word s0,s1,s2
    .eqv SIZE,3
    .eqv print_string,4
    .eqv print_char,11
    .text
    .globl main
main:
    la $t1,array    
    li $t0,0    #i=0
    li $t3,SIZE #t3=size
loop:
    bge $t0,$t3,endloop
    sll $t5,$t0,2
    addu $t6,$t1,$t5
    lw $t4,0($t6)
    li $v0,print_string
    move $a0,$t4
    syscall
    li $v0,print_char
    la $a0,char
    syscall
    addiu $t0,$t0,1
    j loop
endloop:
    jr $ra










