.section .rodata
	msg_main_print1:
	.string "Enter the two numbers:\t"
	
	msg_main_scan:
	.string "%d%d"
	
	msg_main_print2:
	.string "And is %d\n"

	msg_main_print3:
	.string "Or is:%d\n"

	msg_main_print4:
	.string "Xor is:%d\n"

	msg_main_print5:
	.string "Not of ino2 is :%d\n"

	msg_main_print6:
	.string "ino1 << 2 is %d \n"

	msg_main_print7:
	.string "ino2 >> 2 is %d\n"

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
	pushl $msg_main_scan
	call scanf
	addl $12,%esp	
	
	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	andl %edx,%eax
	pushl %edx
	pushl $msg_main_print2
	call printf
	addl $8,%esp

	movl -4(%ebp),%eax
	movl -8(%ebp),%edx
	orl %edx,%eax
	pushl %eax
	pushl $msg_main_print3
	call printf
	addl $8,%esp
	
	movl -4(%esp),%eax
	movl -8(%esp),%edx
	xorl %edx,%eax
	pushl %eax
	pushl $msg_main_print4
	call printf
	addl $8,%esp
	
	movl -8(%esp),%eax
	notl %eax
	pushl %eax
	pushl $msg_main_print5
	call printf
	addl $8,%esp

	movl -4(%esp),%eax
	sall $2,%eax
	pushl  %eax
	pushl $msg_main_print6
	call printf
	addl $8,%esp

	movl -8(%esp),%eax
	sarl $2,%eax
	pushl %eax
	pushl $msg_main_print7
	call printf
	addl $8,%esp

	pushl $0
	call exit





	



	











	
















	









