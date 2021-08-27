.equ MAX,256

.section .rodata
	msg_main_print1:
	.string "print_characters.txt"

	msg_main_print2:
	.string "\n Cant open File"


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $288,%esp				
	
	movl $msg_main_print1,(%esp)
	movl $00,4(%esp)	
	call open
	
	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	je label_if_true
	
	jmp label_while_condition

label_while_code:		
	
	movl $1,(%esp)
	movl %ebx,4(%esp)
	movl %eax,8(%esp)
	call write 
	
	
label_while_condition:
	movl -4(%ebp),%eax   #fd
	leal -260(%ebp),%ebx  #Buffer	

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl $MAX,8(%esp)
	call read

	movl %eax,-264(%ebp)    #ReadCount

	cmpl $0,%eax
	jg label_while_code	

	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call close

	movl $0,(%esp)
	call exit
	
label_if_true:

	movl $1,(%esp)
	movl $msg_main_print2,4(%esp)
	movl $16,8(%esp)
	call write
	
	movl $-1,(%esp)
	call exit	
	
