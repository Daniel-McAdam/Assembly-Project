#------------------------------
# Task A
#------------------------------

.data
#------------------------------
# This is the data segment used to hold relevant data to be called in the program
#------------------------------

#
# 2 labels hold the output text for the name and reg number to be called later on
# nameInput reserves 40 bytes of space for the user's name to be stored
#	
	
	nameMessage: .asciiz "Name: "
	numberMessage: .asciiz "Student Registration Number: "
	nameInput: .space 40
	
.text
#------------------------------
# This is the main program code to be executed
#------------------------------

#
# User name input collected by using code 8 (read string) in system call register
# Result is stored in nameInput data item
# a1 holds the max length of the permitted string (40bytes)
#
	
	li $v0, 8
	la $a0, nameInput
	li $a1, 40
	syscall

#
# User registration number collected via code 5 (read integer)
# Integer value moved from v0 to t0 for later use
#
		
	li $v0, 5
	syscall
	move $t0,$v0
	
#
# nameMessage string loaded into a0 then printed via use of code 4(print string)
#
	
	li $v0,4
	la $a0,nameMessage
	syscall

#
# Code 4 used again to print the previously entered username input stored into nameInput
#
	
	li $v0,4 
	la $a0,nameInput
	syscall
	
#
# Code 4 prints message stored in numberMessage
#
	li $v0,4
	la $a0,numberMessage
	syscall
	
#
# Code 1 (print int) prints the value stored in t0 (user reg number)
#
	li $v0,1
	move $a0, $t0
	syscall
	
#------------------------------
# Ensures controlled termination of code (no dropped bottom)
#------------------------------	

#
# code 10 (terminate execution) loaded into system call register
#

	li $v0,10
	syscall	
