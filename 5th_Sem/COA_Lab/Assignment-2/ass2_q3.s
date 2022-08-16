
        .globl main
        .data
newline:
    .asciiz "\n"
space:
    .asciiz " "
        .text
main:
input:
        li      $s0, 4  # m
        li      $s1, 7  # n
        li      $s2, 3  # $a
        li      $s3, 2  # r

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
        li      $t3, 0          # i=0

        
for:    # for(i=0; i<n; i++)
        bge     $t3, $s1, endfor 
        mul     $t5, $t3, $s0   # t5 = i*m
        li      $t4, 0          # j=0
for2:   # for(j=0; j<m; j++)
        bge     $t4, $s0, endfor2
        add     $t6, $t5, $t4   # t6 = i*m + j
        mul     $t6, $t6, 4     # t6 = 4*(i*m + j)
        sub     $t6, $s4, $t6   # t6 = A - 4*(i*m + j)

        sw      $s2, ($t6)      # A[i][j] = $s2
        mul     $s2,  $s2, $s3  # $s2 = $s2 * r

        addi    $t4, $t4, 1
        b       for2      

endfor2:
        addi    $t3, $t3, 1
        b       for
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
        addi    $v0, 4          # address $sp is not a part of 4*$a0 sized 
        jr      $ra


printMatrix:
        move    $t0, $a0        # $t0 = m
        # $a0 is used for printing so we store its value in some other place

        li      $t3, 0          # i=0

for3:    # for(i=0; i<n; i++)
        bge     $t3, $a1, endfor3 
        mul     $t5, $t3, $t0   # $t5 = i*m
        li      $t4, 0          # j=0
for4:   # for(j=0; j<m; j++)
        bge     $t4, $t0, endfor4
        add     $t6, $t5, $t4   # $t6 = i*m + j
        mul     $t6, $t6, 4    # $t6 = 4*(i*m + j)
        sub     $t6, $a2, $t6   # $t6 = Matrix - 4*(i*m + j)

        lw      $a0, ($t6)      # $a0 = Matrix[i][j] 
        li      $v0, 1
        syscall
        li      $v0, 4
        la      $a0, space
        syscall


        addi    $t4, $t4, 1
        b       for4      

endfor4:
        li      $v0, 4
        la      $a0, newline
        syscall

        addi    $t3, $t3, 1
        b       for3
endfor3:
        li      $v0, 4
        la      $a0, newline
        syscall
        
        jr	$ra	



transposeMatrix:
        li      $t3, 0          # i=0

for5:    # for(i=0; i<n; i++)
        bge     $t3, $a1, endfor5 
        li      $t4, 0          # j=0
for6:   # for(j=0; j<m; j++)
        bge     $t4, $a0, endfor6

        mul     $t5, $t3, $a0   # $t5 = i*m
        add     $t6, $t5, $t4   # $t6 = i*m + j
        mul     $t6, $t6, 4    # $t6 = 4*(i*m + j)
        sub     $t6, $a2, $t6   # $t6 = A - 4*(i*m + j)

        lw      $t0, ($t6)      # $t0 =  A[i][j]

        mul     $t5, $t4, $a1   # $t5 = j*n
        add     $t6, $t5, $t3   # $t6 = j*n + i
        mul     $t6, $t6, 4    # $t6 = 4*(j*n + i)
        sub     $t6, $a3, $t6   # $t6 = B - 4*(j*n + i)

        sw      $t0, ($t6)      # B[j][i] = $t0 = A[i][j]

        


        addi    $t4, $t4, 1     # j += 1
        b       for6      

endfor6:
        addi    $t3, $t3, 1     # i += 1
        b       for5
endfor5:
        jr	$ra
        
        



        

         
