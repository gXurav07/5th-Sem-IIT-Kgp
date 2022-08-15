# we generally use the $a registers to as function arguments
# $v registers are generally used for returning values

    .globl main

    .text

main:
    li  $a1, -90
    li  $a2, 9

    jal		addInt				# jump to addInt and save position to $ra
    
    li		$v0, 1		# $v0=1 
    move 	$a0, $v1		# $a0 = vt1
    syscall

    li		$v0, 10		# $v0 =10 
    syscall


    

addInt:
    add		$v1, $a1, $a2
    jr		$ra					# jump to $ra
    		
    
