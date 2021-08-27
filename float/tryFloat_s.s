.section .data
	.globl fNo1
	.type fNo1,@object
	.size fNo1,4
	.align 4
	fNo1:
		.float 57.33

 	.globl dNo1
	.type dNo1,@object
	.size dNo1,8
	.align 4
	dNo1:
		.float 58963.546
.section .rodata
	msg_main_print1:
	.string "fNo1 = %f \t fNo2 = %f \n"

	msg_main_print2:
	.string "dNo1 = %lf \t dNo2 = %lf \n"

.section .bss
	.comm fNo2 , 4 ,4
	.comm dNo2 , 8 ,4

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $32,%esp

	finit
	############attemt 1##########
	#movl fNo1,%eax
	#movl fNo2,%edx
	#movl $msg_main_print1,(%esp)
	#movl %eax,4(%esp)
	#movl %edx,8(%esp)
	#call printf

	###########attemt 2###########
	#movl fNo1,%eax
	#movl fNo2,%edx
	#movl $msg_main_print1,(%esp)
	#movl %eax,4(%esp)
	#movl %edx,12(%esp)
	#call printf

	#attemt 3
	#float Instruction
	flds fNo2
	flds fNo1

	movl $msg_main_print1,(%esp)
	fstpl 4(%esp)      #fNo1
	fstpl 12(%esp)     #fNO2 
	call printf
	
	#double		
	flds dNo2
	flds dNo1

	movl $msg_main_print2,(%esp)
	fstpl 4(%esp)      #fNo1
	fstpl 12(%esp)     #fNO2 
	call printf

	#assgined
	#fNo2 = fNo1
	#dNo2 = dNo1
	
	flds fNo1
	flds dNo1
	fstp dNo2

	fstp fNo2

	#float
	flds fNo2
	flds fNo1
	
	movl $msg_main_print1,(%esp)
	fstpl 4(%esp)      #fNo1
	fstpl 12(%esp)     #fNO2 
	call printf

	#double
	flds dNo2
	flds dNo1
	movl $msg_main_print2,(%esp)
	fstpl 4(%esp)      #fNo1
	fstpl 12(%esp)     #fNO2 
	call printf
			
	movl $0,(%esp)
	call exit
