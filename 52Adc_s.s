	#little enden
.section .rodata
	#%qd = 8 byte chi najar
	msg_main_print:
	.string "Answers is : \t%qd\n"
	
.section .data
	.globl g_ino1
	.type g_ino1,@object
	.size g_ino1,4
	.align 8
	g_ino1:
		.quad 4294967300   

	.globl g_ino2
	.type g_ino2,@object
	.size g_ino2,4
	.align 8
	g_ino2:
		.quad 100    

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp

	#1 number 2 register madhe takla 
	movl g_ino1,%eax
	movl g_ino1+4,%edx
	
	movl g_ino2,%ecx   
	movl g_ino2+4,%ebx	

	addl %eax,%ecx
	adcl %edx,%ebx

	movl $msg_main_print,(%esp)
	movl %ecx,4(%esp) #LOWER   Little enden
	movl %ebx,8(%esp) #HIGHER   
	call printf	

	movl $0,(%esp)
	call exit
