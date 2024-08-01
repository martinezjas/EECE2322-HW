.data
prompt: .asciz "Enter a valid resistance value: "  # Prompt for user input
invalid_message: .asciz "Invalid resistance value. Try again.\n"  # Message for invalid input
answer: .asciz "The closest resistor value is "  # Message for the closest resistor value
answer2: .asciz " ohms.\n"  # Message for the unit of resistance
exit_message: .asciz "Goodbye.\n"  # Message for program exit
resistors: .word 10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82, 100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820, 1000, 1200, 1500, 1800, 2200, 2700, 3300, 3900, 4700, 5600, 6800, 8200, 10000, 12000, 15000, 18000, 22000, 27000, 33000, 39000, 47000, 56000, 68000, 82000, 100000  # Array of resistor values

.text
.globl main
# Function: main
# Description: Prompts the user for a resistance value and prints the closest resistor value less than or equal to the user's input.
#              Exits when the user enters 0. If the user enters a negative number or a number greater than 100000, an error message is printed.
main:
li a7, 4  # System call number for print string
la a0, prompt  # Load address of prompt string
ecall  # Execute system call
li a7, 5  # System call number for read integer
ecall  # Execute system call
li t1, 0  # Load 0 into t1
beq a0, t1, exit  # If a0 == 0, branch to exit
blt a0, t1, invalid  # If a0 < 0, branch to invalid
li t1, 100000  # Load 100000 into t1
bgt a0, t1, invalid  # If a0 > 100000, branch to invalid
mv s1, a0  # Move a0 to s1
li t0, 0  # Load 0 into t0
jal ra, loop  # Jump to loop function and save return address
li a7, 4  # System call number for print string
la a0, answer  # Load address of answer string
ecall  # Execute system call
mv a0, s2  # Move s2 to a0
li a7, 1  # System call number for print integer
ecall  # Execute system call
li a7, 4  # System call number for print string
la a0, answer2  # Load address of answer2 string
ecall  # Execute system call
j main  # Jump to main function


# Function: exit
# Description: Prints an exit message and terminates the program.
exit:
li a7, 4  # System call number for print string
la a0, exit_message  # Load address of exit_message string
ecall  # Execute system call
li a7, 10  # System call number for exit
ecall  # Execute system call

# Function: invalid
# Description: Prints an invalid input message and jumps back to the main function.
invalid:
li a7, 4  # System call number for print string
la a0, invalid_message  # Load address of invalid_message string
ecall  # Execute system call
j main  # Jump to main function

# Function: loop
# Description: Iterates over the resistors array and finds the closest resistor value less than or equal to the user's input.
loop:
la a1, resistors  # Load address of resistors array
slli t1, t0, 2  # Shift left t0 by 2 and store in t1
add t1, a1, t1  # Add a1 and t1 and store in t1
lw a2, 0(t1)  # Load word from memory address in t1
li t5, 100000 # Load 100000 into t5
beq s1, t5, max  # If s1 == 100000, branch to max
ble a2, s1, save_value  # If a2 <= s1, branch to save_value
jr ra # Jump to return address

max:
# Function: max
# Description: Prints the maximum resistor value and terminates the loop by returning.
mv s2, t5
jr ra

# Function: save_value
# Description: Saves the closest resistor value and increments the loop counter.
save_value:
mv s2, a2  # Move a2 to s2
li t6, 1  # Load 1 into t6
add t0, t0, t6  # Add t0 and t6 and store in t0
j loop  # Jump to loop function