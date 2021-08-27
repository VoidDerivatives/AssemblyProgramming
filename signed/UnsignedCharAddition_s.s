.section .rodata
	msg_main_print1:
	.string "Carry flag is set\n"

	msg_main_print2:
	.string "Carry flag is not set\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp
	
	#movb $128,%al
	#movb $128,%bl

	movb $128,%al
	movb $128,%bl

	addb %bl,%al
	jc label_set

	#flag is not set
	movl $msg_main_print2,(%esp)
	call printf

	jmp label_exit
label_set:
	
	#flag is set
	movl $msg_main_print1,(%esp)
	call printf

label_exit:

	movl $0,(%esp)
	call exit
