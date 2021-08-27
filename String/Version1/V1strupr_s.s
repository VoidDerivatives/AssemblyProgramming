.section .rodata
	msg_main_print1:
	.string "\n* enter the string(limiy<20):\t"

	msg_main_print2:
	.string "\n* string in upper case is:\t"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp

	movl $msg_main_print1,(%esp)
	call printf

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call gets

	leal -20(%ebp),%esi
	leal -20(%ebp),%edi

	movl %esi,(%esp)
	call Mystrlen

	movl %eax,%ecx
	
label_code:
	lodsb 
	subb $32,%al
	stosb
	
	loop label_code

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call puts

	movl $0,(%esp)
	call exit

