# This program takes a positive integer x as input and checks whether x is a perfect number

    .globl main
    .data

# program output text constants

prompt: 
    .asciiz "Enter a positive integer:"
warning:
    .asciiz "Entered number is not positive! Try again\n"
success: 
    .asciiz "Entered number is a perfect number"
failure:
    .asciiz "Entered number is not a perfect number."
newline:
    .asciiz "\n"

    .text

# main program
#
# program variables
#   x:      $s1 (input positive integer)  
#   sum:    $s2 (stores sum of divisors)
#   i:      $s3 (helps in iteration)  
#   rem:    $s4  (stores x%i) 
#   sq:     $s5 (used to find floor(sqrt(x))
#   a:      $s6 (stores sq*sq) 
#


main:


input:
    li $v0,4		# issue prompt to get a positive integer
    la $a0, prompt
    syscall		 


    li $v0,5		# get a positive integer from user
    syscall 
    move $s1,$v0    # x <-- $v0

    bgt $s1, $0, find_square_root  # if x>0 goto find_square_root  

wrong_input:
    li $v0,4		# issue warning on getting non-positive number
    la $a0, warning
    syscall	
    j input         # jump to input

find_square_root:
    li $s5, 1       # sq = $s5 stores floor(sqrt(n))
    mult $s5, $s5   # multiplies sq with sq 
    mflo $s6        # moves the value of special register lo to $s6, a <-- sq*sq

for1:               # for( sq=1; sq*sq<=x; ++sq)   
    bgt $s6, $s1, endfor1   # if a>x goto endfor1
    addi $s5, $s5, 1        # sq = sq + 1
    mult $s5, $s5           
    mflo $s6                # a = sq*sq
    b for1	                # continue loop


endfor1:
    subi $s5, $s5, 1        # sq = sq - 1


check_perfect:
    li $s2, 1       # sum = 1
    li $s3, 2       # i = 2

for2:
    bge $s3, $s5, endfor2   # if(i>sq) goto endfor2
    div $s1, $s3    # divide x by i and store remainder in hi

    mfhi $s4        # gets the remainder from special register hi, rem = hi
    bne $s4,$0 continue # if rem != 0 goto 'continue'

    add $s2, $s2, $s3   # sum = sum + i
    mflo $s7
    add $s2, $s2, $s7   # sum = sum + x/i

continue:
    addi $s3, $s3, 1    # i = i + 1
    b for2             # continue loop

endfor2:
    div $s1, $s5   # divide x by sq and store remainder in hi

    mfhi $s4        # gets the remainder from register hi
    bne $s4,$0 result # if remainder is not zero jump to 'result'

    add $s2, $s2, $s5   # sum = sum + sq
    mflo $s7            # $s7 <-- n/sq
    beq $s5, $s7, result    # if sq == sqrt(x) jump to 'result'
    add $s2, $s2, $s7   # else sum = sum + n/sq

result:
    beq $s2, $s1, perfect   # if(sum == x) goto 'perfect' 
not_perfect:
	li $v0,4		        # print "Entered number is not a perfect number."
    la $a0, failure        
    syscall
    j terminate             # jump to terminate
perfect:
	li $v0,4		        # print "Entered number is a perfect number."
    la $a0, success         
    syscall


terminate:
    
    li $v0,10               # terminate the program
    syscall




     
