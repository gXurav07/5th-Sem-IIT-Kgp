# Assignment 2
# Question 2
# Group 15
# Group Members:
# Gaurav Malakar - 20CS10029 
# Prakhar Singh - 20CS10045

.globl main
    .data
prompt1:
    .asciiz "Enter 10 integers one by one (in different lines):\n" 
prompt2:
    .asciiz "Enter the value of k: " 
prompt3:
    .asciiz "Sorted array for the given input is: "
prompt4:
    .asciiz "Kth largest element for the given input is: "
sanity1: 
    .asciiz "Invalid k! Enter k between 1 and 10\n"
whitespace:
    .asciiz " "
newline:
    .asciiz "\n"
array: 
    .align 2
    .space 40
    .text

main:
    la $a0, prompt1 
    li $v0, 4
    syscall             # printing the prompt to enter 10 integers

    la $s0, array       # $s0 = array
    li $t0, 0           # i = 0

    while:
        bge $t0, 40, endwhile	# if i == 40 then endwhile
        li $v0, 5
        syscall                 # taking in the array elements
        add $t1, $s0, $t0
        sw $v0, 0($t1)          # storing it inside the array
        addi $t0, $t0, 4        # moving to the next array index
    b while 
    
endwhile: 
    la $a0, prompt2             # prompt for taking input of k
    li $v0, 4
    syscall
    li $v0, 5
    syscall                     # get k
    # checking sanity of k
    ble $v0, 10, valid	        # if $v0 <= 10 then valid

    invalid: 
    la $a0, sanity1             # printing prompt for invalid k
    li $v0, 4
    syscall                     
    j endwhile                  # jump back to prompt for getting k due to invalid k

    valid: 
    ble	$v0, 0, invalid	        # if $v0 <= 0 then invalid

    move $s1, $v0               # moving k in $s1 => $s1 = k
    la $a0, array               # $a0 is loaded with address of array serving as the first and only argument of the funtion
    jal sort_array              # function call to sort array

print_array:                    # printing of the array after sorting
    li $t0, 0                   # i = 0
    while1:
        beq $t0, 40, endwhile1	# if i = 40 then endwhile1
        lw $a0, array($t0)      
        li $v0, 1
        syscall                 # print *(array + i)
        la $a0, whitespace      
        li $v0, 4
        syscall                 # print whitespace
        addi $t0, $t0, 4        # i += 4
        b while1                # jump to continue the loop

    endwhile1: 
        la $a0, newline      
        li $v0, 4
        syscall                 # printing "\n" for changing the line
    move $a0, $s0               # setting up the first argument of the function with address of array
    move $a1, $s1               # setting up the second argument of the function with value of k
    jal find_k_largest          # calling of find_k_largest fucntion with adress of array and k as arguments
    move $s3, $v0               # storing the return value of the function in $s3. $s3 now stores the Kth largest number
    la $a0, prompt4      
    li $v0, 4
    syscall                     # prompt for kth largest
    move $a0, $s3
    li $v0, 1
    syscall                     # print kth largest element
    la $a0, newline      
    li $v0, 4
    syscall                     # print newline

terminate:                      # to exit the program
    li $v0, 10
    syscall

# Function to find the k-th largest number in the array
# $a0, the first argument, is the address of the array
# $a1, the second argument, is the value of k
find_k_largest:
    li $t0, 10              # number of elements in the array, n
    sub $t0, $t0, $a1       # kth largest element will be the elemnent at index n - k from the start
    sll	$t0, $t0, 2			# $t0 = $t0 << 2, mumltiplying by 4 to account for the size of int
    add $t0, $t0, $a0       # $t0 now contains the address of array[n-k]
    lw $v0, ($t0)           # loading array[n-k] in $v0, the return variable
    jr $ra                  # fucntion call returned

# Function to sort the array in ascending order
# $a0, the first argument, is the address of the array
sort_array:
    move $t0, $a0               # t0 = &array[0]
    li $t1, 0                   # i = 0
    li $t3, 10                  # n = 10
    move $s3, $ra               # preserving the return address
    loop1:
        beq $t1, $t3, exit1     # if n == 10, exit
        li $t2, 0               # j = 0
        loop2: 
            sub $t4, $t3, $t1   # t4 = n - i
            addi $t4, $t4, -1   # t4 = n - i - 1
            beq $t2, $t4, exit2 # if j == n - i - 1, exit
            sll	$t5, $t2, 2		# $t5 = j * 4
            add $t5, $t5, $t0   # t5 = arr + 4*j = arr[j]
            lw $t7, ($t5)       # t7 = arr[j]
            move $a0, $t5       # setting up the first argument for the swap function
            addi $t5, $t5, 4      
            lw $t8, ($t5)       # t8 = arr[j+1]
            move $a1, $t5       # setting up the second argument for the swap function
            ble $t7, $t8, jump  # jumping to avoid swap
            jal swap            # if A[j] > A[j+1] then SWAP(A[j], A[j+1])
            jump:
            move $ra, $s3       # restoring $ra with return address of sort_array function 
            addi $t2, $t2, 1    # j++
        b loop2                 # loop jump for inner loop
        exit2:          
        addi $t1, $t1, 1        # i++
    b loop1                     # loop jump for outer loop
    exit1:
    jr $ra                      # return statement for sort_array function 

# Function to swap the elements present in the two memory address as arguments
# $a0, the first argument, is the address of the element1
# $a1, the second argument, is the address of the element2
swap:
    lw $s6, ($a0)
    lw $s7, ($a1)
    sw $s6, ($a1)
    sw $s7, ($a0)               # swapped the two elemets using s6 and s7
    jr $ra                      # return statement for swap function 