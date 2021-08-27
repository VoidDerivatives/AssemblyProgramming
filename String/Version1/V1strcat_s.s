.section .rodata
	msg_main_print1:
	.string "\n\nenter the destination string :  "

	msg_main_print2:
	.string "\n\nenter the source string : "

	msg_main_print3:
	.string "\n\n concatinated string is:  "

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $48,%esp

	movl $msg_main_print1,(%esp)
	call printf

	leal -40(%ebp),%ebx    #desti
	movl %ebx,(%esp)
	call gets
			
	movl $msg_main_print2,(%esp)
	call printf

	leal -20(%ebp),%ebx    #source
	movl %ebx,(%esp)
	call gets
	
	leal -20(%ebp),%esi   #source
	leal -40(%ebp),%edi   #dest

	movl %edi,(%esp)
	call Mystrlen	
	
	addl %eax,%edi
 
	movl %esi,(%esp)
	call Mystrlen

	movl %eax,%ecx

label_code:
	lodsb
	stosb
	loop label_code

	movl $0,(%edi)   #last \0
	
	movl $msg_main_print3,(%esp)
	call printf
	
	leal -40(%ebp),%ebx
	movl %ebx,(%esp)
	call puts
	
	movl $0,(%esp)
	call exit	

