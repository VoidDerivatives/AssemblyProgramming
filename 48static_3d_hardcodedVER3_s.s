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

	#printf("arr[0][0][0]");
	movl $8,%eax
	movl $0,%ecx   #plane index
	mull %ecx
	movl %eax,%ebx   #for backup	

	movl $0,%ecx   #Row index
	movl $4,%eax
	mull %ecx

	addl %ebx,%eax  #back up

	addl $0,%eax 
	movl -96(%ebp,%eax,4),%ebx   #base address

	movl $msg_main_print,(%esp)
	movl %ebx,4(%esp)	
	call printf

	#printf("arr[1][0][2]");
	movl $8,%eax
	movl $1,%ecx   #plane index
	mull %ecx
	movl %eax,%ebx   #for backup	

	movl $0,%ecx   #Row index
	movl $4,%eax
	mull %ecx

	addl %ebx,%eax  #back up

	addl $2,%eax    #col 

	movl -96(%ebp,%eax,4),%ebx   #base address

	movl $msg_main_print,(%esp)
	movl %ebx,4(%esp)	
	call printf

	#printf("arr[0][1][3]");
	movl $8,%eax
	movl $0,%ecx   #plane index
	mull %ecx
	movl %eax,%ebx   #for backup	

	movl $1,%ecx   #Row index
	movl $4,%eax
	mull %ecx

	addl %ebx,%eax  #back up

	addl $3,%eax    #col 

	movl -96(%ebp,%eax,4),%ebx   #base address

	movl $msg_main_print,(%esp)
	movl %ebx,4(%esp)	
	call printf

	movl $0,(%esp)
	call exit




		
	
	



