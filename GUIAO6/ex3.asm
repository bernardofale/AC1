    .data
s0: .asciiz "Array"
s1: .asciiz "de"
s2: .asciiz "ponteiros"
str:.asciiz "\nString #"
st1:.asciiz ": "
st2:.asciiz "-"
char:.asciiz "\n"
charf:.asciiz "\0"
arr:.word s0,s1,s2
    .eqv SIZE,3
    .eqv print_string,4
    .eqv print_char,11
    .eqv print_int10,1
    .text
    .globl main
main:
    li $t0,0    #i=0
    li $t2,SIZE #t2=size
    la $t3,arr   #t3=arr

for:
    bge $t0,$t2,endfor
    li $v0,print_string
    la $a0,str
    syscall
    li $v0,print_int10
    move $a0,$t0
    syscall
    li $v0,print_string
    la $a0,st1
    syscall

    sll $t9,$t0,2
    addu $t7,$t9,$t3
    lw $t4,0($t7)   #t4=arr[i]
    la $t5,charf
    lb $t6,0($t5)
    li $t1,0    #J=0
    
while:
    lb $t8,0($t4)
    beq $t8,$t6,endw
    li $v0,print_char
    move $a0,$t8
    syscall
    li $v0,print_char
    la $a0,st2
    syscall
    addiu $t4,$t4,1
    j while
endw:
    addiu $t0,$t0,1
    j for
endfor:
    jr $ra







