.section .rodata
	msg_main_hello:
	.string "hello"

	msg_main_print1:
	.string "\nThe length of hello is %d\n"

	msg_main_print2:
	.string "\n the length of good is %d"

	msg_main_print3:
	.string "\nthe length of morning is %d"

	msg_main_morning:
	.string "morning"
	
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $32,%esp
	
	movl $'G',-9(%ebp)
	movl $'o',-8(%ebp)
	movl $'o',-7(%ebp)
	movl $'d',-6(%ebp)
	movl $0,-5(%ebp)	

	movl $msg_main_hello,%ebx
	movl %ebx,(%esp)
	call Mystrlen
	
	movl $msg_main_print1,(%esp)		
	movl %eax,4(%esp)
	call printf	

	leal -9(%ebp),%ebx
	movl %ebx,(%esp)
	call Mystrlen
	
	movl $msg_main_print2,(%esp)		
	movl %eax,4(%esp)
	call printf

	movl $msg_main_morning,(%esp)
	movl %ebx,4(%esp)
	call Mystrlen
	
	movl $msg_main_print2,(%esp)		
	movl %eax,4(%esp)
	call printf

	movl $0,(%esp)
	call exit

.globl Mystrlen
.type Mystrlen,@function
Mystrlen:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp
	
	movl $0,-4(%ebp)
	jmp label_condition

label_code:
	addl $1,-4(%ebp)
	
label_condition:
	movb $0,%al
	movl -4(%ebp),%ecx  #counter
	movl 8(%ebp),%ebx  
	movb (%ebx,%ecx,1),%bl  #character
	cmpb %bl,%al
	jne label_code

 	movl -4(%ebp),%eax
	
	movl %ebp,%esp
	popl %ebp
		 
	ret

