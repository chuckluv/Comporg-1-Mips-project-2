.data
	data: .space 1001
	output: .asciiz "\n"
	notinvalid: .asciiz "Invalid input"
.text

main :
	li $v0,8	
	la $a0,data	#reads user input 
	li $a1, 1001	
	syscall

pre-check:
	la $t0,data
	addi $t0,$t0,1
	lb $s0, ($t0)
	beq $s0, 0, convert
	beq $s0, 9, skip
	beq $s0, 32, skip
	j during



Exit:
	li $v0, 4 #print what is in the register a0
	syscall
	li $v0, 10 # terminates the program
	syscall