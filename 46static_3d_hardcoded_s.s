.section .rodata
	msg_main_print:
	.string "%d \n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $104,%esp

	leal -96(%ebp),%ebx
	
	movl $10,(%ebx)
	movl $20,4(%ebx)
	movl $30,8(%ebx)
	movl $40,12(%ebx)
	movl $50,16(%ebx)
	movl $60,20(%ebx)
	movl $70,24(%ebx)
	movl $80,28(%ebx)
	movl $90,32(%ebx)
	movl $0,36(%ebx)
	movl $0,40(%ebx)
	movl $0,44(%ebx)
	movl $0,48(%ebx)
	movl $0,52(%ebx)
	movl $0,56(%ebx)
	movl $0,60(%ebx)
	movl $0,64(%ebx)
	movl $0,68(%ebx)
	movl $0,72(%ebx)
	movl $0,76(%ebx)
	movl $0,80(%ebx)
	movl $0,84(%ebx)
	movl $0,88(%ebx)
	movl $0,92(%ebx)
	movl $0,96(%ebx)

	#printf arr[0][0][0]
	movl $4,%eax  # no of col
	movl $4,%ecx  # int
	mull %ecx
	#size of 1D

	movl $2,%ecx
	mull %ecx     
	#size of 2d
	#eax  size of 2d
	
	movl $0,%ecx   #plane index
	mull %ecx
	#eax => 0

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $4,%eax  # no of col
	movl $4,%ecx  # int
	mull %ecx
	#size of 1D		
	
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	
	movl $0,%ecx   #col index

	movl (%ebx,%ecx,4),%ebx


	movl $msg_main_print,(%esp)
	movl %ebx,4(%esp) 
	call printf


	#printf("%d",arr[1][0][2]	
	movl $4,%eax  # no of col
	movl $4,%ecx  # int
	mull %ecx
	#size of 1D

	movl $2,%ecx
	mull %ecx     
	#size of 2d
	#eax  size of 2d
	
	movl $1,%ecx   #plane index
	mull %ecx
	#eax => 0

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $4,%eax  # no of col
	movl $4,%ecx  # int
	mull %ecx
	#size of 1D		
	
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	
	movl $2,%ecx   #col index

	movl (%ebx,%ecx,4),%ebx


	movl $msg_main_print,(%esp)
	movl %ebx,4(%esp) 
	call printf

	movl $0,(%esp)
	call exit


