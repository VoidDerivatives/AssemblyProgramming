.section .rodata
	msg_main_print1:
	.string "Enter the two numbers:\t"

	msg_main_scan1:
	.string "%d%d"

	msg_main_print2:
	.string "And is :%d\n"

	msg_main_print3:
	.string "Or is :%d\n"

	msg_main_print4:
	.string "Xor is :%d\n"

	msg_main_print5:
	.string "NOT of ino2 is :%d\n"

	msg_main_print6:
	.string "ino1 << 2 is %d \n"

	msg_main_print7:
	.string "ino2 >> 2 is %d  \n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $8,%esp

	pushl $msg_main_print1 
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	leal -8(%ebp),%edx
	pushl %edx
	pushl %eax
	pushl $msg_main_scan1
	call scanf
	addl $12,%esp

	# andl
	movl -4(%ebp),%eax  #no1
	movl -8(%ebp),%edx  #no2
	andl %edx,%eax
	
	pushl %eax
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	#orl 
	movl -4(%ebp),%eax  #no1
	movl -8(%ebp),%edx  #no2
	orl %edx,%eax

	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $8,%esp

	#xorl 
	movl -4(%ebp),%eax  #no1
	movl -8(%ebp),%edx  #no2
	xorl %edx,%eax

	pushl %eax
	pushl $msg_main_print4
	call printf
	addl $8,%esp

	#not of ino2
	movl -8(%ebp),%eax
	notl %eax

	pushl %eax
	pushl $msg_main_print5
	call printf
	addl $8,%esp

	#left shift
	movl -4(%ebp),%eax  #no1
	sall $2,%eax
	
	pushl %eax
	pushl $msg_main_print6
	call printf
	addl $8,%esp

	#right shift
	movl -8(%ebp),%edx  #no2
	sarl $2,%edx
	
	pushl %edx
	pushl $msg_main_print6
	call printf
	addl $8,%esp
	
	pushl $0
	call exit

