# MIPS Assignment-3
# Question 3
# Group 15
# Group Members:
# Gaurav Malakar - 20CS10029 
# Prakhar Singh - 20CS10045

    .globl main
    .data
prompt1:
    .asciiz "Enter 10 integers one by one (in different lines):\n" 
prompt2:
    .asciiz "Enter the integer to be searched in the array: " 
result:
    .asciiz "Sorted array : "
found:
    .asciiz " is FOUND in the array at index "
not_found:
    .asciiz " NOT FOUND in the array "
newline:
    .asciiz "\n"
space:
    .asciiz " "

array: 
    .align 2
    .space 40
    
    .text

#
# program variables
# $s0:      array 
# $s1:      key (integer to be searched in the array)
#
main:
    la $a0, prompt1 
    li $v0, 4
    syscall             	# printing the prompt to get 10 integers

    la $s0, array       	# $s0 = array
    li $t0, 0           	# i = 0

    while:
        bge $t0, 40, endwhile	# if i >= 40 then endwhile
        li $v0, 5
        syscall                 # taking in the array elements
        add $t1, $s0, $t0
        sw $v0, 0($t1)          # storing it inside the array
        addi $t0, $t0, 4        # moving to the next array index
    b while 
   endwhile:

    la $a0, prompt2 
    li $v0, 4
    syscall             	    # printing the prompt to get the key

    li      $v0, 5
    syscall                     # taking in the key
    move    $s1, $v0            # s1 <-- key)


    move    $a0, $s0
    li      $a1, 0
    li      $a2, 9
    jal     recursive_sort  # call recursive_sort on the array

    la $a0, result
    li $v0, 4
    syscall  

    move    $a0, $s0
    li      $a1, 10
    jal     print_array     # print the sorted array


    move    $a0, $s0        # a0 <-- array
    li      $a1, 0
    li      $a2, 9
    move    $a3, $s1        # a3 <-- key

    jal     recursive_search

    blt     $v0, $zero, key_not_found

key_found:
    move    $s2, $v0        # s2 <-- index of key

    move    $a0, $s1
    li      $v0, 1
    syscall                 # print the key

    la $a0, found
    li $v0, 4
    syscall

    move    $a0, $s2    
    li      $v0, 1
    syscall                 # print index of key ( 0-based indexing used here ) 

    j   finish


key_not_found:
    move    $a0, $s1
    li      $v0, 1
    syscall                 # print the key

    la $a0, not_found
    li $v0, 4
    syscall


finish:
    li      $v0, 4          # print newline
    la      $a0, newline
    syscall
        
    li      $v0, 10         # terminate the program
    syscall


recursive_sort:
    # have to store fp, right, r and ra in stack before recursive call
    # a0 = A, a1 = left, a2 = right 
    # t0 = l, t1 = r
    
    addi    $sp, $sp, -16
    sw      $fp, 12($sp)    # store fp
    sw      $a2, 8($sp)     # store right
    sw      $ra, 4($sp)     # store ra in stack
    addi    $fp, $sp, 16    # fp = sp + 16 , current frame pointer position assigned to fp

    move    $t0, $a1        # l <-- left
    move    $t1, $a2        # r <-- right

    mul     $t7, $a1, 4     # t7 = 4*p, (Here, a1=left=p)
    add     $t2, $a0, $t7   # t2 = A + 4*p
    lw      $t2, ($t2)      # t2 = A[p]

while1:
    bge     $t0, $t1, endwhile1     # if l>=r jump to endwhile1 
    while2: 
        mul     $t7, $t0, 4         # t7 = 4*l
        add     $t3, $a0, $t7       # t3 = A + 4*l
        lw      $t3, 0($t3)         # t3 = A[l]

        bgt     $t3, $t2, endwhile2     # if A[l]>A[p] goto endwhile2
        bge     $t0, $a2, endwhile2     # if l>=right goto endwhile2
        addi    $t0, $t0, 1             # l++
        b       while2
    endwhile2:

    while3: 
        mul     $t7, $t1, 4             # t7 = 4*r
        add     $t3, $a0, $t7           # t3 = A + 4*r
        lw      $t3, 0($t3)             # t3 = A[r]

        blt     $t3, $t2, endwhile3     # if A[r]<A[p] break
        ble     $t1, $a1, endwhile3     # if r<=left break
        addi    $t1, $t1, -1            # r--
        b       while3
    endwhile3:

    blt     $t0, $t1, continue          # if l<r goto continue

return:
        mul     $t7, $a1, 4             # t7 = 4*p
        add     $t3, $a0, $t7           # t3 = A + 4*p
        lw      $t5, 0($t3)             # t5 = A[p]

        mul     $t7, $t1, 4             # t7 = 4*r
        add     $t4, $a0, $t7           # t4 = A + 4*r
        lw      $t6, 0($t4)             # t6 = A[r]

        sw      $t5, ($t4)              # A[r] = A[p] 
        sw      $t6, 0($t3)             # A[p] = t6, (t6 stores previous value of A[r]  

        sw      $t1, 0($sp)             # store r in stack

        
        addi    $a2, $a2, -1            # a2 = r-1
        jal     recursive_sort          # call recirsive_sort(A, left, r-1)

        lw      $a1, 0($sp)             # a1 <-- r
        addi    $a1, $a1, 1     # a1 <-- r + 1
        lw      $a2, 8($sp)     # a2 <-- right
        jal     recursive_sort  # call recursive_sort(A, r+1, right)

        lw      $ra, 4($sp)     # restore ra from the stack
        lw      $fp, 12($sp)    # restore fp from the stack
        addi    $sp, $sp, 16         # deallocate stack space

        jr		$ra					# jump to $ra
    
continue:
        mul     $t7, $t0, 4     # t7 = 4*l
        add     $t3, $a0, $t7   # t3 = A + 4*l
        lw      $t5, 0($t3)      # t5 = A[l]

        mul     $t7, $t1, 4     # t7 = 4*r
        add     $t4, $a0, $t7   # t4 = A + 4*r
        lw      $t6, 0($t4)      # t6 = A[r]

        sw      $t5, ($t4)      # A[r] = A[l] 
        sw      $t6, 0($t3)     # A[l] = t6, (t6 stores previous value of A[r]  
        b       while1
endwhile1:
	    jr		$ra					# jump to $ra


print_array:
    # a0 = array to be printed, a1 = size of that array
    move  $t0, $a0              # t0 = array to be printed
    li  $t1, 0                # i =0
while4:                     # while(i<size)
    bge $t1, $a1, endwhile4

    li $v0,1                
    lw $a0,0($t0)
    syscall                 # print array[i]

    li      $v0, 4          # print space
    la      $a0, space
    syscall

    addi    $t0, $t0, 4
    addi    $t1, $t1, 1
    b while4
endwhile4:
    li      $v0, 4          # print newline
    la      $a0, newline
    syscall
    jr      $ra             # return



recursive_search:   # a0: A, a1: start, a2: end, a3: key
    # For this function we only need to store frame pointer fp and  register ra  in stack

    addi    $sp, $sp, -4
    sw      $fp, 0($sp)     # store fp in the stack
    addi    $fp, $sp, 4     # current frame pointer position assigned to fp

    # Here, t1: mid1, t2: mid2
    while5:
        bgt     $a1, $a2, endwhile5     # if start>end goto endwhile5
        sub	$t0, $a2, $a1		    # t0 <-- end - start
        li      $t3, 3
        div	$t0, $t3			    # computes (end-start)/3
        mflo	$t0					    # $t0 <---  (end-start)/3
        
        add     $t1, $a1, $t0           # mid1 <-- start + (end-start)/3
        sub     $t2, $a2, $t0           # mid2 <-- end - (end-start)/3

        mul     $t3, $t1, 4
        add     $t4, $a0, $t3           # t4 = A + mid1
        lw      $t5, 0($t4)             # t5 = A[mid1]
        beq     $t5, $a3, key_at_mid1   # if A[mid1] == key goto key_at_mid1

        mul     $t3, $t2, 4
        add     $t4, $a0, $t3           # t4 = A + mid2
        lw      $t5, 0($t4)             # t5 = A[mid2]
        beq     $t5, $a3, key_at_mid2   # if A[mid2] == key goto key_at_mid2
        
       

        mul     $t3, $t1, 4
        add     $t4, $a0, $t3           # t4 = A + mid1
        lw      $t5, 0($t4)             # t5 = A[mid1]
        blt     $a3, $t5, recurse_left  # if key < A[mid1]  goto recurse_left

        mul     $t3, $t2, 4
        add     $t4, $a0, $t3           # t4 = A + mid2
        lw      $t5, 0($t4)             # t5 = A[mid2]
        bgt     $a3, $t5, recurse_right # if key > A[mid2]  goto recurse_right

        b       recurse_mid             # else goto recurse mid
        
        


        recurse_left:
            addi    $sp, $sp, -4            # allocate space for storing ra
            sw      $ra, 0($sp)             # store ra in stack
            addi    $a2, $t1, -1         # a2 = mid1 - 1
            jal     recursive_search    # argument values:- a0: A, a1: start, a2: mid1-1, a3: key
            j       leave

        recurse_right:
            addi    $sp, $sp, -4            # allocate space for storing ra
            sw      $ra, 0($sp)             # store ra in stack
            addi    $a1, $t2, 1         # a1 = mid2 + 1
            jal     recursive_search   # argument values:- a0: A, a1: mid2+1, a2: end, a3: key
            j       leave

        recurse_mid:
            addi    $sp, $sp, -4            # allocate space for storing ra
            sw      $ra, 0($sp)             # store ra in stack
            addi    $a1, $t1, 1         # a1 = mid1 + 1
            addi    $a2, $t2, -1        # a2 = mid2 - 1
            jal     recursive_search    # argument values:- a0: A, a1: mid1+1, a2: mid2-1, a3: key  
            j       leave


        leave:
            lw  $ra, 0($sp)
            lw  $fp, 4($sp)
            addi    $sp, $sp, 8
            jr 	    $ra


        key_at_mid1:
            move    $v0, $t1        # return mid1
            lw      $fp, 0($sp)
            addi    $sp, $sp, 4
            jr      $ra

        key_at_mid2:
            move    $v0, $t2        # return mid2
            lw      $fp, 0($sp)
            addi    $sp, $sp, 4
            jr      $ra

    endwhile5:
        li      $v0, -1             # return -1
        lw      $fp, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra




















