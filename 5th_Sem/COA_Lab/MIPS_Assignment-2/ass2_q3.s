# Assignment 2
# Question 3
# Group 15
# Group Members:
# Gaurav Malakar - 20CS10029 
# Prakhar Singh - 20CS10045
        .globl main
        .data
prompt:
        .asciiz "Enter four positive integers m, n, a and r: "

newline:
        .asciiz "\n"
space:
        .asciiz " "
        .text

# main program
#
# program variables
#   m:   $s0
#   n:   $s1
#   a:   $s2
#   r:   $s3
#   A:   $s4
#   B:   $s5
#
main:
input:
        li      $v0, 4          # issue prompt
        la      $a0, prompt
        syscall

        li      $v0, 5          # get m from user
        syscall
        move    $s0, $v0

        li      $v0, 5          # get n from user
        syscall
        move    $s1, $v0

        li      $v0, 5          # get a from user
        syscall
        move    $s2, $v0

        li      $v0, 5          # get r from user
        syscall
        move    $s3, $v0

initialize:
        jal     initStack

allocate_A:
        mul     $a0, $s0, $s1   # $a0 = m*n
        jal     mallocInStack 
        move    $s4, $v0        # $s4 = A

allocate_B:
        mul     $a0, $s1, $s0   # $a0 = n*m
        jal     mallocInStack 
        move    $s5, $v0        # $s5 = B

populate_A:
        move    $t7, $s2        # $t7 = $s2
        li      $t3, 0          # i=0

        
for:    # for(i=0; i<m; i++)
        bge     $t3, $s0, endfor 
        mul     $t5, $t3, $s1   # t5 = i*n
        li      $t4, 0          # j=0
for2:   # for(j=0; j<n; j++)
        bge     $t4, $s1, endfor2
        add     $t6, $t5, $t4   # t6 = i*n + j
        mul     $t6, $t6, 4     # t6 = 4*(i*n + j)
        add     $t6, $s4, $t6   # t6 = A + 4*(i*n + j)

        sw      $t7, ($t6)      # A[i][j] = $t7 ( currently $t7 has value a.r^(i*n+j) ) 
        mul     $t7,  $t7, $s3  # $t7 = $t7 * r

        addi    $t4, $t4, 1     # j = j + 1
        b       for2            # continue loop

endfor2:
        addi    $t3, $t3, 1     # i = i + 1
        b       for             # continue loop
endfor:

print_A:
        move    $a0, $s0        # $a0 = m
        move    $a1, $s1        # $a1 = n
        move    $a2, $s4        # $a2 = A
        jal     printMatrix

get_transpose:
        move    $a0, $s0        # $a0 = m
        move    $a1, $s1        # $a1 = n
        move    $a2, $s4        # $a2 = A
        move    $a3, $s5        # $a2 = B
        jal     transposeMatrix

print_B:
        move    $a0, $s1        # $a0 = n
        move    $a1, $s0        # $a1 = m
        move    $a2, $s5        # $a2 = B
        jal     printMatrix



exit:
        li      $v0, 10         # terminate the program
        syscall







initStack:
        move    $fp, $sp
        jr	$ra	

pushToStack:
        sw      $a0, ($sp)
        sub     $sp, $sp, 4
        jr      $ra	
mallocInStack:
        mul     $t0, $a0, 4
        sub     $sp, $sp, $t0
        move    $v0, $sp        
        jr      $ra


printMatrix:
        move    $t0, $a0        # $t0 = m
        # $a0 is used for printing so we store its value in some other place

        li      $t3, 0          # i=0

for3:    # for(i=0; i<m; i++)
        bge     $t3, $t0, endfor3 
        mul     $t5, $t3, $a1   # $t5 = i*n
        li      $t4, 0          # j=0
for4:   # for(j=0; j<n; j++)
        bge     $t4, $a1, endfor4
        add     $t6, $t5, $t4   # $t6 = i*n + j
        mul     $t6, $t6, 4     # $t6 = 4*(i*n + j)
        add     $t6, $a2, $t6   # $t6 = Matrix + 4*(i*n + j)

        lw      $a0, ($t6)      # $a0 = Matrix[i][j] 
        li      $v0, 1          # print Matrix[i][j]
        syscall
        li      $v0, 4          
        la      $a0, space      # print space
        syscall


        addi    $t4, $t4, 1     # j = j + 1
        b       for4            # continue loop

endfor4:
        li      $v0, 4
        la      $a0, newline    # print newline
        syscall

        addi    $t3, $t3, 1     # i = i + 1
        b       for3            # continue loop
endfor3:
        li      $v0, 4
        la      $a0, newline    # print newline
        syscall
        
        jr	$ra	



transposeMatrix:
        li      $t3, 0          # i=0

for5:    # for(i=0; i<m; i++)
        bge     $t3, $a0, endfor5 
        li      $t4, 0          # j=0
for6:   # for(j=0; j<n; j++)
        bge     $t4, $a1, endfor6

        mul     $t5, $t3, $a1   # $t5 = i*n
        add     $t6, $t5, $t4   # $t6 = i*n + j
        mul     $t6, $t6, 4     # $t6 = 4*(i*n + j)
        add     $t6, $a2, $t6   # $t6 = A + 4*(i*n + j)

        lw      $t0, ($t6)      # $t0 =  A[i][j]

        mul     $t5, $t4, $a0   # $t5 = j*m
        add     $t6, $t5, $t3   # $t6 = j*m + i
        mul     $t6, $t6, 4     # $t6 = 4*(j*m + i)
        add     $t6, $a3, $t6   # $t6 = B + 4*(j*m + i)

        sw      $t0, ($t6)      # B[j][i] = $t0 = A[i][j]

        


        addi    $t4, $t4, 1     # j = j + 1
        b       for6            # continue loop     

endfor6:
        addi    $t3, $t3, 1     # i = i + 1
        b       for5            # continue loop
endfor5:
        jr	$ra
        
        



        

         
