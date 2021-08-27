	.file	"CprogramAllmix.c"
	.section	.rodata
.LC1:
	.string	"Answer is :%f"

.section .text
.globl	main
.type	main, @function
main:
.LFB2:
	pushl	%ebp
	movl	%esp, %ebp
	andl $-16,%esp
	
	subl	$20, %esp
	flds	.LC0
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC1
	call	printf
	addl	$16, %esp
	subl	$12, %esp
	pushl	$0
	call	exit
	
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1087213960
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
