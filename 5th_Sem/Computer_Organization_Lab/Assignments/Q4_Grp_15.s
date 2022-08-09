    .globl main
    .data
prompt: 
    .asciiz "Enter a positive integer:"
warning:
    .asciiz "Entered number is negative! Try again\n"
success: 
    .asciiz "Entered number is a perfect number.\n"
failure:
    .asciiz "Entered number is not a perfect number.\n"

    .text
main:
    li $s0, 0       # constant integer 0

input:
    li $v0,4		# issue prompt to get a positive integer
    la $a0, prompt
    syscall		 


    li $v0,5		# get a positive integer from user
    syscall 
    move $s1,$v0

    bge $s1, $s0, algorithm

    li $v0,4		# issue warning on getting non-positive number
    la $a0, warning
    syscall	
    j input

algorithm:

    li $s5, 1       # $s5 stores floor(sqrt(n))
    mult $s5, $s5
    mflo $s6

while1:    
    bgt $s6, $s1, endwhile1
    addi $s5, $s5, 1
    mult $s5, $s5
    mflo $s6
    b while1	# continue loop

endwhile1:
    subi $s5, $s5, 1


    li $s2, 1       # sum of divisors = 1
    li $s3, 2       # i = 1
    
while2:
    bge $s3, $s5, endwhile2
    div $s1, $s3    # divide n by i and store remainder in hi

    mfhi $s4        # gets the remainder from register hi
    bne $s4,$s0 continue # if remainder is not zero jump to the address 'continue'

    add $s2, $s2, $s3   # sum = sum + i
    mflo $s7
    add $s2, $s2, $s7   # sum = sum + n/i

continue:
    addi $s3, $s3, 1    # i = i + 1
    b while2             # continue loop

endwhile2:
    div $s1, $s5   # divide n by floor(sqrt(n)) and store remainder in hi

    mfhi $s4        # gets the remainder from register hi
    bne $s4,$s0 result # if remainder is not zero jump to the address 'result'

    add $s2, $s2, $s5   # sum = sum + floor(sqrt(n))
    mflo $s7
    beq $s5, $s7, result    # if floor(sqrt(n)) == sqrt(n) jump to result
    add $s2, $s2, $s7   # else sum = sum + n/floor(sqrt(n))

result:
    beq $s2, $s1, perfect
not_perfect:
	li $v0,4		        # print "Entered number is not a perfect number."
    la $a0, failure
    syscall
    j terminate
perfect:
	li $v0,4		        # print "Entered number is a perfect number."
    la $a0, success
    syscall


terminate:
    
    li $v0,10               # terminate the program
    syscall




     
