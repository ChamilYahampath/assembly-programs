#floatAdder.asm
	.data 
prompt1: .asciiz "Please Enter Number1: "
prompt2: .asciiz "Please Enter Number2: "
message: .asciiz "Total is: "
	.text 
	
main:	mtc1 $zero, $f5  	# move the value of register 0 to register $f5 
	
	#Print prompt1
 	la $a0, prompt1		# load address of prompt1 string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt1
	
	#read single precision floating point value
	li $v0, 6		# load immediate 6 (service 6 - read single precision floating point value) to register 2
	syscall			# issue a system call to read single precision floating point value
	add.s $f1, $f0, $f5	# copy value in register $f0 to register $f1

	#print prompt2
	la $a0, prompt2		# load address of prompt2 string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print prompt2
	
	#read single precision floating point value
	li $v0, 6		# load immediate 6 (service 6 - read single precision floating point value) to register 2
	syscall			# issue a system call to read single precision floating point value
	add.s $f2, $f0, $f5	# copy value in register $f0 to register $f2
	
	#add two single precision floating point values
	add.s $f12, $f1, $f2	# add two single precision floating point values and save result to register $f12
	
	#Print message
	la $a0, message		# load address of message string to register 4
	li $v0, 4		# load immediate 4 (service 4 - print string) to register 2
	syscall			# issue a system call to print message
	
	#print result
	li $v0, 2		# load immediate 2 (service 2 - print single precision floating point value) to register 2
	syscall			# issue a system call to print single precision floating point value
	
	#end program
	li $v0, 10		# load immediate 10 (service 10 - terminate program) to register 2
	syscall			# issue a system call to terminate program
	
	