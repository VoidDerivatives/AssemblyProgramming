.section .rodata
	msg_main_FileName:
	.string "file_to_screen.txt"

	msg_main_RightMode:
	.string "r"

	msg_main_FileError:
	.string "\n cant open File: \n"
	
	msg_main_string:
	.string "%s"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $80,%esp

	movl $0,-4(%ebp) #fp = NULL

	#File open
	movl $msg_main_FileName,(%esp)
	movl $msg_main_RightMode,4(%esp)
	call fopen

	movl %eax,-4(%ebp)

	cmpl $0,%eax
	jne label_fp_ISNotEqual		
	
	# File failed to open
	movl $msg_main_FileError,(%esp)
	call printf
	
	movl $-1,(%esp)
	call exit

label_fp_ISNotEqual:

	leal -54(%ebp),%ebx
	movl -4(%ebp),%eax

	movl %ebx,(%esp)
	movl $49,4(%esp)
	movl %eax,8(%esp)
	call fgets
	
	cmpl $0,%eax
	je label_while_loop_exit

	leal -54(%ebp),%ebx
	
	movl $msg_main_string,(%esp)
	movl %ebx,4(%esp)
	call printf		

	jmp label_fp_ISNotEqual
label_while_loop_exit:

	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call fclose

	movl $0,-4(%ebp)
	
	movl $0,(%esp)
	call exit


