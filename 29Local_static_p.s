.section .data

	.type ino1,@object
	.size ino1,4
	.align 4
	ino1:
	.int 10

.section .rodata
	msg_fun_print:
	.string "ino1 = %d \t ino2 = %d \n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	movl $0,-4(%ebp)

	jmp main_cond

main_for:	
	call fun
	addl $1,-4(%ebp)

main_cond:
	movl -4(%ebp),%eax
	#movl $3,%edx
	cmpl $3,%eax
	jl main_for
	
	pushl $0
	call exit


.globl fun
.type fun,@function
fun:  
	pushl %ebp
	movl %esp,%ebp

	subl $4,%esp

	movl $10,-4(%ebp)
	
	#movl ino1,%eax
	#addl $1,%eax
	#movl %eax,ino1

	addl $1,ino1
	addl $1,-4(%ebp)

	#movl -4(%ebp),%eax
	#addl $1,%eax
	#movl %eax,-4(%ebp)

	movl ino1,%edx
	movl -4(%ebp),%eax
	pushl %eax
	pushl %edx
	pushl $msg_fun_print
	call printf
	addl $12,%esp

	movl %ebp,%esp
	popl %ebp
	ret
