.section .rodata
	msg_main_print1:
	.string "Enter value of rows & columns:\t"

	msg_main_scan1:
	.string "%d%d"

	msg_main_print2:
	.string "Enter [%d][%d] value:\t"

	msg_main_scan2:
	.string "%d"

	msg_main_puts:
	.string "Memory allocation FAILED"

	msg_main_print:
	.string "%d \t %d \n\n"

	msg_main_print3:
	.string "Entered elements are:\n"
	
	msg_main_print4:
	.string "[%d][%d] value is:\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp

	subl $20,%esp

	pushl $msg_main_print1
	call printf
	addl $4,%esp

	leal -4(%ebp),%eax
	leal -8(%ebp),%ebx
	pushl %ebx
	pushl %eax
	pushl $msg_main_scan1
	call scanf
	addl $12,%esp

	#ppPtr = (int **) malloc (iRows * sizeof(int *));
	movl -4(%ebp),%eax
	movl $4,%ecx
	mull %ecx
	
	pushl %eax
	call malloc 
	addl $4,%esp

	movl %eax,-20(%ebp)

	cmpl $0,%eax
	je label_main_failure

	#for(iCounter1 = 0; iCounter1 < iRows; iCounter1++)
	
	movl $0,-12(%ebp)
	jmp label_main_condition_for1

label_main_code_for1:

	movl -8(%ebp),%eax
	movl $4,%ecx
	mull %ecx
	
	pushl %eax
	call malloc
	addl $4,%esp
	
		
	movl -20(%ebp),%ebx
	movl -12(%ebp),%edx
	leal (%ebx,%edx,4),%ebx		
	
	movl %eax,(%ebx)

	cmpl $0,%eax
	je label_main_failure1
	
	#for(iCounter2 = 0; iCounter2 < iColumns; iCounter2++)
		
	movl $0,-16(%ebp)
	jmp label_main_condition_for2

label_main_code_for2:
	
	movl -12(%ebp),%edx
	pushl %eax
	pushl %edx
	pushl $msg_main_print2
	call printf
	addl $12,%esp
	
	movl -20(%ebp),%ebx
	movl -12(%ebp),%eax
	movl (%ebx,%eax,4),%ebx
		
	movl -16(%ebp),%eax
	leal (%ebx,%eax,4),%ebx

	pushl %ebx
	pushl $msg_main_scan2
	call scanf
	addl $8,%esp

	#increment 
	addl $1,-16(%ebp)

label_main_condition_for2:
	movl -8(%ebp),%edx
	movl -16(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for2		

        #increment
	addl $1,-12(%ebp)

label_main_condition_for1:
	movl -4(%ebp),%edx
	movl -12(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for1	

	#####Display#####

	pushl $msg_main_print3
	call printf
	addl $4,%esp

	#for(iCounter1 = 0; iCounter1 < iRows; iCounter1++)
	
	movl $0,-12(%ebp)
	jmp label_main_condition_for3

label_main_code_for3:

	#for(iCounter2 = 0; iCounter2 < iColumns; iCounter2++)
		
	movl $0,-16(%ebp)
	jmp label_main_condition_for4

label_main_code_for4:
	
	movl -20(%ebp),%ebx
	movl -12(%ebp),%eax
	movl (%ebx,%eax,4),%ebx
		
	movl -16(%ebp),%eax
	movl (%ebx,%eax,4),%ebx

	movl -12(%ebp),%eax
	movl -16(%ebp),%edx
	pushl %ebx
	pushl %edx
	pushl %eax
	pushl $msg_main_print4
	call printf
	addl $16,%esp

	#increment 
	addl $1,-16(%ebp)

label_main_condition_for4:
	movl -8(%ebp),%edx
	movl -16(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for4		

        #increment
	addl $1,-12(%ebp)

label_main_condition_for3:
	movl -4(%ebp),%edx
	movl -12(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for3	

	####free####
	movl $0,-12(%ebp)
	jmp label_main_condition_for5

label_main_code_for5:

	#free(ppPtr[iCounter1]);

	movl -20(%ebp),%ebx
	movl (%ebx,%eax,4),%ebx

	pushl %ebx
	call free
	addl $4,%esp

	#ppPtr[iCounter1] = NULL;
	movl -12(%ebp),%eax
	movl -20(%ebp),%ebx
	leal (%ebx,%eax,4),%ebx
	
	movl $0,(%ebx)
	
	addl $1,-12(%ebp)

label_main_condition_for5:
	movl -4(%ebp),%edx
	movl -12(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for5

	#free(ppPtr);
	movl -20(%ebp),%ebx
	pushl %ebx
	call free
	addl $4,%esp

	#ppPtr = NULL;
	movl $0,-20(%ebp)

	pushl $0
	call exit

label_main_failure:

	pushl $msg_main_puts
	call puts
	addl $4,%esp

	pushl -1
	call exit

label_main_failure1:
	pushl $msg_main_puts
	call puts
	addl $4,%esp

	#while loop
	jmp label_condition_fail

label_code:
	
	subl $1,%eax
	movl %eax,-12(%ebp)
	
	movl -20(%ebp),%ebx
	movl (%ebx,%eax,4),%ebx
	pushl %ebx
	call free
	addl $4,%esp
	
	#ppPtr[iCounter1] = NULL;
	movl -12(%ebp),%eax
	movl -20(%ebp),%ebx
	leal (%ebx,%eax,4),%ebx
	
label_condition_fail:
	movl -12(%ebp),%eax
	cmpl $0,%eax
	jne label_code	
	
	pushl -20(%ebp)
	call free
	addl $4,%esp

	movl $0,-12(%ebp)

	pushl -1
	call exit
	
