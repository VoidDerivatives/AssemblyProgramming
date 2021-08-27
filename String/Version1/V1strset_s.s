.section .rodata
	msg_main_print1:
	.string "\n* enter the string(limiy<20):\t"

	msg_main_print2:
	.string "\n* Enter the char\t"

	msg_main_scan:
	.string "%c"

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

	movl $msg_main_print2,(%esp)
	call printf

	leal -21(%ebp),%ebx
	movl $msg_main_scan,(%esp)
	movl %ebx,4(%esp)
	call scanf

	leal -20(%ebp),%edi

	movl %edi,(%esp)
	call Mystrlen

	movl %eax,%ecx  
	
label_code:
	movb -21(%ebp),%al 	
	stosb
	loop label_code

	leal -20(%ebp),%ebx
	movl %ebx,(%esp)
	call puts

	movl $0,(%esp)
	call exit

