.data
	arr: .space 20
	message1: .asciiz "Enter a series of 5 formulae:\n"
	message2: .asciiz "The values are:\n"
	newLine: .asciiz "\n"
	
	input1: .word 0
	input2: .word 0
	input3: .word 0
	input4: .word 0
	input5: .word 0
	genInput: .word 0
		
.text
main:

	li $s3,0 #store teh number of elements
	# load the address of the array into t0
	la $s0, arr
	la $s2,arr #store the offset
	#place the first input in there
	la $s1, input1
	sw $s1, 0($s0)
	la $s1, input2
	sw $s1, 4($s0)
	la $s1, input3
	sw $s1, 8($s0)
	la $s1, input4
	sw $s1, 12($s0)
	la $s1, input5
	sw $s1, 16($s0)
	la $a0, message1
	li $v0, 4
	syscall

# function to take in the other 
others: 
#now, once you enter this for the first time the count should be 1 and the offset should be 4
	bgt $s3, 4, endLoop
	#load the address of genInput into a0 to get that input
	la $a0, genInput
	li $a1, 20
	li $v0, 8
	syscall
	#store the number that was taken in and put it in s4
	la $s4, genInput
	#check if the first character is an =
	lb $t1, genInput
	beq $t1, '=', addRef #if an = was entered, we go to addRef	
	li $s6, 0
	j sum_loop	
	
sum_loop: 
	lb $t1, ($s4)
	addu $s4, $s4, 1
	beq $t1, 10, storeInt
	sll $t6, $s6, 1
	sll $t7, $s6, 3
	add $s6, $t6, $t7
	sub $t1, $t1, '0'
	add $s6, $s6, $t1
	j sum_loop
	
storeInt:
	la $t5, arr
	#otherwise we store the input in into the next available array lovation which we can et from s3
	sll $t2, $s3, 2  #this takes the count and multiplies it by 4
	addu $t5, $t2, $t5 #move the pointer to the address of the next arraty location
	sw $s6, 0($t5)
	addi $s3, $s3, 1 #increment the count 
	j others
	
addRef:
	la $t1, genInput
	addi $t1, $t1, 1 #look at the second che
	lb $t0, 0($t1)
	beq $t0, '0',zero
	beq $t0, '1',one
	beq $t0, '2',two
	beq $t0, '3',three
	j endLoop

zero:
	la $t5, arr
	sll $t2, $s3, 2  #this takes the count and multiplies it by 4
	addu $t5, $t2, $t5 #move the pointer to the address of the next arraty location
	la $t0, arr
	lw $t1, 0($t0)
	sw $t1, 0($t5)
	addi $s3, $s3, 1 #increment the count 
	j others

one:
	la $t5, arr
	sll $t2, $s3, 2  #this takes the count and multiplies it by 4
	addu $t5, $t2, $t5 #move the pointer to the address of the next arraty location
	la $t0, arr
	lw $t1, 4($t0)
	sw $t1, 0($t5)
	addi $s3, $s3, 1 #increment the count 
	j others	
			
two:
	la $t5, arr
	sll $t2, $s3, 2  #this takes the count and multiplies it by 4
	addu $t5, $t2, $t5 #move the pointer to the address of the next arraty location
	la $t0, arr
	lw $t1, 8($t0)
	sw $t1, 0($t5)
	addi $s3, $s3, 1 #increment the count 
	j others

three:
	la $t5, arr
	sll $t2, $s3, 2  #this takes the count and multiplies it by 4
	addu $t5, $t2, $t5 #move the pointer to the address of the next arraty location
	la $t0, arr
	lw $t1, 12($t0)
	sw $t1, 0($t5)
	addi $s3, $s3, 1 #increment the count 
	j others	
				
endLoop: 
	la $a0,message2
	li $v0, 4
	syscall

	la $t0, arr #point to the base array address
	
	lw $a0, 0($t0)
	li $v0, 1
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	lw $a0, 4($t0)
	li $v0, 1
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	lw $a0, 8($t0)
	li $v0, 1
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	lw $a0, 12($t0)
	li $v0, 1
	syscall
	
	la $a0, newLine
	li $v0, 4
	syscall
	
	lw $a0, 16($t0)
	li $v0, 1
	syscall
	
	#end program
	li $v0, 10
	syscall
	
