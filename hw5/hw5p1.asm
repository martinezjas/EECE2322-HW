.data
queens: .word 0, 4, 7, 5, 2, 6, 1, 3
prompt: .asciz "Enter the cell number (0 to 63): "
location: .asciz "Queen Located on cell "
by: .asciz " by "

.text
.globl main

main:
li a7, 4
la a0, prompt
ecall
li a7, 5
ecall
mv s0, a0
jal ra, printCell
li a7, 10
ecall

printCell:
li t0, 8
rem s1, s0, t0
mv a0, s1
addi sp, sp, -4
sw ra, 0(sp)
jal ra, getRow
lw ra, 0(sp)
addi sp, sp, 4
mv s2, a0
li a7, 4
la a0, location
ecall
mv a0, s1
li a7, 1
ecall
la a0, by
li a7, 4
ecall
mv a0, s2
li a7, 1
ecall
jr ra

getRow:
slli t0, a0, 2
la t1, queens
add a0, t0, t1
lw a0, 0(a0)
jr ra



