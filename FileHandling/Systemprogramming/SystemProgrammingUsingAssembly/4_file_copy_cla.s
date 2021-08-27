.equ MAX,256

.section .rodata

	msg_main_FileFailureSource:
	.string "\nCant Open Source File"

	msg_main_FileFailureDestination:
	.string "\nCant Open destination File\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $288,%esp
	
	movl 12(%ebp),%eax

	movl %eax,(%esp)
	movl $00,4(%esp)	
	call open

	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	je label_if_Source_true

	movl 16(%ebp),%eax

	movl %eax,(%esp)
	movl $01101,4(%esp)
	movl $0666,8(%esp)	
	call open

	movl %eax,-8(%ebp)
	
	cmpl $-1,%eax
	je label_if_Destination_true

	jmp label_while_condition

label_while_code:		

	movl -8(%ebp),%edx

	movl %edx,(%esp)
	movl %ebx,4(%esp)
	movl %eax,8(%esp)
	call write 
	

label_while_condition:
	movl -4(%ebp),%eax   #fd1
	leal -264(%ebp),%ebx  #Buffer	

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl $MAX,8(%esp)
	call read

	movl %eax,-268(%ebp)    #ReadCount

	cmpl $0,%eax
	jg label_while_code	

	movl -4(%ebp),%eax  #fd1	

	movl %eax,(%esp)
	call close

	movl -8(%ebp),%eax   #fd2

	movl %eax,(%esp)
	call close

	movl $0,(%esp)
	call exit


label_if_Source_true:

	movl $1,(%esp)
	movl $msg_main_FileFailureSource,4(%esp)
	movl $22,8(%esp)
	call write
	
	movl $-1,(%esp)
	call exit


label_if_Destination_true:
	
	movl $1,(%esp)
	movl $msg_main_FileFailureDestination,4(%esp)
	movl $28,8(%esp)
	call write
	
	movl $-1,(%esp)
	call exit
	
	
