.section .data
	.globl pptr
	.type pptr,@object
	.size pptr,4
	.align 4
	pptr:
		.int 0

.section .rodata
	msg_main_print1:
	.string "Enter value of n:\t"


	msg_main_scan1:
	.string "%d"

	msg_main_print2:
	.string "Memory allocation FAILED"

	msg_main_print3:
	.string "Enter %d value:\t"

	msg_main_print4:
	.string "Entered elements are:\n"

	msg_main_print5:
	.string "%d value is:\t%d\n"


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $8,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%ebx
	pushl %ebx
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	movl -4(%ebp),%eax   #imax
	#left shift
	sall $2,%eax   #imax*sizeof(int)   
	pushl %eax
	call malloc
	addl $4,%esp

	movl %eax,pptr #address allocated

	cmpl $0,%eax
	jne label_not_zero
	
	pushl $msg_main_print2
	call printf
	addl $4,%esp
	
	pushl $-1
	call exit

label_not_zero:	
	#for loop
	movl $0,-8(%ebp)
	jmp label_main_cond_for1	

label_cond_true_for1:
	pushl %eax    #icounter
	pushl $msg_main_print3
	call printf
	addl $8,%esp

	movl -8(%ebp),%eax   #icounter
	movl pptr,%edx	
	leal (%edx,%eax,4),%ecx
	pushl %ecx
	pushl $msg_main_scan1
	call scanf
	addl $8,%esp

	addl $1,-8(%ebp)

label_main_cond_for1:
	movl -4(%ebp),%edx  #imax
	movl -8(%ebp),%eax  #icounter
	cmpl %edx,%eax
	jl label_cond_true_for1

	# next for 2

	pushl $msg_main_print4
	call printf
	addl $4,%esp

	# for2
	
	movl $0,-8(%ebp)  #icounter
	jmp label_main_cond_for2
	
label_cond_true_for2:
	
	movl pptr,%ebx
	movl (%ebx,%eax,4),%ecx
	pushl %ecx
	pushl %eax
	pushl $msg_main_print5
	call printf
	addl $12,%esp
	
	addl $1,-8(%ebp)
	
label_main_cond_for2:
	movl -4(%ebp),%edx  #imax
	movl -8(%ebp),%eax  #icounter
	cmpl %edx,%eax
	jl label_cond_true_for2	

	movl pptr,%ebx
	pushl %ebx
	call free
	addl $4,%esp
	
	movl $0,pptr
	
	pushl $0
	call exit

	
