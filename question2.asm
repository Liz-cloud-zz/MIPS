.text
main:	
	#Dispay message1
	 li $v0,4
	 la $a0,message1
	 syscall
	 
	 #Enter string
	 li $v0,8
	 la $a0,input #a1 points to the string
	 li $a1,2
	 syscall
	 
	 #read in rest of input
	 li $v0,5
	 syscall
	 
	 #store value in t0
	 move $t0,$v0
	 
	 #print second message
	 li $v0,4
	 la $a0,message2
	 syscall
	 
	 #add 5 to input
	 addi $t0,$t0,5
	 
	 #print result
	 move $a0,$t0
	 li $v0,1
	 syscall
	
	 #terminate 
	 li $v0,10
	 syscall
	 
.data
message1: .asciiz "Enter a string:\n"
message2: .asciiz "The value +5 is:\n"
input: .space 32

