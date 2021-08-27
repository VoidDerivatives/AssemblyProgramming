.section .rodata
	msg_main_print1:
	.string "argc is %d\n\n"
	
	msg_main_print2:
	.string "Invalid arguments:prog_name arg1 arg2"

	msg_main_print3:
	.string "Values are:"

	msg_main_print4:
	.string "\n"

	msg_main_print5:
	.string "Sum is %d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp
	
	###printf("argc is %d\n\n", argc);
	movl 4(%ebp),%eax
	
	movl $msg_main_print1,(%esp)
	movl %eax,4(%esp)
	call printf

	#if(argc != 3)
	movl 4(%ebp),%eax
	cmpl $3,%eax
	je label_main_equal

	#puts("Invalid arguments:prog_name arg1 arg2");
	movl $msg_main_print2,(%esp)
	call puts 

	#exit(-1);
	movl $-1,(%esp)
	call exit

label_main_equal:
	movl $msg_main_print3,(%esp)
	call puts
	
	movl $0,-4(%ebp)
	jmp label_main_condition
	
label_main_code:	
	
	movl 8(%ebp,%ecx,4),%edx	
	
	movl %edx,(%esp)
	call puts	

	addl $1,-4(%ebp)

label_main_condition:
	movl 4(%ebp),%eax  #argc
	movl -4(%ebp),%ecx  #icounter
	cmpl %eax,%ecx
	jl label_main_code

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

	movl $0,(%esp)
	call exit

