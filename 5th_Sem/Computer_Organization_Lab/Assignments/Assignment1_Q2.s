    .globl main
    .data

prompt1: 
    .asciiz "Enter the first positive integer:"
prompt2: 
    .asciiz "Enter the second positive integer:"
warning:
    .asciiz "Entered number is negative! Try again\n"
result: 
    .asciiz "GCD of the two integers is: "

    

    .text
main:
    li $t3,0		# $t3 = 0

input1:
    li $v0,4		# issue prompt to get first positive integer
    la $a0, prompt1
    syscall		 


    li $v0,5		# get first positive integer from user
    syscall 
    move $t0,$v0

    bge $t0, $t3, input2
    li $v0,4		# issue warning
    la $a0, warning
    syscall	
    j input1

    

input2:  
    li $v0,4		# issue prompt to get first second integer
    la $a0,prompt2
    syscall
 
    li $v0,5		# get second positive integer from user
    syscall    
    move $t1,$v0

    bge $t1, $t3, while
    li $v0,4		# issue warning
    la $a0, warning
    syscall	
    j input2
    
   
    
while:
	beq $t1, $t3, endwhile		# exit loop if $t1 == $t3
	bgt $t0, $t1, t0_gret_than_t1	# if $t0 > $t1 goto t0_gret_than_t1

	
	sub $t1, $t1, $t0		# $t1 = $t1 - $t0
	b while                 # continue loop
	
t0_gret_than_t1:
	sub $t0, $t0, $t1		#t0 = $t0 - $t1
	b while                 # continue loop

endwhile:
	li $v0,4		        # print "GCD of the two integers is: "
    la $a0,result
    syscall

    li $v0,1                # print $t0 which contains gcd of the numbers
    move $a0,$t0
    syscall

terminate:
    li $v0,10               # terminate the program
    syscall
   



