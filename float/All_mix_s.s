# fAns = ((43.65 / 22)*(76.34*3.1)) / ((12.43 * 6) - (140.2/94.21));
.section .rodata
	msg_main_print:
	.string "fAns = %f \t\n"

	int_data1:
	.int 22
	
	int_data2:
	.int 6

	float_data1:
	.float 43.65

	float_data2:
	.float 76.34

	float_data3:
	.float 3.1
	    
	float_data4:
	.float 12.43
	
	float_data5:
	.float 140.2
	
	float_data6:
	.float 94.21
	
.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $16,%esp

	flds float_data1   #43.65	
	fidivs int_data1   #43.65/22

	flds float_data2   #76.34
	fmul float_data3   #76.34 * 3.1		

	faddp %st(0),%st(1)

	###########st(0) = 469.54305
	flds float_data4
	fimul int_data2
	# st(0) = 74.56  st(1) = 469.54305

	flds float_data5
	fdiv float_data6

	# st(0) = 1.488164 st(1) = 74.56  st(2) = 469.54305
	fxch %st(1)   
	fsubp %st(0),%st(1)   #fsubr	
	
	#st(0) = 73.071835 st(1) = 469.54305
	
	fdivrp %st(0),%st(1)
	
	fstps -4(%ebp)	

	############################
	flds -4(%ebp)
	movl $msg_main_print,(%esp)
	fstpl 4(%esp)
	call printf


	movl $0,(%esp)
	call exit


