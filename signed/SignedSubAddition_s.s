.section .rodata
	msg_main_print1:
	.string "Overflow flag is set\n"

	msg_main_print2:
	.string "Overflow flag is not set\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp
	
	movb $128,%al
	movb $1,%bl

	subb %bl,%al
	jo label_set

	#flag is not set
	movl $msg_main_print2,(%esp)
	movb %al,4(%esp)
	call printf

	jmp label_exit
label_set:
	
	#flag is set
	movl $msg_main_print1,(%esp)
	movb %al,4(%esp)
	call printf

label_exit:

	movl $0,(%esp)
	call exit
