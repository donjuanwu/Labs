
#Name          : Don Dang
#Filename      : Loop.asm
#Date          : 4/26/18
#Class        : Microprocess Designs
#Instructor   : Ken Rabold
#Project      : Lab2 - Part3
#Reference    :Comp. Org & Design: Chapter 2, P.94
#             RISC - V Assembly.pptx. Slide 23
#Purpose     : Translate C syntax of working with loop operations to ASM

#Date		Developer	Activities
#4/26/18  	DD		Complete rest of Lab2 part 3.		   
#


.data #Data declaration


intZ:     .word  2  #Initialize z = 2 
intI:     .word  0  #Set i = 0
intBound: .word 20  #Set bound = 20 

completion: .asciz "Yay. Lab 2 part 3 is now completed"

.text #Program Start

main:
lw t1, intI       #Load i into temp
lw t2, intZ       #Load z into temp
lw t3, intBound   #Load bound into temp

LOOP:               #Set Loop 1 label
slt t0, t1, t3      #If i < 20
beq t0, zero, DO   #Branch when equals
addi t2,t2,1       #Increment Z by 1
addi t1,t1, 2      #Increment i by 2
j LOOP             #Continue iterate 

DO:
addi t2, t2, 1        #Increment z by 1
#sw t2, intZ, s0      #Store intZ into memory
#lw s1, intZ          #Read value from memory
slti t0, t2, 100      #Is z < 100
beq t0,zero, WHILE    #Branch out when equals
j DO                  #Continue iterate


WHILE:	
li t4, 0                  #Set 0 to temp
sgt t0, t1, t4            #Is i > 0 
beq t0,zero, EXIT         # Branch out when equals
addi t2,t2, -1	         # Decrement Z by 1
addi t1,t1, -1           # Decrement i by 1
j WHILE		         # Iterate


EXIT: #Save data and terminate the program
	sw t1,intI,s0  #Store i value in register
	sw t2,intZ,s1  #Store z value in register
	
	
	li a7, 4 		#Set up print string to syscall
	la a0, completion	#Load completion to temp
	ecall			#Tell the OS to do the syscall
	
	li a7,10        	#Set up the exit syscall
	ecall           	#Tell the OS to do the syscall






