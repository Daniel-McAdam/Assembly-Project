#------------------------------
# Task C
#------------------------------

.data
	ThreePointThree: .float 3.33
#------------------------------
# This is the data segment used to hold relevant data to be called in the program
#------------------------------

	
.text
#------------------------------
# This is the main program code to be executed
#------------------------------

lwc1 $f2, ThreePointThree
lwc
li $v0, 6
syscall

div.s $f12, $f0 , $f2
div.s
li $v0, 2
syscall

#------------------------------
# Ensures controlled termination of code (no dropped bottom)
#------------------------------	

#
# code 10 (terminate execution) loaded into system call register
#

	li $v0,10
	syscall	
