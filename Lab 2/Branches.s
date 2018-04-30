#Name          : Don Dang
#Filename      : Branches.s
#Date          : 4/24/18
#Class        : Microprocess Designs
#Instructor   : Ken Rabold
#Project      : Lab2 - Part2
#Reference    :Comp. org & Designs. Chapter 2, p. 67
#             RISC - V Assembly.pptx. Slide 30 - 39
#Purpose     : Translate C syntax of working with conditional logical operations to ASM

#Date		Developer	Activities
#4/24/18  	DD		Complete rest of Lab2 part 2.		   
#

.data                  #Data declaration section

intA: .word 10        #A = 10
intB: .word 15        #B = 15
intC: .word 6         #C = 6
intZ: .word 0         #Z = 0

completion: .asciz "Yay. Lab 2 part 2 is now completed"


.text                 #Start of code section
main:                 #Label main:

#intA,intB,intC,intZ were declared as a word datatype then use "lw" not li. Li is used to store constant into a register
#lw is pseudo instruction. Action doesn't get commit right away
lw t2, intA         #A = 10
lw t3, intB         #B = 15
lw t4, intC         #C = 6
lw t6, intZ         #Z = 0


li t5, 5               #li can be used to load integer
slt t0, t2, t3         #Check  if a(10) < b(15). True set t0 = 1, False set t0 = 0. This is true, t0 = 1
beq t0, zero, IF       #Branch to IF if the BEQ evaulation to true. BEQ - evaluate (1 == 0). This is false. Go to the next line. - Branch if they are equals
sgt t1, t4, t5         #Check if  6 > 5 . True set t1 = 1.
beq t1, zero, IF       #Branch to IF if the BEQ evaulation to true. BEQ - evaluate (1 == 0). This is false. Go to the next line.
addi t6,zero,1         #Set Z equals 1
j SWITCH              #Jump to SWITCH
#-----------------------------------------------NOT USE--------------------------------------------------------------------------------
#li t6, 1            #li - load immediately 1 into t6.
#sw t6, intZ, a0     #sw. store it into memory. SW means take register t6 and store value into intZ but need an extra register
#lw t0, intZ
#--------------------------------------------------------------------------------------------------------------------------------------


#****************************************************************LABEL IF****************************************************************************
# If (A > B || ((C +1) == 7)
# Since this is an OR we only need one true statement to execcute the next below line
IF:

sgt t0, t2, t3        #Check if A > B. False, t0 = 0
bne t0, zero, ELSE    #Branch if they are NOT equals. This is evaulation is equal (0 == 0). 
                      # Currently C is set to register t4
addi t4, t4, 1        # C + 1: add 1 to t4, then assign result to t4
# (c+1) == 7  ???      
li t5, 7              #t5 == 7
bne t4, t5  ELSE      #Branch if they are not equals        
addi t6,zero,2        #Set Z equals 1
j SWITCH              #Jump to SWITCH
#----------------------------------------------NOT USE------------------------------------------------------------------------------------
#li t6, 2             # load immediately t6 == 2
#sw t6, intZ, t0      # Put t6 value into intZ then store word value into to t0
#-----------------------------------------------------------------------------------------------------------------------------------------


#------------------------------------------------------------------LABEL ELSE--------------------------------------------------------------
# If (A > B || ((C +1) == 7)
# Since this is an OR we only need one true statement to execcute the next below line

ELSE:
addi t6,zero,3      #Set Z equals 3
j SWITCH            #Jump to SWITCH
#---------------------------------------------------NOT USE----------------------------------------------------------------------------------
#z == 3             At this point intZ is still a variable. Need to load 2 into a register then assign intZ == 2 and assign it to t0
#li t6, 3             # load immediately t6 == 3
#sw t6, intZ, t0     # Put t6 value into intZ then store word value into to t0
#---------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------------LABEL SWITCH---------------------------------------------------------
# Z is stored in register a0
SWITCH: # Case z =1
addi t0 ,zero, 1  #Set t0 = 1 to compare to a0
bne t6, t0 CASE2  #Branch if they are not the same. 
addi t6,zero, -1  #Set z = -1
j EXIT            #Exit Program

CASE2: # Case z = 2
addi t0,zero, 2    #Set t0 = 2
bne t6, t0 CASE3  #Branch if they are not the same. 
addi t6,zero, -2  #Set z = -2
j EXIT           #Exit Program


CASE3:  # Case z = 3
addi t0,zero, 3           #Set t0 = 3
bne t6, t0 DEFAULT 	 #Branch if they are not the same. 
addi t6,zero, -3         #Set z = -3
j EXIT              	#Exit Program

DEFAULT: #Default
addi t6,zero,0          #Set a0 = 0, z = 0
j EXIT


#--------------------------------------------------------------------LABEL EXIT------------------------------------------------------------
EXIT: #Save data and terminate the program

#Avoid runtime exception - address out of range
sw t2, intA, t0     
sw t3, intB, t0 
sw t4, intC, t0 
sw t6, intZ, t0 
#lw t0, 1(a0)

	li a7, 4         	#Set up print string syscall
	la a0, completion   	#Load good bye into temp
	ecall            	#Tell the OS to do the syscall


	li a7, 10        	#Set up exit syscall
	ecall            	#Tell the OS to do the syscall





