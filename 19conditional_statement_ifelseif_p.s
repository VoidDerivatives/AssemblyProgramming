.section .rodata
	msg_main_print1:
	.string "Enter the numbers:\t"
	
	msg_main_scan:
	.string "%d"

	msg_main_print2:
	.string "number is less than 2\n"

	msg_main_print3:
	.string "number is greater than 2\n"

	msg_main_print4:
	.string "number is 2\n"

.section .text
.globl main
.type main,@function 
main:
	pushl %ebp
	movl %esp,%ebp
	
	subl $4,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	pushl %eax
	pushl $msg_main_scan
	call scanf
	addl $8,%esp
	
	movl  -4(%ebp),%eax
	movl $2,%edx
	cmpl %edx,%eax
	jge label_else_if
	
	pushl $msg_main_print2
	call printf
	addl $4,%esp
	jmp label_exit

label_else_if:
	jle lable_else
	
	pushl $msg_main_print3
	call printf
	addl $4,%esp
	jmp label_exit

lable_else:
	pushl $msg_main_print4
	call printf
	addl $4,%esp

label_exit:
	pushl $0
	call exit

	
 













