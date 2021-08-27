.section .rodata
	msg_main_print1:
	.string "Equal"

	msg_main_print2:
	.string "Not Equal"

.section .data
	.globl fNo1
	.type fNo1,@object
	.size fNo1,4
	.align 4
	fNo1:
		.float 3.0

	.globl f1
	.type f1,@object
	.size f1,4
	.align 4
	f1:
		.int 3

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp

	filds f1
		
	fstp 4(%esp)
	movl 4(%esp),%eax	

	movl fNo1,%edx
	
	cmpl %eax,%edx
	jne label_not_equal

 	movl $msg_main_print1,(%esp)
	call printf
 	
	jmp label_exit

label_not_equal:

	movl $msg_main_print2,(%esp)
	call printf

label_exit:

	movl $0,(%esp)
	call exit

