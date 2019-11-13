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
	beq $s0, 0, finish
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
	bge $t2, 4, invalid
	bge $t3, 1, invalid
	j sort
sort:
	beq $s0, $zero, finish
	ble $s0, 47, special
	ble $s0, 57, integer
	ble $s0, 84, capital
	ble $s0, 116, lowercase
	bge $s0, 117, special
special:
	beq $s0, 9,  gap
	beq $s0, 32, gap
	j invalid
gap:
	
	addi $t3,$t3, -1
	j during			
	

Exit:
	li $v0, 10
	syscall
	
	