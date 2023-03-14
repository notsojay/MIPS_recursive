.include "recursive.asm"

.data

new_line: .asciiz "\n"
space: .asciiz " "
pi_str: .asciiz "Program input:\n" 
po_str: .asciiz "Obtained output:\n" 
eo_str: .asciiz "Expected output:\n"
tf_str: .asciiz "Testing fib_recur:\n"
tc_str: .asciiz "Testing catalan_recur:\n"

num_numeric_tests:	.word 8
numerical_inputs:	.word 0, 1, 2, 3, 6, 9, 10, 13

fib_expected_outputs: .word 0, 1, 1, 2, 8, 34, 55, 233
cat_expected_outputs: .word 1, 1, 2, 5, 132, 4862, 16796, 742900

###############################################################
#                           Text Section
.text
.globl main

# Utility function to print integer arrays
# a0: array
# a1: length
print_array:

li $t1, 0
move $t2, $a0
print_iter:

lw $a0, ($t2)
li $v0, 1   
syscall

li $v0, 4
la $a0, space
syscall

addi $t2, $t2, 4
addi $t1, $t1, 1
blt $t1, $a1, print_iter

la $a0, new_line
syscall

li $v0, -1
jr $ra
###############################################################
#                          Main Function
main:
###############################################################
# Test fib_recur function
li $v0, 4
la $a0, tf_str
syscall
la $a0, pi_str
syscall

li $s0, 0 # index current test input
la $s1, num_numeric_tests
lw $s1, 0($s1)  # number of tests
la $s2, numerical_inputs  # test inputs
move $a0, $s2
move $a1, $s1
jal print_array

li $v0, 4
la $a0, eo_str
syscall
la $a0, fib_expected_outputs
move $a1, $s1
jal print_array

li $v0, 4
la $a0, po_str
syscall
test_fib_recur:
bge $s0, $s1, end_test_fib_recur
# call the function
lw $a0, 0($s2)
jal fib_recur
# print results
move $a0, $v0
li $v0, 1   
syscall

li $v0, 4
la $a0, space
syscall

addi $s0, $s0, 1
addi $s2, $s2, 4
j test_fib_recur


end_test_fib_recur:
la $a0, new_line
syscall
syscall

###############################################################
# Test catalan_recur function
li $v0, 4
la $a0, tc_str
syscall
la $a0, pi_str
syscall

li $s0, 0 # index current test input
la $s1, num_numeric_tests
lw $s1, 0($s1)  # number of tests
addi $s1, $s1, -2  # exclude catalan_recur(10, 13), slow for some hw
la $s2, numerical_inputs  # test inputs
move $a0, $s2
move $a1, $s1
jal print_array

li $v0, 4
la $a0, eo_str
syscall
la $a0, cat_expected_outputs
move $a1, $s1
jal print_array

li $v0, 4
la $a0, po_str
syscall
test_cat_recur:
bge $s0, $s1, end_test_cat_recur
# call the function
lw $a0, 0($s2)
jal catalan_recur
# print results
move $a0, $v0
li $v0, 1   
syscall

li $v0, 4
la $a0, space
syscall

addi $s0, $s0, 1
addi $s2, $s2, 4
j test_cat_recur


end_test_cat_recur:
la $a0, new_line
syscall
syscall


###############################################################