.section .rodata
	msg_main_print1:
	.string "Enter value of planes, rows & columns:\t"

	msg_main_scan1:
	.string "%d%d%d"

	msg_main_print2:
	.string "Memory allocation FAILED"

	msg_main_print3:
	.string "Enter [%d][%d][%d] value:\t"

	msg_main_scan2:
	.string "%d"

	msg_main_print4:
	.string "Entered elements are:\n"

	msg_main_print5:
	.string "[%d][%d][%d] value is:\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $48,%esp   #48

	movl $msg_main_print1,(%esp)
	call printf

	#scanf
	leal -4(%ebp),%eax  #plane
	leal -8(%ebp),%ebx  #row
	leal -12(%ebp),%ecx #col
	
	movl $msg_main_scan1,(%esp)
	movl %eax,4(%esp)  #plane
	movl %ebx,8(%esp)  #row
	movl %ecx,12(%esp) #col
	call scanf

	#pppPtr = (int ***) malloc (iPlanes * sizeof(int **));
	
	movl -4(%ebp),%eax  #planes
	movl $4,%ecx        #sizeof pointer
	mull %ecx          #eax => plane * pointer
	
	movl %eax,(%esp)
	call malloc

	movl %eax,-28(%ebp)  
	
	#if(NULL == pppPtr)
	cmpl $0,%eax	
	je  label_main_failure1	
		
	#for(iCounter1 = 0; iCounter1 < iPlanes; iCounter1++)
	
	movl $0,-16(%ebp)
	jmp label_main_condition_for1

label_main_code_for1:

	movl -8(%ebp),%eax  #row
	movl $4,%ecx
	mull %ecx
	
	movl %eax,(%esp)
	call malloc

	movl -28(%ebp),%ebx  
	movl -16(%ebp),%ecx
	#leal (%ebx,%ecx,4),%ebx
	
	movl %eax,(%ebx,%ecx,4)

	#movl %eax,(%ebx)
	
	cmpl $0,%eax
	je label_main_failure2	
	
	#for(iCounter2 = 0; iCounter2 < iRows; iCounter2++)

	movl $0,-20(%ebp)
	jmp label_main_condition_for3	

label_main_code_for3:
	#pppPtr[iCounter1][iCounter2] = (int *) malloc (iColumns * sizeof(int));
	movl -12(%ebp),%eax  #columns
	movl $4,%ecx
	mull %ecx

	movl %eax,(%esp)
	call malloc

	movl -28(%ebp),%ebx
	movl -16(%ebp),%ecx #counter1
	
	movl (%ebx,%ecx,4),%ebx	
	
	movl -20(%ebp),%ecx  #counter2
	#leal (%ebx,%ecx,4),%ebx

	movl %eax,(%ebx,%ecx,4)

	#movl %eax,(%ebx)  

	cmpl $0,%eax
	je label_main_failure3

	#for4  counter3
	movl $0,-24(%ebp)
	jmp label_main_condition_for4

label_main_code_for4:
	
	#printf
	movl -16(%ebp),%ebx
	movl -20(%ebp),%ecx

	movl $msg_main_print3,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	movl %eax,12(%esp)
	call printf

	#scanf
	movl -28(%ebp),%ebx  #pppptr
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx  #counter2
	
	movl (%ebx,%ecx,4),%ebx
	
	movl -24(%ebp),%ecx   #counter3
	
	leal (%ebx,%ecx,4),%ebx

	movl $msg_main_scan2,(%esp)
	movl %ebx,4(%esp)
	call scanf

	#increment for4
	addl $1,-24(%ebp)

label_main_condition_for4:
	movl -24(%ebp),%eax  #counter3
	movl -12(%ebp),%edx  #coln
	cmpl %edx,%eax
	jl label_main_code_for4
	
	#increment for3
	addl $1,-20(%ebp)


label_main_condition_for3:
	movl -20(%ebp),%eax  #counter2
	movl -8(%ebp),%edx   #row 
	cmpl %edx,%eax
	jl label_main_code_for3

	#increment for1
	addl $1,-16(%ebp)

label_main_condition_for1:
	movl -4(%ebp),%edx  #plane
	movl -16(%ebp),%eax  #counter1
	cmpl %edx,%eax
	jl label_main_code_for1	

	############DISPLAY###########	

	movl $msg_main_print4,(%esp)
	call printf

	#for(iCounter1 = 0; iCounter1 < iPlanes; iCounter1++)
	
	movl $0,-16(%ebp)
	jmp label_main_condition_for5

label_main_code_for5:	
	
	#for(iCounter2 = 0; iCounter2 < iRows; iCounter2++)

	movl $0,-20(%ebp)
	jmp label_main_condition_for6	

label_main_code_for6:

	#for4  counter3
	movl $0,-24(%ebp)
	jmp label_main_condition_for7

label_main_code_for7:
	
	#printf
	movl -28(%ebp),%ebx  #pppptr
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx  #counter2
	
	movl (%ebx,%ecx,4),%ebx
	
	movl -24(%ebp),%ecx   #counter3
	
	movl (%ebx,%ecx,4),%ebx

	movl -16(%ebp),%eax  #counter1
	movl -20(%ebp),%ecx  #counter2
	movl -24(%ebp),%edx  #counter3

	movl $msg_main_print5,(%esp)
	movl %eax,4(%esp)
	movl %ecx,8(%esp)
	movl %edx,12(%esp)
	movl %ebx,16(%esp)
	call printf

	#increment for7
	addl $1,-24(%ebp)

label_main_condition_for7:
	movl -24(%ebp),%eax  #counter3
	movl -12(%ebp),%edx  #coln
	cmpl %edx,%eax
	jl label_main_code_for7
	
	#increment for6
	addl $1,-20(%ebp)

label_main_condition_for6:
	movl -20(%ebp),%eax  #counter2
	movl -8(%ebp),%edx   #row 
	cmpl %edx,%eax
	jl label_main_code_for6

	#increment for5
	addl $1,-16(%ebp)

label_main_condition_for5:
	movl -4(%ebp),%edx  #plane
	movl -16(%ebp),%eax  #counter1
	cmpl %edx,%eax
	jl label_main_code_for5	

    ####free memory#####
	#for 9
	movl $0,-16(%ebp)
	jmp label_main_condition_for9

label_main_code_for9:
	movl $0,-20(%ebp)
	jmp label_main_condition_for10

label_main_code_for10:
		
	#free(pppPtr[iCounter1][iCounter2]);				 
	#pppPtr[iCounter1][iCounter2] = NULL;
	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx
	movl (%ebx,%ecx,4),%ebx
	
	movl %ebx,(%esp)
	call free

	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx
	leal (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)

	#increment 
	addl $1,-20(%ebp)
	
label_main_condition_for10:
	movl -20(%ebp),%eax  #counter2
	movl -8(%ebp),%edx   #row
	cmpl %edx,%eax
	jl label_main_code_for10

	#free(pppPtr[iCounter1]);
	movl -28(%ebp),%ebx
	movl  -16(%ebp),%ecx

	movl (%ebx,%ecx,4),%ebx
	
	movl %ebx,(%esp)
	call free

	#pppPtr[iCounter1] = NULL;
	movl -28(%ebp),%ebx
	movl  -16(%ebp),%ecx

	movl (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)

	#increment for 9
	addl $1,-16(%ebp)	

label_main_condition_for9:
	movl -16(%ebp),%eax  #counter1
	movl -4(%ebp),%edx
	cmpl %edx,%eax
	jl label_main_code_for9

	#free(pppPtr);
	movl -28(%ebp),%ebx
	movl %ebx,(%esp)
	call free

	#pppPtr = NULL;
	movl $0,-28(%ebp)
	
	movl $0,(%esp)
	call exit	
		
	#####failure##############
label_main_failure1:
		
	movl $msg_main_print2,(%esp)
	call puts

	movl $-1,(%esp)
	call exit						
				
label_main_failure2:
	
	movl $msg_main_print2,(%esp)
	call puts
 								
	#while code
	jmp label_main_condition_while	

jmp_main_code_while:
	subl $1,%eax
	movl %eax,-16(%ebp)	

	#for loop 
	movl $0,-20(%ebp)
	jmp label_main_condition_for2	

label_main_code_for2:

	#free(pppPtr[iCounter1][iCounter2]);				 
	#pppPtr[iCounter1][iCounter2] = NULL;
	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx
	movl (%ebx,%ecx,4),%ebx
	
	movl %ebx,(%esp)
	call free

	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #counter1

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx   #counter2
	leal (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)
	 
	addl $1,-20(%ebp)

label_main_condition_for2:
	movl -20(%ebp),%eax
	movl -8(%ebp),%edx
	cmpl %edx,%eax
	jl  label_main_code_for2

	#free(pppPtr[iCounter1]);
	movl -24(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl %ebx,(%esp)
	call free

	#pppPtr[iCounter1] = NULL;
	movl -24(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	leal (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)

label_main_condition_while:
	movl -16(%ebp),%eax
	cmpl $0,%eax
	jne jmp_main_code_while

	movl -24(%ebp),%ebx
	
	movl %ebx,(%esp)
	call free
	
	movl $0, -24(%ebp)

	movl $-1,(%esp)
	call exit

label_main_failure3:

	movl $msg_main_print2,(%esp)
	call puts

	#while loop
	jmp label_main_condition_while2

label_main_code_while2:
	subl $1,%eax
	movl %eax,-20(%ebp)

	movl -28(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl %ebx,(%esp)
	call free
	
	movl -28(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl -20(%ebp),%ecx
	movl (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)

label_main_condition_while2:
	movl -20(%ebp),%eax
	cmpl $0,%eax
	jne label_main_code_while2
	
	#free(pppPtr[iCounter1]);
	movl -28(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl %ebx,(%esp)
	call free

	#pppPtr[iCounter1] = NULL;
	movl -28(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl $0,(%ebx)

	#while code
	jmp label_main_condition_while3	

jmp_main_code_while3:
	subl $1,%eax
	movl %eax,-16(%ebp)	

	#for loop 
	movl $0,-20(%ebp)
	jmp label_main_condition_for8	

label_main_code_for8:

	#free(pppPtr[iCounter1][iCounter2]);				 
	#pppPtr[iCounter1][iCounter2] = NULL;
	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #row

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx
	movl (%ebx,%ecx,4),%ebx
	
	movl %ebx,(%esp)
	call free

	movl -28(%ebp),%ebx  #pppptr	 
	movl -16(%ebp),%ecx  #row

	movl (%ebx,%ecx,4),%ebx
	
	movl -20(%ebp),%ecx
	leal (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)
	 
	addl $1,-20(%ebp)

label_main_condition_for8:
	movl -20(%ebp),%eax
	movl -8(%ebp),%edx
	cmpl %edx,%eax
	jl  label_main_code_for8

	#free(pppPtr[iCounter1]);
	movl -24(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	movl (%ebx,%ecx,4),%ebx

	movl %ebx,(%esp)
	call free

	#pppPtr[iCounter1] = NULL;
	movl -24(%ebp),%ebx
	movl -16(%ebp),%ecx
	
	leal (%ebx,%ecx,4),%ebx
	
	movl $0,(%ebx)

label_main_condition_while3:
	movl -16(%ebp),%eax
	cmpl $0,%eax
	jne jmp_main_code_while3

	movl -28(%ebp),%ebx
	
	movl %ebx,(%esp)
	call free
	
	movl $0, -28(%ebp)

	movl $-1,(%esp)
	call exit



			
