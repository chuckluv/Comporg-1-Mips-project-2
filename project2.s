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
	li $t7, -1
	la $t0,data
	add $t0,$t0,$t1
	lb $s0, ($t0)
	bge $t2, 5, invalid
	bge $t3, 1, invalid
	j sort
sort:
	beq $s0, 0, finish
	ble $s0, 47, special
	ble $s0, 57, integer
	ble $s0, 84, capital
	ble $s0, 116, lowercase
	bge $s0, 117, special
special:
	addi $t1,$t1, 1
	beq $s0, 9,  gap
	beq $s0, 32, gap
	beq $s0, 10, finish
	j invalid
gap:
	
	addi $t3,$t3, -1
	j during			

integer:
	ble $s0, 47, special
	addi $t1, $t1, 1
	addi $t2, $t2, 1	
	
	li $t5, 48
	sub $s0, $s0, $t5
	add $s1, $s1, $s0
	mul $t3, $t3, $t7
	j during
capital:
	ble $s0, 64, special
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	
	li $t5, 55
	sub $s0, $s0, $t5
	add $s1, $s1, $s0
	mul $t3, $t3, $t7
	
	j during
lowercase:
	ble $s0, 96, special
	addi $t1, $t1, 1
	addi $t2, $t2, 1	
	
	li $t5, 87
	sub $s0, $s0, $t5
	add $s1, $s1, $s0
	mul $t3, $t3, $t7
	j during	

finish:

	li $v0, 4
	la $a0, output
	syscall

	li $v0, 1
	
	move $a0, $t2
	syscall
	j Exit	
	
invalid:
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 4
	la $a0, notvalid
	syscall
	j Exit

Exit:
	li $v0, 10
	syscall
	
	