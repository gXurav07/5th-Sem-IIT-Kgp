    .globl main
    .data
prompt1:
    .asciiz "Enter 10 integers one by one (in different lines):\n" 
result:
    .asciiz "Sorted array : "

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
# $s0:      the array 
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




    move    $a0, $s0
    li      $a1, 0
    li      $a2, 9
    jal     recursive_sort      # calling recursive_sort(array,0,9)

    
    la $a0, result
    li $v0, 4
    syscall             	

    move    $a0, $s0
    li      $a1, 10
    jal     print_array         # printing the sorted array
        
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























