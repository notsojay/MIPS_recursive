.text

fib_recur:
# $a0: input number
###############################################################
# Prologue
subi $sp, $sp, 12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0

ble $a0, 0x1, fib_when_n_ble_1 # if(n <= 1) return n

addi $a0, $s0, -1 # n = n-1
jal fib_recur # j f(n-1)
move $s1, $v0 # s1 = f(n-1)

addi $a0, $s0, -2 # n = n-2
jal fib_recur # j f(n-2)
add $v0, $s1, $v0 # f(n-1) + f(n-2)
j fib_end # go back to caller

fib_when_n_ble_1:
addi $v0, $a0, 0

# Epilogue
fib_end:
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
###############################################################
catalan_recur:
# $a0: input number
###############################################################
# Prologue:
subi $sp, $sp, 20
sw $ra, 16($sp)
sw $s0, 12($sp)
sw $s1, 8($sp)
sw $s2, 4($sp)
sw $s3, 0($sp)
move $s0, $a0
li $v0, 0
li $s3, 0 # index i in loop
li $s2, 0 # result

ble $a0, 0x1, catalan_when_n_ble_1 # base case: if(n <= 1) return 1;

# loop begin: for(int i = 0; i < n; ++i)
catalan_loop:
bge $s3, $s0, catalan_loop_end
move $a0, $s3 # let i = n
jal catalan_recur # go catalanRecur(i)
move $s1, $v0 # save catalanRecur(i)
sub $a0, $s0, $s3 # n-i
subi $a0, $a0, 0x1 # n-1
jal catalan_recur # go catalanRecur(n-i-1);
mul $v0, $s1, $v0  # catalanRecur(i) * catalanRecur(n-i-1);
add $s2, $s2, $v0 # let s2 save the final result
addi $s3, $s3, 0x1 # ++i;
j catalan_loop

catalan_loop_end:
move $v0, $s2 # return the final result to caller
j catalan_end

catalan_when_n_ble_1:
li $v0, 1
#addi $v0, $zero, 1 # return 1

# Epilogue: 
catalan_end:
lw $ra, 16($sp)
lw $s0, 12($sp)
lw $s1, 8($sp)
lw $s2, 4($sp)
lw $s3, 0($sp)
addi $sp, $sp, 20
jr $ra
###############################################################