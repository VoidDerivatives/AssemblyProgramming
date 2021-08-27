.section .rodata
	msg_main_print1:	
	.string "argc is %d\n\n"

	msg_main_print2:
	.string "Invalid arguments:prog_name arg1 arg2"

	msg_main_print3:
	.string "Values are:"

	msg_main_print4:
	.string "Envp values are:"

	msg_main_print5:
	.string "\nSum is %d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp
	
	subl $16,%esp

	movl $0,-8(%ebp)

	movl 4(%ebp),%eax
	
	movl $msg_main_print1,(%esp)
	movl %eax,4(%esp)
	call printf
######################################3
	movl 4(%ebp),%eax
	cmpl $3,%eax
	je label_main_equal

	#puts("Invalid arguments:prog_name arg1 arg2");
	movl $msg_main_print2,(%esp)
	call puts 

	jmp label_goto

label_main_equal:
	movl $msg_main_print3,(%esp)
	call puts
	
	movl $0,-4(%ebp)
	jmp label_main_condition1
	
label_main_code1:	
	
	movl 8(%ebp,%ecx,4),%edx	
	
	movl %edx,(%esp)
	call puts	

	addl $1,-4(%ebp)

label_main_condition1:
	movl 4(%ebp),%eax  #argc
	movl -4(%ebp),%ecx  #icounter
	cmpl %eax,%ecx
	jl label_main_code1

	movl $msg_main_print4,(%esp)
	call printf

##########################
########### sum ##########
	#iSum = atoi(argv[1]) + atoi(argv[2]);
	movl 12(%ebp),%eax

	movl %eax,(%esp)
	call atoi 

	movl %eax,-8(%ebp)

	movl 16(%ebp),%eax

	movl %eax,(%esp)	
	call atoi

	addl %eax,-8(%ebp)

	movl -8(%ebp),%eax

	#printf("Sum is %d\n", iSum);
	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call printf

###############################################################3
label_goto:
	movl $msg_main_print4,(%esp)
	call puts		
	    
	movl 4(%ebp),%edx 	 #argc
	addl $1,%edx             #argc + 1
	movl $4,%eax          
	mull %edx

	leal 8(%ebp),%ebx
	addl %ebx,%eax 
	
	movl %eax,-12(%ebp)    #backup
	
	movl $0,-4(%ebp)	#counter
	jmp label_main_condition	

label_main_code:
		
	movl %eax,(%esp)
	call puts			
											
	addl $1,-4(%ebp)		
			
label_main_condition:	
	movl -4(%ebp),%ecx   #counter
	movl -12(%ebp),%edx   #envp[0]
	movl (%edx,%ecx,4),%eax

	cmpl $0,%eax
	jne label_main_code	

	movl -8(%ebp),%eax
	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	call printf

	movl $0,(%esp)
	call exit

