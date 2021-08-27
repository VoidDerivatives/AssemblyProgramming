.section .rodata
	msg_main_print1:
	.string "\n* enter the string(limiy<20):\t"

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

	addl %eax,%esi
	
label_code:
	std
	lodsb	 	
	cld
	stosb
	loop label_code

	movl $0,(%edi)

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call puts

	movl $0,(%esp)
	call exit

