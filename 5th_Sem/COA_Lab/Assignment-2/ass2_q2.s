.globl main
    .data
prompt:
    .asciiz "abcd: \n" 
    .text

main:
    li $v0, 9
    li $a0, 40
    syscall
    move $s0, $v0
    move $t0, $s0
    addi $t1, $s0, 40
    while:
        beq $t0, $t1, endwhile	# if $t0 == $t1 then endwhile
        li $v0, 5
        syscall
        # la $a0, prompt
        # li $v0, 4
        # syscall
        sw $v0, 0($t0)
        addi $t0, $t0, 4
        b while 
    
    endwhile: 

    move $t0, $s0
    while1:
        beq $t0, $t1, endwhile1	# if $t0 == $t1 then endwhile
        lw $a0, 0($t0)
        li $v0, 1
        syscall
        addi $t0, $t0, 4
        b while1
        
    endwhile1: 
        li $v0, 10
        syscall