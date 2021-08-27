.section .rodata
	msg_main_FileName:
	.string "student_structure_from_file_to_screen.txt"

	msg_main_ReadFileMode:
	.string "r"

	msg_main_FileError:
	.string "\n Cant open File \n"

	msg_main_Filescanning:
	.string "%s %d %f"

	msg_main_FilePrinting:
	.string "%s %d %f \n"
	

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $64,%esp

	movl $0,-4(%ebp) #fp = NULL
	
	#fileopen
	movl $msg_main_FileName,(%esp)
	movl $msg_main_ReadFileMode,4(%esp)
	call fopen

	movl %eax,-4(%ebp)

	cmpl $0,%eax
	jne label_Not_Equal

	movl $msg_main_FileError,(%esp)
	call printf

	movl $-1,(%esp)

	call exit	
			
label_Not_Equal:

	jmp label_while_condition
	
label_while_code:		
	#leal -53(%ebp),%ebx (optimise)
	movl -13(%ebp),%edx
	#float
	flds -9(%ebp)

	movl $msg_main_FilePrinting,(%esp)
	movl %ebx,4(%esp)
	movl %edx,8(%esp)	
	fstpl  12(%esp)
	call printf

label_while_condition:

	movl -4(%ebp),%eax	#fp	
	leal -53(%ebp),%ebx     #name
	leal -13(%ebp),%ecx     #roll no    
	leal -9(%ebp),%edx      #float

	movl %eax,(%esp)
	movl $msg_main_Filescanning,4(%esp)
	movl %ebx,8(%esp)	
	movl %ecx,12(%esp)
	movl %edx,16(%esp)
	call fscanf
	
	cmpl $-1,%eax
	jne label_while_code
	
	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call fclose

	movl $0,-4(%ebp)

	movl $0,(%esp)
	call exit



	

