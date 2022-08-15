    .globl main
    .data

array:      .space  40 

main:
    la      $t0, array

    li      $t1, 6
    sw      $t1, ($t0)

    li      $t1, 9
    sw      $t1, 4($t0)

    lw      $t2, ($t0)
    li      $v0, 1
    move    $a0, $t2
    syscall