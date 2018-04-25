#Name: Don Dang
#File: Arithmetic.s
#Date: 4/25/18
# ARITHMETIC
# Write a complete RISC - V assembly program that calculates the equation shown below (in C)
# A-F can be stored in temporary registers. However, the final result Z must be an integer word
#     stored in memory when your program finishes executing.

	.data		# Data declaration section
	Z: .word 0      # Declare a label called Z with word datatype 

	.text

main:			# Start of code section
	
	li t0, 15	# Load immediately the following constants into temporary registers. 
	li t1, 10	
	li t2, 5	
	li t3, 2
	li t4, 18
	li t5, -3
	
	sub t6, t0, t1 # Subtract t0 - t1 and store the result in t6
	mul s1, t2, t3 # Multiply t2 * t3 and store the result in s1
	sub s2, t4, t5 # Subtract t4 - t5 and store the result in s2
	div s3, t0, t2 # Divide t0 by t2 and store the result in s3
	
	add t0, t6, s1 #Add t6 and s1 and store the result in t0
	sub t1, s2, s3 #Add s2 - s3 and store the result in t1
	add t2, t0, t1 #Add t0 and t1 and store the result in t2
	
	sw t2, Z, t4  #Save the value of t2 back to Z. But this saving the value of t2 into Z label requires an addintial temp register .i.e. 
	
# END OF ARITHMETIC
