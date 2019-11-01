#------------------------------
# Task B
#------------------------------

.data

#------------------------------
# This is the data segment used to hold relevant data to be called in the program
#------------------------------

.text

#------------------------------
# This is the main program code to be executed
#------------------------------

#
# last 2 digits of the student registration number collected with code 5 (read integer)
# integer moved from v0 to t0 before v0 is overwritten
#

	li $v0,5
	syscall
	move $t0,$v0

#
# value of 2 added into $t1 (added with zero constant to produce 2)
# div command divides value t0 by t1 and stores in s0
#

	addi $t1, $zero , 2 #stores 2 for division
	div $s0, $t0, $t1

#
# Code 1 (print integer) prints s0 value added to $a0 value (result of division)
#

	li $v0,1
	add $a0,$zero,$s0
	syscall

#------------------------------
# Ensures controlled termination of code (no dropped bottom)
#------------------------------	

#
# code 10 (terminate execution) loaded into system call register
#

	li $v0,10
	syscall	