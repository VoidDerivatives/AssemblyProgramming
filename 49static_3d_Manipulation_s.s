.section .rodata
	msg_main_print1:
	.string "&arr = %d\n"
	
	msg_main_print2:
	.string "arr = %d\n"

	msg_main_print3:
	.string "arr[0] = %d\n"

	msg_main_print4:
	.string "arr[0][0] = %d\n"

	msg_main_print5:
	.string "arr[0][0][0] = %d\n"

	msg_main_print6:
	.string "arr[1] = %d\n"

	msg_main_print7:
	.string "arr[1][0] = %d\n"

	msg_main_print8:
	.string "arr[1][0][0] = %d\n"

	msg_main_print9:
	.string "arr[2] = %d\n"

	msg_main_print10:
	.string "arr[2][0] = %d\n"

	msg_main_print11:
	.string "arr[2][0][0] = %d\n"

	msg_main_print12:
	.string "&arr + 1 = %d\n"

	msg_main_print13:
	.string "arr + 1 = %d\n"

	msg_main_print14:
	.string "arr[0] + 1 = %d\n"

	msg_main_print15:
	.string "arr[0][0] + 1 = %d\n"

	msg_main_print16:
	.string "arr[0][0][0] + 1 = %d\n"

	msg_main_print17:
	.string "*arr = %d\n"

	msg_main_print18:
	.string "**arr = %d\n"

	msg_main_print19:
	.string "***arr = %d\n"

	msg_main_print20:
	.string "*(*(*(arr+0)+1)+2) = %d\n"

	msg_main_print21:
	.string "*(*(*(arr+1)+0)+1) = %d\n"


.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	
	andl $-16,%esp

	subl $112,%esp    #104
	
	movl $0,%eax   #zero out whole array
	movl $24,%ecx
	
label_loop:
	
	movl $0,-96(%ebp,%eax,4)
	
	addl $1,%eax
	loop label_loop

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
	
	#printf("&arr = %d\n", &arr);
	leal -96(%ebp),%ebx

	movl $msg_main_print1,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr = %d\n", arr);
	leal -96(%ebp),%ebx

	movl $msg_main_print1,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	#printf("arr[0] = %d\n", arr[0]);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx
	
	leal -96(%ebp),%ebx
	addl %eax,%ebx
	
	movl $msg_main_print3,(%esp)
	movl %ebx,4(%esp)
	call printf
		
	#printf("arr[0][0] = %d\n", arr[0][0]);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx     #row
	mull %ecx

	addl %eax,%ebx
	
	movl $msg_main_print4,(%esp)
	movl %ebx,4(%esp)
	call printf
		
	#printf("arr[0][0][0] = %d\n", arr[0][0][0]);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	movl $0,%ecx   #col index

	movl  (%ebx,%ecx,4),%ebx

	movl $msg_main_print5,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[1] = %d\n", arr[1]);
	movl $32,%eax
	movl $1,%ecx    #plane index
	mull %ecx
	
	leal -96(%ebp),%ebx
	addl %eax,%ebx
	
	movl $msg_main_print6,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[1][0] = %d\n", arr[1][0]);
	movl $32,%eax
	movl $1,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx     #row
	mull %ecx

	addl %eax,%ebx
	
	movl $msg_main_print7,(%esp)
	movl %ebx,4(%esp)
	call printf
		
	#printf("arr[1][0][0] = %d\n", arr[0][0][0]);
	movl $32,%eax
	movl $1,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	movl $0,%ecx   #col index

	movl  (%ebx,%ecx,4),%ebx

	movl $msg_main_print8,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[2] = %d\n", arr[2]);
	movl $32,%eax
	movl $2,%ecx    #plane index
	mull %ecx
	
	leal -96(%ebp),%ebx
	addl %eax,%ebx
	
	movl $msg_main_print9,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	#printf("arr[2][0] = %d\n", arr[2][0]);
	movl $32,%eax
	movl $2,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx     #row
	mull %ecx

	addl %eax,%ebx
	
	movl $msg_main_print10,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[2][0][0] = %d\n", arr[2][0]);
	movl $32,%eax
	movl $2,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	movl $0,%ecx   #col index

	movl  (%ebx,%ecx,4),%ebx

	movl $msg_main_print11,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	###########################################
	#printf("&arr + 1 = %d\n", &arr + 1);
	leal -96(%ebp),%ebx
	addl $96,%ebx

	movl $msg_main_print12,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	#printf("arr + 1 = %d\n", arr + 1);
	leal -96(%ebp),%ebx
	addl $32,%ebx
	
	movl $msg_main_print13,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[0] + 1 = %d\n", arr[0] + 1);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx
	
	leal -96(%ebp),%ebx
	addl %eax,%ebx

	addl $16,%ebx
	movl $msg_main_print14,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("arr[0][0] + 1 = %d\n", arr[0][0] + 1);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx     #row
	mull %ecx

	addl %eax,%ebx
	
	addl $4,%ebx
	
	movl $msg_main_print14,(%esp)
	movl %ebx,4(%esp)
	call printf
	
	#printf("arr[0][0][0] + 1 = %d\n", arr[0][0][0] + 1);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	movl $0,%ecx   #col index

	movl  (%ebx,%ecx,4),%ebx

	addl $1,%ebx
	movl $msg_main_print14,(%esp)
	movl %ebx,4(%esp)
	call printf
	############################
	#printf("*arr = %d\n", *arr);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx
	
	leal -96(%ebp),%ebx
	addl %eax,%ebx
	
	movl $msg_main_print17,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("**arr = %d\n", **arr);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx     #row
	mull %ecx

	addl %eax,%ebx
	
	movl $msg_main_print18,(%esp)
	movl %ebx,4(%esp)
	call printf
		
	#printf("***arr = %d\n", ***arr);
	movl $32,%eax
	movl $0,%ecx    #plane index
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #row index
	mull %ecx
	
	addl %eax,%ebx
	movl $0,%ecx   #col index

	movl  (%ebx,%ecx,4),%ebx

	movl $msg_main_print19,(%esp)
	movl %ebx,4(%esp)
	call printf

	####################
	#printf("*(*(*(arr+0)+1)+2) = %d\n", *(*(*(arr+0)+1)+2));
	movl $32,%eax
	movl $0,%ecx   #0*2d add
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $1,%ecx   #1*1D addre
	mull %ecx
		
	addl %eax,%ebx

	movl $2,%ecx

	movl (%ebx,%ecx,4),%ebx

	movl $msg_main_print20,(%esp)
	movl %ebx,4(%esp)
	call printf

	#printf("*(*(*(arr+1)+0)+1) = %d\n", *(*(*(arr+1)+0)+1));
	movl $32,%eax
	movl $1,%ecx   #0*2d add
	mull %ecx

	leal -96(%ebp),%ebx
	addl %eax,%ebx

	movl $16,%eax
	movl $0,%ecx   #1*1D addre
	mull %ecx
		
	addl %eax,%ebx

	movl $1,%ecx

	movl (%ebx,%ecx,4),%ebx

	movl $msg_main_print21,(%esp)
	movl %ebx,4(%esp)
	call printf



	movl $0,(%esp)
	call exit

	
	 
						







