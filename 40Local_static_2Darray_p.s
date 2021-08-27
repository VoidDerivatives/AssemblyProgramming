.equ MAX,50
.section .rodata
	msg_main_print1:
	.string "Enter value of rows & columns(< %d):\t"

	msg_main_scan1:
	.string "%d%d"

	msg_main_print2:
	.string  "Enter [%d][%d] value:\t"
  
	msg_main_scan2:
	.string "%d"

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
	
	subl $10016,%esp

	#printf("Enter value of rows & columns(< %d):\t", MAX);
	pushl $MAX 
	pushl $msg_main_print1
	call printf
	addl $8,%esp

	#scanf("%d%d", &iRows, &iColumns);
	leal -4(%ebp),%eax
	leal -8(%ebp),%ebx
	pushl %ebx
	pushl %eax
	pushl $msg_main_scan1
	call scanf
	addl $12,%esp

	#for(iCounter1 = 0; iCounter1 < iRows; iCounter1++)
	
	movl $0,-12(%ebp)
	jmp label_main_condition_for1

label_main_code_for1:

	#for(iCounter2 = 0; iCounter2 < iColumns; iCounter2++)
	movl $0,-16(%ebp)
	jmp label_main_condition_for2

label_main_code_for2:

	#printf("Enter [%d][%d] value:\t", iCounter1, iCounter2);
	movl -12(%ebp),%edx
	pushl %eax
	pushl %edx
	pushl $msg_main_print2
	call printf
	addl $12,%esp

	#scanf("%d", &arr[iCounter1][iCounter2]);	
	movl -8(%ebp),%eax
	movl $4,%ecx
	mull %ecx   #col * sizeof(datatype)

	movl -12(%ebp),%ecx
	mull %ecx     #ROWIndex * 1d size
	
	leal -10016(%ebp),%ebx  #baseaddress
	addl %eax,%ebx         

	movl -16(%ebp),%ecx  		
	leal (%ebx,%ecx,4),%ebx

	pushl %ebx
	pushl $msg_main_scan2
	call scanf
	addl $8,%esp

	#increment for 2
	addl $1,-16(%ebp)

label_main_condition_for2:
	movl -8(%ebp),%edx
	movl -16(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for2

	
	#increment for1
	addl $1,-12(%ebp)

label_main_condition_for1:
	movl -4(%ebp),%edx
	movl -12(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for1

	###DISPLAY###
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

	#printf("[%d][%d] value is:\t%d\n", iCounter1, iCounter2, arr[iCounter1][iCounter2]);	
	movl -8(%ebp),%eax
	movl $4,%ecx
	mull %ecx   #col * sizeof(datatype)

	movl -12(%ebp),%ecx
	mull %ecx     #ROWIndex * 1d size

	leal -10016(%ebp),%ebx  #baseaddress
	addl %eax,%ebx         
  		
	movl -16(%ebp),%ecx

	movl (%ebx,%ecx,4),%ebx
	movl -12(%ebp),%edx
	movl -16(%ebp),%eax

	pushl %ebx
	pushl %eax
	pushl %edx
	pushl $msg_main_print4
	call printf
	addl $8,%esp

	#increment for 2
	addl $1,-16(%ebp)

label_main_condition_for4:
	movl -8(%ebp),%edx
	movl -16(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for4

	#increment for1
	addl $1,-12(%ebp)

label_main_condition_for3:
	movl -4(%ebp),%edx
	movl -12(%ebp),%eax
	cmpl %edx,%eax
	jl label_main_code_for3
	
	pushl $0
	call exit
