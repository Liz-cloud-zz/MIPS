.text
main:
	#Display 1st message
	li $v0,4
	la $a0, message1
	syscall
	
	#enter input
	li $v0,8
	la $a0,input1
	li $a1,5
	syscall
	
	#enter input
	li $v0,8
	la $a0,input2
	li $a1,5
	syscall
	
	#enter input
	li $v0,8
	la $a0,input3
	li $a1,5
	syscall
	
	#enter input
	li $v0,8
	la $a0,input4
	li $a1,5
	syscall
	
	#enter input
	li $v0,8
	la $a0,input5
	li $a1,5
	syscall
	
	#Display 2nd message
	li $v0,4
	la $a0,message2
	syscall
	
	#Display input
	li $v0,4
	la $a0,input1
	syscall
	
	#Display input
	li $v0,4
	la $a0,input2
	syscall
	
	#Display input
	li $v0,4
	la $a0,input3
	syscall
	
	#Display input
	li $v0,4
	la $a0,input4
	syscall
	
	#Display input
	li $v0,4
	la $a0,input5
	syscall
	
	#Terminate mian function
	li $v0, 10
	syscall

.data
message1: .asciiz "Enter a series of 5 formulae:\n"
input1: .space 5
input2: .space 5
input3: .space 5
input4: .space 5
input5: .space 5
message2: .asciiz "The values are:\n"
