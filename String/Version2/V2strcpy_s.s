.section .rodata 
	msg_main_print1:
	.string "\n\nenter the source string : "

	msg_main_print2:
	.string "\n\n source string is\t"

	msg_main_print3:
	.string "\n\n destination string\t\t"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $64,%esp
	
	movl $msg_main_print1,(%esp)
	call printf

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call gets        #source

	movl $msg_main_print2,(%esp)
	call printf

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call puts

	leal -20(%ebp),%esi
	leal -40(%ebp),%edi

	movl %esi,(%esp)
	call Mystrlen		

	movl %eax,%ecx

label_code:
	lodsb
	stosb
	loop label_code


	
	movl $0,(%edi)

##################Display##############

	movl $msg_main_print3,(%esp)
	call printf

	leal -40(%ebp),%ebx
	movl %ebx,(%esp)
	call puts

	movl $0,(%esp)
	call exit

