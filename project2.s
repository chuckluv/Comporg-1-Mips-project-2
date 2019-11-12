.data
	data: .space 1001
	output: .asciiz "\n"
	notvalid: .asciiz "Invalid input"
.text

main:
	#asks for input

	li $v0, 8
	la $a0, data
	li $a1, 1001
	syscall

before:
	la $t0,data
	add $t0,$t0,$t1
	lb $s0, ($t0)
	beq $s0, 9, skip
	beq $s0, 32, skip
	j during

skip:
	addi $t1, $t1,1
	j before
during:
	la $t0,data
	add t0,$t0,$t1
	lb $s0, ($t0)
	bge $t2, 5, invalid
	j sort

	


Exit:
	li $v0, 10
	syscall
	
	