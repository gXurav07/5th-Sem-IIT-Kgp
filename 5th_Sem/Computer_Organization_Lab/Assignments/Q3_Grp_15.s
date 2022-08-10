# This program takes an integer >=10 as input and prints whether that niteger is PRIME or COMPOSITE 
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
# main program
#
# program variables
#   a:   $s0    (used as constant with value 10) 
#   n:   $s1    (input integer)
#   i:   $t0    (loop variable)
#   sq:  $t1    (helper variable used to calculate floor(sqrt(n))
#   x:   $t3    (helper varibale)
#   rem: $t4    (helper variable which stores n%i) 
#
main:
    li $s0, 10      # helper integer 

input: 
    li $v0, 4       # issue prompt to get a positive integer n
    la $a0, prompt
    syscall

    li $v0, 5       # get a positive integer from user
    syscall
    move $s1, $v0

    bge $s1, $s0, algo      # moving to the solution if the number n is >= 10

    li $v0, 4       # issue warning on getting a number less than 10
    la $a0, warning
    syscall
    j input         # jump back to the input

algo:
    li $t0, 2       # loop variable i
    li $t1, 1       # variable sq

while:
    mul $t3, $t1, $t1   # x = sq*sq
    bgt $t3, $s1, endWhile  # if x>n goto endWhile
    addi $t1, $t1, 1        # sq = sq + 1
    b while                 # continue loop

endWhile:
    add $t1, $t1, -1			# sq = sq - 1 ( becaule currently sq is > floor(sqrt(n))

while1:
    bgt $t0, $t1, prime         # if i>sq move to prime section 
    div $s1, $t0                # divide n by i and store the remainder in hi
    mfhi $t4                    # rem <-- n%i
    beq $t4, $0, composite      # if rem==0 then goto composite 
    addi $t0, $t0, 1            # else incrementing the loop variable
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