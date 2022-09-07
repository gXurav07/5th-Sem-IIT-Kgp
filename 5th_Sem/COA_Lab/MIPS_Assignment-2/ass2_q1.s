# Assignment 2
# Question 1
# Group 15
# Group Members:
# Gaurav Malakar - 20CS10029 
# Prakhar Singh - 20CS10045
    .globl main
    .data

prompt1: 
    .asciiz "Enter first number: "
prompt2: 
    .asciiz "Enter second number: "
warn:
    .asciiz "Entered number is not a valid 16-bit integer! Try again\n"
result: 
    .asciiz "Product of the two numbers are: "
newline:
    .asciiz "\n"

    .text

 
main:

    li $t0, 0   # Q
    li $t1, 0   # M
    li $s0, -32768  # lower bound for 16-bit signed integer
    li $s1, 32767   # upper bound for 16-bit signed integer

input1:
    li $v0, 4		# issue prompt to get a first number
    la $a0, prompt1
    syscall		 
    li $v0, 5		# get first number from user
    syscall 
    move $t0, $v0

    # Sanity Check
    bgt $t0, $s1, warning0	# if $t0 > $s1 then warning
    blt $t0, $s0, warning0	# if $t0 < $s0 then warning

input2:
    li $v0, 4		# issue prompt to get second number
    la $a0, prompt2
    syscall		 

    li $v0, 5		# get second number from user
    syscall 
    
    move $t1, $v0

    # Sanity Check
    bgt $t1, $s1, warning1	# if $t1 > $s1 then warning
    blt $t1, $s0, warning1	# if $t1 < $s0 then warning

    j call_the_function
warning0: 
    li $v0, 4		# print the warning
    la $a0, warn
    syscall	
    j input1

warning1: 
    li $v0, 4		# print the warning
    la $a0, warn
    syscall	
    j input2
    
call_the_function:
    # setting up the function arguments
    move 	$a0, $t0		# $a0 = $t0, $a0 represents Q
    move 	$a1, $t1		# $a1 = $t1, $a1 represents M

    jal		multiply_booth	# call the function multiply_booth

    move    $t0, $v0        # $t0 = $v0 = Q*M

    li $v0, 4		        # issue prompt to return the answer
    la $a0, result
    syscall		

    move $a0, $t0           # print the answer Q*M
    li $v0, 1
    syscall

    li $v0, 4		        # newline
    la $a0, newline
    syscall	

terminate:
    li      $v0, 10         # terminate the program
    syscall
    

multiply_booth:  
    li      $t2, 0        # A
    li      $t3, 0        # Q_-1
    li      $t4, 16       # count
    sub     $t7, $0, $a1  # -M
    li      $t6, 65535    # 65535 = 2^16 - 1
    # (2^16 - 1) is used to remove upper 16 bits

     
    and     $a0, $a0, $t6   # Q = Q & (2^16 - 1), removes upper 16 bits
    and     $a1, $a1, $t6   # M = M & (2^16 - 1), removes upper 16 bits
    and     $t7, $t7, $t6   # (-M) = (-M) & (2^16 - 1), removes upper 16 bits

while:  # while(count>0)
    ble     $t4, 0, endwhile    # if count<=0 goto endwhile

    li      $t5, 1              # Q0 = 1
    and     $t5, $t5, $a0       # Q0 = Q & 1

    beq     $t5, $0, case0_        # if Q0 == 0 goto case0_ else go below to case1_

case1_:
    beq     $t3, $0, case10        # if Q_-1 == 0 goto case10 else go below to case11

case11:
    j       arithmetic_shift_right

case10:
    add     $t2, $t2, $t7		# A = A - M
    and     $t2, $t2, $t6       # A = A & (2^16 - 1), removes upper 16 bits
    j       arithmetic_shift_right


case0_:
    beq     $t3, $0, case00

case01:
    add     $t2, $t2, $a1		# A = A + M
    and     $t2, $t2, $t6       # A = A & (2^16 - 1), removes upper 16 bits
    j       arithmetic_shift_right

case00:
    j       arithmetic_shift_right

arithmetic_shift_right:
    li      $s0, 1   # A0
    and     $s0, $s0, $t2 

    li      $s1, 1   # msb of A
    sll     $s1, $s1, 15
    and     $s1, $s1, $t2     

    srl	    $t2, $t2, 1			# A = A >> 1
    add     $t2, $t2, $s1

    srl	    $a0, $a0, 1			# Q = Q >> 1

    sll	    $s0, $s0, 15		# $s0 = A0 << 15
    add     $a0, $a0, $s0	  	# Q = A0(Q>>1)   
    move    $t3, $t5            # Q_-1 = Q0

continue:
    addi    $t4, $t4, -1
    b       while



endwhile:
    move    $v0, $a0
    sll     $t2, $t2, 16
    add     $v0, $a0, $t2   # ans =  AQ

    jr		$ra				# jump to $ra