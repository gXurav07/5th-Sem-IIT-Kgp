 # This program takes two positive integers as input and prints their GCD

    .globl main
    .data

prompt1: 
    .asciiz "Enter the first positive integer: "
prompt2: 
    .asciiz "Enter the second positive integer: "
warning:
    .asciiz "Entered number is not positive! Try again\n"
result: 
    .asciiz "GCD of the two integers is: "

    

    .text

# main program
#
# program variables
#   a:  $t0
#   b:  $t1      
#   
main:

input1:
    li $v0,4		# issue prompt to get first positive integer
    la $a0, prompt1
    syscall		 


    li $v0,5		# get first positive integer from user
    syscall 
    move $t0,$v0    # a <-- $v0

    bgt $t0, $0, input2 # if a>0 goto input2
    li $v0,4		# else issue warning
    la $a0, warning
    syscall	
    j input1

    

input2:  
    li $v0,4		# issue prompt to get second positive integer
    la $a0,prompt2
    syscall
 
    li $v0,5		# get second positive integer from user
    syscall    
    move $t1,$v0    # b <-- $v0

    bgt $t1, $0, while  # if b>0 goto while
    li $v0,4		# issue warning
    la $a0, warning
    syscall	
    j input2
    
   
    
while:                              # while b != 0
	beq $t1, $0, endwhile		    # exit loop if b == 0
	bgt $t0, $t1, a_gret_than_b	    # if a > b goto a_gret_than_b

	
	sub $t1, $t1, $t0		# b = b - a
	b while                 # continue loop
	
a_gret_than_b:
	sub $t0, $t0, $t1		# a = a - b
	b while                 # continue loop

endwhile:
	li $v0,4		        # print "GCD of the two integers is: "
    la $a0,result
    syscall

    li $v0,1                # print a 
    move $a0,$t0
    syscall

terminate:
    li $v0,10               # terminate the program
    syscall
   



