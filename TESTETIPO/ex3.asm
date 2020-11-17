    .data
val:.word 8,4,15,-1987,327,-9,27,16
st1:.asciiz "Result is: "
char:.asciiz ","
    .eqv SIZE,8
    .eqv print_string,4
    .eqv print_int10,1
    .eqv print_char,4
    .text
    .globl main
main:
    li $t0,0            #$t0=i, $t1=v
    li $t5,2            #2
    li $t3,SIZE         #$t3=SIZE=8
    la $t2,val          #$t2=&(val[0])
do:
    sll $t0,$t0,2
    addu $t8,$t0,$t2
    sw $t1,0($t8)       #v=val[i]
    div $t3,$t5         #(size/2)
    mflo $t6
    addu $t9,$t0,$t6
    sll $t9,$t9,2
    addu $t7,$t2,$t9
    sw $t8,0($t7)       #val[i]=val[i+SIZE/2]
    sw $t7,0($t1)
while:
    addiu $t0,$t0,1
    bge $t0,$t6,next
    j do
next:
    li $v0,print_string
    la $a0,st1
    syscall
    li $t0,0
    li $t1,0
do2:
    addiu $t0,$t0,1
    sll $t1,$t0,2
    addu $t2,$t2,$t1
    lw $a0,0($t2)
    li $v0,print_int10
    syscall
    li $v0,print_char
    la $a0,char
    syscall
while2:
    bge $t0,$t3,end
    j do2
end:
    jr $ra

    


