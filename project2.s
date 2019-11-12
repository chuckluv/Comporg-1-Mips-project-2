.data
	data: .space 1001
	output: .asciiz "\n"
	notinvalid: .asciiz "Invalid input"
.text

main:
	#asks for input

	li $v0, 8
	la $a0, data
	li $a1, 1001
	syscall

begin:
	la $t0,data
	add $t0,$t0,$t1
	lb $s0, ($t0)
	beq $s0, 9, space
	beq $s0, 32, space
	