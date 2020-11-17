    .data
a:  .space 140
b:  .space 140
    .eqv SIZE,35
    .eqv read_int,5
    .eqv print_int10,1
    .text
    .globl main
main:
    la $t0,a    #t0=p1=&(a[0]);
    li $t1,SIZE
    li $t7,0    #n_even=0
    li $t8,0    #n_odd=0
    sll $t1,$t1,2
    addu $t1,$t0,$t1  #t1=pultimo=t0+size
for1:
    bge $t0,$t1,endf1    #p1<pultimo
    li $v0,read_int
    syscall
    sw $v0,0($t0)
    addiu $t0,$t0,4
    j for1
endf1:
    la $t3,b    #t3=p2=&(b[0])
    la $t0,a    #t0=p1=&(a[0])
for2:
    bge $t0,$t1,endf2
    lw $t4,0($t0)   #t4=*p1
    div $t4,$t4,2
    mfhi $t5    #t5=*p1%2
if:
    beq $t5,$0,else
    lw $t6, 0($t3)  #t6=*p2
    ori $t6,$t4,0	
    addi $t6,$t6,1 #*p2++
    sw $t6,0($t3)   #*p2=*p1
    addi $t8,$t8,1  #n_odd++
    addi $t0,$t0,4
    addi $t3,$t3,4
    j for2
else:
    addi $t7,$t7,1  #n_even++
    addi $t0,$t0,4
    addi $t3,$t3,1
    j for2
endf2:
    la $t3,b
    sll $t8,$t8,2   #n_odd*4
    addu $t8,$t8,$t3    #b+n_odd
for3:
    bge $t3,$t8,endf3   #p2<(b+n_odd)
    lw $a0,0($t3)   #*p2
    li $v0,print_int10
    syscall
    addiu $t3,$t3,4
    j for3
endf3:
    jr $ra
    

    


