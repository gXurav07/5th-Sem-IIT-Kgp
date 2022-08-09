    .globl main
    .data

prompt: 
    .asciiz "Enter a positive integer greater than equals to 10: "
warning: 
    .asciiz "Entered number is less than 10! Try again\n"
result1:
    .asciiz "Entered number is a PRIME number."
result2:
    .asciiz "Entered number is a COMPOSITE number."

    .text
main:
    li $s0, 10      # helper integer 

input: 
    li $v0, 4       # issue prompt to get a positive integer
    la $a0, prompt
    syscall

    li $v0, 5       # get a positive integer from user
    syscall
    move $s1, $v0

    bge $s1, $s0, algo      # moving to the solution if the number is >= 10

    li $v0, 4       # issue warning on getting a number less than 10
    la $a0, warning
    syscall
    j input         # jump back to the input

algo:
    li $t0, 2       # loop variable 
    li $0, 0       # helper integer 
    li $t1, 1       

while:
    mul $t3, $t1, $t1
    bgt $t3, $s1, endWhile
    addi $t1, $t1, 1
    b while

endWhile:
    add $t1, $t1, -1			# 

while1:
    bgt $t0, $t1, prime         # move to prime section if loop variable becomes gretaer than sq the input
    div $s1, $t0                
    mfhi $t3                    # storing the remainder in $t3
    beq $t3, $0, composite      # if remainder is zero then composite
    addi $t0, $t0, 1            # incrementing the loop variable
    b while1                    # continue loop

composite: 
    li $v0, 4
    la $a0, result2             # print "Entered number is a COMPOSITE number."
    syscall
    j terminate

prime:
    li $v0, 4
    la $a0, result1             # print "Entered number is a PRIME number."
    syscall
    j terminate

terminate: 
    li $v0, 10                  # terminate the program
    syscall