.section .rodata
	msg_main_print1:
	.string "enter the string (limit<20): "

	msg_main_print2:
	.string "\nEnter the charachter that you want to set : "
	
	msg_main_scan:
	.string "%c"

	msg_main_print3:
	.string "After setting :\t"

.section .text
.globl main
.type main,@function
main:
	pushl %esp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp

	movl $msg_main_print1,(%esp)
	call printf
	
	leal -20(%ebp),%ebx
	movl $msg_main_scan,(%esp)
 	call gets

	movl $msg_main_print2,(%esp)
	call printf

	leal -21(%ebp),%ebx
	movl %ebx,(%esp)
	call scanf
	
	leal -20(%ebp),%esi
	movl %esi,(%esp)
	call Mystrlen

	movl %eax,%ecx
	
label_code:	
	movb -21(%ebp),%al
	movb  %al,  
	


	movl $0,(%esp)
	call exit






