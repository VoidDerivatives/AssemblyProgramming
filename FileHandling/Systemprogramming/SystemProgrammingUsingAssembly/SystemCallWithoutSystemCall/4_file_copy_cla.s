.equ MAX,256

.section .rodata
	msg_main_FileFailureSource:
	.string "\nCant Open Source File"
	
	msg_main_print1Size1:
	.equ Print1Size1,msg_main_print1Size1 - msg_main_FileFailureSource

	msg_main_FileFailureDestination:
	.string "\nCant Open destination File\n"

	msg_main_print2Size2:
	.equ Print2Size2,msg_main_print2Size2 - msg_main_FileFailureDestination

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $288,%esp
	
	movl $5,%eax
	movl 12(%ebp),%ebx
	movl $00,%ecx	
	int $0x80

	movl %eax,-4(%ebp)
	
	cmpl $-14,%eax
	je label_if_Source_true

	movl $5,%eax
	movl 16(%ebp),%ebx
	movl $01101,%ecx
	movl $0666,%edx	
	int $0x80

	movl %eax,-8(%ebp)
	
	cmpl $3,%eax
	je label_if_Destination_true

	jmp label_while_condition

label_while_code:		

	movl $4,%eax
	movl -8(%ebp),%ebx
	leal -264(%ebp),%ecx
	movl -268(%ebp),%edx
	int $0x80

label_while_condition:
	movl $3,%eax
	movl -4(%ebp),%ebx   #fd1
	leal -264(%ebp),%ecx  #Buffer	
	movl $MAX,%edx
	int $0x80

	movl %eax,-268(%ebp)    #ReadCount

	cmpl $0,%eax
	jg label_while_code	

	movl $6,%eax
	movl -4(%ebp),%ebx  #fd1	
	int $0x80

	movl $6,%eax
	movl -8(%ebp),%ebx  #fd2	
	int $0x80

	movl $1,%eax
	movl $0,%ebx
	int $0x80

label_if_Source_true:

	movl $4,%eax
	movl $1,%ebx
	movl $msg_main_FileFailureSource,%ecx
	movl $Print1Size1,%edx
	int $0x80
	
	movl $1,%eax
	movl $-1,%ebx
	int $0x80

label_if_Destination_true:
	
	movl $4,%eax
	movl $1,%ebx
	movl $msg_main_FileFailureDestination,%ecx
	movl $Print2Size2,%edx
	int $0x80
	
	movl $1,%eax
	movl $-1,%ebx
	int $0x80
	
	
