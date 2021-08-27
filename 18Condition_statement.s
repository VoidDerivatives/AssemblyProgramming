.section .rodata
	msg_main_print:
	.string "Enter the numbers:\t"
	
	msg_main_scan:
	.string "%d"
	
	msg_main_print1:
	.string "number is even\n"
	
	msg_main_print2:
	.string "number is odd\n"
	
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $4,%esp
	
	pushl $msg_main_print
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp

	xorl %eax,%eax
	xorl %edx,%edx
	xorl %ecx,%ecx
	xorl %ebx,%ebx
	
	movl -4(%ebp),%eax
	movl $2,%ebx
	divl %ebx
	cmpl $0,%edx
	jne label_else
	
	pushl $msg_main_print1
	call printf
	addl $4,%esp
	
	jmp label_exit
	

label_else:
	pushl $msg_main_print2
	call printf
	addl $4,%esp

label_exit:
	pushl $0
	call exit
	






		



	
