.equ MAX1,5
.equ MAX2,50
.section .rodata
	msg_main_print1:
	.string "Enter value of planes, rows & columns(< %d, %d, %d):\t"

	msg_main_scan1:
	.string "%d%d%d"

	msg_main_print2:
	.string "Enter [%d][%d][%d] value:\t\n"

	msg_main_scan2:
	.string "%d"

	msg_main_print3:
	.string "Entered elements are:\n"

	msg_main_print4:
	.string "[%d][%d][%d] value is:\t%d\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $50048,%esp   #50044

	#printf
	movl $msg_main_print1,(%esp)
	movl $MAX1,4(%esp)
	movl $MAX2,8(%esp)
	movl $MAX2,12(%esp)
	call printf

	#scanf
	leal -4(%ebp),%eax   #plane  
	leal -8(%ebp),%ebx   #row
	leal -12(%ebp),%ecx  #col

	movl $msg_main_scan1,(%esp) 
	movl %eax,4(%esp)   #plane
	movl %ebx,8(%esp)   #row
	movl %ecx,12(%esp)  #col
	call scanf 

	#for1
	movl $0,-16(%ebp)
	jmp label_condition_main_for1		

label_code_main_for1:

	movl $0,-20(%ebp)
	jmp label_condition_main_for2

label_code_main_for2:
	movl $0,-24(%ebp)
	jmp label_condition_main_for3	

label_code_main_for3:
	
	#printf
	movl -16(%ebp),%ebx
	movl -20(%ebp),%ecx
	
	movl $msg_main_print2,(%esp)	
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	movl %eax,12(%esp)
	call printf
	
	#scanf
	movl -12(%ebp),%eax   #no of col
	movl $4,%ecx          #size of int
	mull %ecx
	#eax  => size of 1D
	
	movl -8(%ebp),%ecx   #no of row
	mull %ecx     
	#eax => size of 2D

	movl -16(%ebp),%ecx   #counter 1
	mull %ecx
	
	leal -50024(%ebp),%ebx   #base address
	addl %eax,%ebx
	#ebx =>  2D cha base addree
	
	#parta kadhych
	movl -12(%ebp),%eax   #no of col
	movl $4,%ecx          #size of int
	mull %ecx
	#eax  => size of 1D
	
	movl -20(%ebp),%ecx   #counter 2
	mull %ecx
	#eax => 1d

	addl %eax,%ebx
	#ebx => proper 1D chya base la 

	movl -24(%ebp),%ecx  #counter 3    
	leal (%ebx,%ecx,4),%ebx

	#pushing
	movl $msg_main_scan2,(%esp)
	movl %ebx,4(%esp)
	call scanf

	#increment for3

	addl $1,-24(%ebp)

label_condition_main_for3:
	movl -24(%ebp),%eax #counter3
	movl -12(%ebp),%edx  #col
	cmpl %edx,%eax
	jl label_code_main_for3

	#increment for2
	addl $1,-20(%ebp)

label_condition_main_for2:
	movl -20(%ebp),%eax  #counter2
	movl -8(%ebp),%edx  #row
	cmpl %edx,%eax 
	jl label_code_main_for2

	#increment for1
	addl $1,-16(%ebp)

label_condition_main_for1:
	movl -16(%ebp),%eax  #counter1
	movl -4(%ebp),%edx   #palne
	cmpl %edx,%eax	
	jl label_code_main_for1


	#DISPLAY
	movl $msg_main_print3,(%esp)
	call printf

	#for4
	movl $0,-16(%ebp)
	jmp label_condition_main_for4		

label_code_main_for4:

	movl $0,-20(%ebp)
	jmp label_condition_main_for5

label_code_main_for5:
	movl $0,-24(%ebp)
	jmp label_condition_main_for6	

label_code_main_for6:
	
	#printf
	movl -12(%ebp),%eax   #no of col
	movl $4,%ecx          #size of int
	mull %ecx
	#eax  => size of 1D
	
	movl -8(%ebp),%ecx   #no of row
	mull %ecx     
	#eax => size of 2D

	movl -16(%ebp),%ecx   #counter 1
	mull %ecx
	
	leal -50024(%ebp),%ebx   #base address
	addl %eax,%ebx
	#ebx =>  2D cha base addree
	
	#parta kadhych
	movl -12(%ebp),%eax   #no of col
	movl $4,%ecx          #size of int
	mull %ecx
	#eax  => size of 1D
	
	movl -20(%ebp),%ecx   #counter 2
	mull %ecx
	#eax => 1d

	addl %eax,%ebx
	#ebx => proper 1D chya base la 

	movl -24(%ebp),%ecx  #counter 3    
	movl (%ebx,%ecx,4),%ebx

	movl -16(%ebp),%eax  #counter 1
	movl -20(%ebp),%edx  #counter 2
	movl -24(%ebp),%ecx  #counter 3

	movl $msg_main_print4,(%esp)
	movl %eax,4(%esp)
	movl %edx,8(%esp)
	movl %ecx,12(%esp)
	movL %ebx,16(%esp)
	call printf	

	#increment for6

	addl $1,-24(%ebp)

label_condition_main_for6:
	movl -24(%ebp),%eax #counter3
	movl -12(%ebp),%edx  #col
	cmpl %edx,%eax
	jl label_code_main_for6

	#increment for5
	addl $1,-20(%ebp)

label_condition_main_for5:
	movl -20(%ebp),%eax  #counter2
	movl -8(%ebp),%edx  #row
	cmpl %edx,%eax 
	jl label_code_main_for5

	#increment for4
	addl $1,-16(%ebp)

label_condition_main_for4:
	movl -16(%ebp),%eax  #counter1
	movl -4(%ebp),%edx   #palne
	cmpl %edx,%eax	
	jl label_code_main_for4	
	

	movl $0,(%esp)
	call exit

	


