    .globl main
    .data

    .text
 
main:

    li      $a0, 76   # Q
    li      $a1, 67  # M

    jal		multiply_booth	# jump to multiply_booth and save position to $ra

    move    $a0, $v0        # move the return value fro, $vo to $a0 for printing       
    li      $v0, 1
    syscall

terminate:
    li      $v0, 10         # terminate the program
    syscall
    

multiply_booth:  
    li      $t2, 0   # A
    li      $t3, 0   # Q_-1
    li      $t4, 16  # count
    sub     $t7, $0, $a1   # -M
    li      $t6, 65535   # 65535 = 2^16 - 1, used to unset all higher than 16 bits


    and     $t7, $t7, $t6  
    and     $a0, $a0, $t6
    and     $a1, $a1, $t6 
while:
    ble     $t4, 0, endwhile

    li      $t5, 1   # Q0
    and     $t5, $t5, $a0

    beq     $t5, $0, c0_
c1_:
    beq     $t3, $0, c10
c11:
    j       arithmetic_shift_right
c10:
    add     $t2, $t2, $t7		# A = A - M
    and     $t2, $t2, $t6
    j       arithmetic_shift_right


c0_:
    beq     $t3, $0, c00
c01:
    add     $t2, $t2, $a1		# A = A + M
    and     $t2, $t2, $t6
    j       arithmetic_shift_right
c00:
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
    move    $t3, $t5           # Q_-1 = Q0

continue:
    addi    $t4, $t4, -1
    b       while



endwhile:
    move    $v0, $a0
    sll     $t2, $t2, 16
    add     $v0, $a0, $t2   # ans =  AQ

    jr		$ra					# jump to $ra
    



