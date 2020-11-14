    .data
s0: .asciiz "Array"
s1: .asciiz "de"
s2: .asciiz "ponteiros"
char:.asciiz "\n"
arr:.word s0,s1,s2
    .eqv SIZE,3
    .eqv print_string,4
    .eqv print_char,11
    .text
    .globl main
main:
    li $t1,SIZE #t1=size
    sll $t1,$t1,2 #t1=size*4
    la $t2,arr  #t2=arr
    addu $t3,$t2,$t1 #t3=pultimo
loop:
    bge $t2,$t3,endl
    lw $t4,0($t2)
    li $v0,print_string
    move $a0,$t4
    syscall
    li $v0,print_char
    la $a0, char
    syscall
    addiu $t2,$t2,4
    j loop
endl:
    jr $ra














