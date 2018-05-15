
.data

.text

main:
	
	li a0 10
	jal F
	mv s1 s0
	
	li a0 10
	jal F
	mv s2 a0
	
	li a0 20
	jal F
	mv s3 a0
	
	
	li a7 10
	ecall

F: 
   li t1 1
   
   bgt a0 t1 Cal
   mv s0 a0
   
   ret
   
 Cal:
   addi sp sp -12
   sw  ra, 0(sp)
   
    sw  a0, 4(sp)
    
    addi a0, a0, -1
    jal F
    
    lw  a0, 4(sp)
    sw  s0, 8(sp)
    
    addi a0, a0, -2
    jal F
    
    lw  t0, 8(sp)
    add s0, t0,s0
    
    lw  ra, 0(sp)
    addi sp, sp,12
    
    ret
    
    
     
