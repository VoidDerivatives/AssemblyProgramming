.section .rodata
	msg_main_FileName:	
	.string "chars_spaces_tabs_newlines_count.txt"

	msg_main_FileReadMode:
	.string "r"

	msg_main_FileError:
	.string " cant open File: "

	msg_main_CharacterPrint:
	.string "%c"

	msg_main_CharCount:
	.string "\n No of Characters are %d \n"

	msg_main_SpaceCount:
	.string "\n No of Spaces are %d \n"

	msg_main_TabsCount:
	.string "\n No of Tabs are %d \n"

	msg_main_LinesCount:
	.string "\n No of Lines are %d \n"


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp
	
	movl $0,-4(%ebp) #fp = NULL

	movl $0,-8(%ebp) #chars = 0
	movl $0,-12(%ebp) #space = 0
	movl $0,-16(%ebp) #tabs = 0
	movl $0,-20(%ebp)  #lines = 0

	
	#File open
	movl $msg_main_FileName,(%esp)
	movl $msg_main_FileReadMode,4(%esp)
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

	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call fgetc

	movb %al,-21(%ebp)

	movb $-1,%bl

	cmpb %al,%bl
	jne label_ifcondition_false

	jmp label_exit_while_loop

label_ifcondition_false:
	addl $1,-8(%ebp)   #characterCount
	
	movb -21(%ebp),%al   #(common line)
	movb $' ',%bl        #(space)	
	movb $'\t',%cl       #(tab)
	movb $'\n',%dl       #(new line)
	
	#(space)	
	cmpb %bl,%al        #ascii = space (32)
	jne label_condition_if1_false		

	addl $1,-12(%ebp)   #SpaceCount

	jmp label_fp_ISNotEqual

label_condition_if1_false:
	
	#(tab)  
	cmpb %cl,%al        #ascii = tab(9)
	jne label_condition_if2_false		

	addl $1,-16(%ebp)   #tabs Count

	jmp label_fp_ISNotEqual

label_condition_if2_false:
	
	#(newline)  
	cmpb %dl,%al        #ascii = new line(10)
	jne label_condition_if3_false		

	addl $1,-20(%ebp)  #lines count

label_condition_if3_false:	
	jmp label_fp_ISNotEqual

label_exit_while_loop:

	movl -4(%ebp),%eax
	
	movl %eax,(%esp)
	call fclose

	#sanskar
	movl $0,-4(%ebp)

	movl -8(%ebp),%eax
	movl $msg_main_CharCount,(%esp)
	movl %eax,4(%esp)
	call printf		

	movl -12(%ebp),%eax
	movl $msg_main_SpaceCount,(%esp)
	movl %eax,4(%esp)
	call printf		

	movl -16(%ebp),%eax
	movl $msg_main_TabsCount,(%esp)
	movl %eax,4(%esp)
	call printf		

	movl -20(%ebp),%eax
	movl $msg_main_LinesCount,(%esp)
	movl %eax,4(%esp)
	call printf		

	movl $0,(%esp)
	call exit



	
