.section .rodata
	msg_main_print1:
	.string "\n\nenter the destination string :  "

	msg_main_print2:
	.string "\n\nenter the source string : "

	msg_main_print3:
	.string "\n\n concatinated string is:  "
	
	msg_main_print4:
	.string "\n\nenter value of n :  "

	msg_main_scan:
	.string "%d"
	
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

	leal -40(%ebp),%ebx    #desti
	movl %ebx,(%esp)
	call gets
			
	movl $msg_main_print2,(%esp)
	call printf

	leal -20(%ebp),%ebx    #source
	movl %ebx,(%esp)
	call gets

	movl $msg_main_print4,(%esp)
	call printf
	
	leal -44(%ebp),%ebx
	movl $msg_main_scan,(%esp)
	movl %ebx,4(%esp)
	call scanf 


	leal -20(%ebp),%esi   #source
	leal -40(%ebp),%edi   #dest

	movl %edi,(%esp)
	call Mystrlen	

	addl %eax,%edi

	movl -44(%ebp),%ecx
	rep movsb
	
	movl $0,(%edi)   #last \0
	
	leal -40(%ebp),%ebx
	movl %ebx,(%esp)
	call puts
	
	movl $0,(%esp)
	call exit
