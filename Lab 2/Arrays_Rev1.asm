#Name         : Don Dang
#Filename     : Arrays_Rev1.s
#Date        : 4/26/18
#Class      : Microprocess Designs
#Instructor: Ken Rabold
#Project   : Lab2 - Part4
#Reference: Comp. org & Designs. Chapter 2, p. 138
#
#Purpose : Translate C syntax of working with arrays to ASM

#Date		Developer	Activities
#4/29/18  	DD		Complete rest of Lab2 part 4.
#                               Fix a few logical errors. Rename file Arrays_Rev1.s		   
#
.data
arrA:  .word 0, 0, 0, 0, 0
arrB:  .word 1, 2, 4, 8, 16

completion: .asciz "Yay. Lab 2 part 4 is now completed"

.text  #Start Program
li a0, 0 		# i = 0. Loop i = 0
li a1, 5 		# n = 5. Bound i < 5
la a2, arrA		# Load address of arrA into register
la a3, arrB		# Load address of arrA into register

# for (i = 0; i < 5; i++)

LOOP:
  lw a4, 0(a3) 		# Set a4 = B[i]
  addi a4, a4, -1 	# Set a4 = B[i] -1
  sw a4, 0(a2) 		# A[i] = B[i]-1 (a4)
# Move to the next element in the array
  addi a2, a2, 4 	# Go to next element. A[i++]
  addi a3, a3, 4 	# Go to next element. B{i++]
# i++
  addi a0, a0 1 	# i+=1
  blt a0, a1, LOOP 	# Branch if Less Than: if i < 5 return to for:
  
addi a0, a0, -1 	# i--
li a1, 2 		# a1 = 2 for multiplication in while loop  
  

 WHILE:
    addi a2, a2, -4 	#A[i--]
    addi a3, a3, -4 	#B[i--]
    lw a4, 0(a2) 	# a4 = a{i}
    lw a5, 0(a3) 	# a5 = B[i]
    add a4, a4, a5 	# a4 = A[i] + B[i]
    mul a4, a4, a1 	# a4 * 2 
    sw a4, 0(a2) 	# A[i] = (A[i} + B[i]) * 2
    addi a0, a0, -1
    ble x0, a0, WHILE 	# if 0 < = i move to while loop commands
    
    
        li a7, 4         	#Set up print string syscall
	la a0, completion   	#Load good bye into temp
	ecall            	#Tell the OS to do the syscall


	li a7, 10        	#Set up exit syscall
	ecall 
    
 #END