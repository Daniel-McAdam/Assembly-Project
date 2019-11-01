#------------------------------
# Task D
#------------------------------

.data
	Message: .asciiz "Total sum of this throw is: "
#------------------------------
# This is the data segment used to hold relevant data to be called in the program
#------------------------------

	
.text
#------------------------------
# This is the main program code to be executed
#------------------------------

#------------------------------
# Main Roll Dice loop 
#------------------------------

#
# Branch if equal to 8 used to ensure loop runs set number of dice rolls 
# code 42 random int with ranged added into $v0 register with range of 0-5
# 1 added to result of random number to shift range to 1-6
# result of random number +1 added to s0 for total sum of throws
# +1 added to counter for loop
#

rollDice:
beq $t0 , 8 , printSum
li $v0, 42
li $a1, 5
syscall
addi $t3, $a0, 1
add $s0, $s0, $t3
addi $t0, $t0, 1
j rollDice

#------------------------------
#Printing Sum (output of total dice throws) after loop completed
#------------------------------

#
# Message printed using code 4 (string) along with final value of dice rolls 
#

printSum:
li $v0, 4
la $a0, Message
syscall

li $v0, 1
la $a0, ($s0)
syscall

#------------------------------
# Ensures controlled termination of code (no dropped bottom)
#------------------------------	

#
# code 10 (terminate execution) loaded into system call register
#

li $v0,10
syscall	