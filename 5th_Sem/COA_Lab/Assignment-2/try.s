# This program computes and displays the sum of integers from 1 up to n,
# where n is entered by the user.


    .globl  main

    .data

# program output text constants
prompt:
    .asciiz "Please enter a positive integer: "
result1:
    .asciiz "The sum of the first "
result2:
    .asciiz  " integers is "
newline:
    .asciiz "\n"

    .text

# main program
#
# program variables
#   n:   $s0
#   sum: $s1
#   i:   $s2
#
main:



    la      $s2, result2
    la      $s3, newline
    sub     $s1, $s3, $s2
    li      $v0, 1          # print sum
    move    $a0, $s1
    syscall

    li      $v0, 4          # print two newlines
    la      $a0, newline
    syscall
    li      $v0, 4
    la      $a0, newline
    syscall

    li      $v0, 10         # terminate the program
    syscall
