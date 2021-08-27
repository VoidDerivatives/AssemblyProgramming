.section .rodata
	msg_main_print1:
	.string "arr = %-10d \t *arr = %-10d \t &arr = %-10d\n"

	msg_main_print2:
	.string "p = %-10d \t *p = %-10d \t **p = %-10d\n"

	msg_main_print3:
	.string "ptr = %-10d \t *ptr = %-10d \t **ptr = %-10d\n"
	
	msg_main_print4:
	.string "ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	andl $-16,%esp

	subl $64,%esp

	#int arr[] = {10, 20, 30, 40, 50};
	movl $10,-20(%ebp)
	movl $20,-16(%ebp)
	movl $30,-12(%ebp)
	movl $40,-8(%ebp)
	movl $50,-4(%ebp)

	#int *p[] = {arr, arr + 1, arr + 2, arr + 3, arr + 4};
	leal -20(%ebp),%ebx
	movl %ebx,-40(%ebp)
	
	addl $4,%ebx
	movl %ebx,-36(%ebp)
	
	addl $4,%ebx
	movl %ebx,-32(%ebp)
	
	addl $4,%ebx
	movl %ebx,-28(%ebp)
	
	addl $4,%ebx
	movl %ebx,-24(%ebp)

	#int **ptr = p;
	leal -40(%ebp),%ebx
	movl %ebx,-44(%ebp)

	#printf("arr = %-10d \t *arr = %-10d \t &arr = %-10d\n", arr, *arr, &arr);
	leal -20(%ebp),%ebx
	movl (%ebx),%eax	

	movl $msg_main_print1,(%esp)
	movl %ebx,4(%esp)
	movl %eax,8(%esp)
	movl %ebx,12(%esp)
	call printf

	#printf("p = %-10d \t *p = %-10d \t **p = %-10d\n", p, *p, **p);
	leal -40(%ebp),%ebx
	movl (%ebx),%eax	
	movl (%eax),%ecx

	movl $msg_main_print2,(%esp)
	movl %ebx,4(%esp)
	movl %eax,8(%esp)
	movl %ecx,12(%esp)
	call printf

	#printf("ptr = %-10d \t *ptr = %-10d \t **ptr = %-10d\n", ptr, *ptr, **ptr);
	movl -44(%ebp),%eax
	movl (%eax),%ebx
	movl (%ebx),%ecx

	movl $msg_main_print3,(%esp)
	movl %eax,4(%esp)
	movl %ebx,8(%esp)	
	movl %ecx,12(%esp)
	call printf

	#*ptr++;
	addl $4,-44(%ebp)

	#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
	movl -44(%ebp),%eax
	leal -40(%ebp),%ebx
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx
	
	movl $msg_main_print4,(%esp)
	movl %eax,4(%esp)
			
	movl -44(%ebp),%eax
	movl (%eax),%eax
	leal -20(%ebp),%ebx	
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx

	movl %eax,8(%esp)
	
	movl -44(%ebp),%ebx
	movl (%ebx),%ebx
	movl (%ebx),%ebx
	
	movl %ebx,12(%esp)
	call printf

	#*++ptr;
	addl $4,-44(%ebp)
	
	#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
	movl -44(%ebp),%eax
	leal -40(%ebp),%ebx
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx
	
	movl $msg_main_print4,(%esp)
	movl %eax,4(%esp)
			
	movl -44(%ebp),%eax
	movl (%eax),%eax
	leal -20(%ebp),%ebx	
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx

	movl %eax,8(%esp)
	
	movl -44(%ebp),%ebx
	movl (%ebx),%ebx
	movl (%ebx),%ebx
	
	movl %ebx,12(%esp)
	call printf

	#++*ptr;
	movl -44(%ebp),%ebx
	movl (%ebx),%ebx
	addl $4,%ebx
	movl -44(%ebp),%eax
	movl %ebx,(%eax)
	
	#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);

	movl -44(%ebp),%eax
	leal -40(%ebp),%ebx
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx
	
	movl $msg_main_print4,(%esp)
	movl %eax,4(%esp)
			
	movl -44(%ebp),%eax
	movl (%eax),%eax
	leal -20(%ebp),%ebx	
	subl %ebx,%eax
	movl $4,%ecx
	xorl %edx,%edx
	divl %ecx

	movl %eax,8(%esp)
	
	movl -44(%ebp),%ebx
	movl (%ebx),%ebx
	movl (%ebx),%ebx
	
	movl %ebx,12(%esp)
	call printf

	movl $0,(%esp)
	call exit










	
