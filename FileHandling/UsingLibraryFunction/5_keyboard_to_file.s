.section .rodata
	msg_main_FileName:
	.string "Keyboard_to_file.txt"

	msg_main_WriteMode:
	.string "w"

	msg_main_FileError:
	.string "\n cant open File: \n"
	
	msg_main_NewLine:
	.string "\n"

	msg_main_keyboardInput:
	.string "\nEnter strings: \n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $64,%esp

	movl $0,-4(%ebp) #fp = NULL

	#File open
	movl $msg_main_FileName,(%esp)
	movl $msg_main_WriteMode,4(%esp)
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

	movl $msg_main_keyboardInput,(%esp)
	call printf

	leal -54(%ebp),%ebx
	movl %ebx,(%esp)
	call gets
	
	movl %eax,(%esp)
	call strlen

	cmpl $0,%eax
	jng label_while_loop_exit

	leal -54(%ebp),%eax
	movl -4(%ebp),%ebx
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call fputs

	movl -4(%ebp),%eax
	movl $msg_main_NewLine,(%esp)	 
	movl %eax,4(%esp)
	call fputs
	
	jmp label_fp_ISNotEqual
label_while_loop_exit:

	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call fclose

	movl $0,-4(%ebp)
	
	movl $0,(%esp)
	call exit


