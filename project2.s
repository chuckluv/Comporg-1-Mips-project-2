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