
#Name          : Don Dang
#Filename      : FunctionCall_Rev2.asm
#Date          : 4/26/18
#Class        : Microprocess Designs
#Instructor   : Ken Rabold
#Project      : Lab2 - Part5
#Reference    :Comp. Org & Design: Chapter 2, P.138
#             RISC - V Function Calling.pptx. Slide 4 - 27
#Purpose     : Translate C syntax of working with function calling to ASM

#Date		Developer	Activities
#4/26/18  	DD		Complete rest of Lab2 part 5.		   
#

.data #Data delaration
intA: .word 0
intB: .word 0
intC: .word 0
completion: .asciz "Yay. Lab 2 part 5 is now completed"
.text #Start Program 
main:
	addi t0,zero,5 		# i = 5
	addi t1,zero,10 	# j = 10
	
	# Call 1
	addi sp,sp,-8
	sw t0,0(sp)
	sw t1,4(sp)
	
	mv a0,t0
	jal ADDITUP
	
	lw t1,4(sp)
	lw t0,0(sp)
	addi sp,sp,8
	
	la t6,intA
	sw a0,0(t6)
	
	# Call 2
	addi sp,sp,-8
	sw t0,0(sp)
	sw t1,4(sp)
	
	mv a0,t1
	jal ADDITUP
	
	lw t1,4(sp)
	lw t0,0(sp)
	addi sp,sp,8
	
	la t6,intB
	sw a0,0(t6)
	
	# Operation
	lw t6,intA
	lw t5,intB
	la t4,intC
	add t6,t6,t5
	sw t6,0(t4)
	
	j EXIT
	
ADDITUP:
	mv t0,zero 		# i = 0
	mv t2,zero 		# x = 0
	mv t1,a0 		# n = arg
LOOP: 
	addi t2,t2,1 
	add t2,t2,t0
	addi t0,t0,1 		# i++
	BLT t0,t1,LOOP 		# if i < n then loop
	mv a0,t2
	ret 
EXIT:

	li a7, 4         	#Set up print string syscall
	la a0, completion   	#Load good bye into temp
	ecall            	#Tell the OS to do the syscall


	li a7, 10        	#Set up exit syscall
	ecall            	#Tell the OS to do the syscall
