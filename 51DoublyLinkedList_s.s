.section .rodata
	msg_main_print1:
	.string "\n1.Insert \n2.Delete\n3.search\n4.Count\n5.Reverse Display\n6.Exit\n"
	
	msg_main_print2:
	.string "Enter your choice:\t"

	msg_main_scan1:
	.string "%d"

	msg_main_print3:
	.string "\n1.InsertFirst\n2.InsertLast\n3.InsertAtPosition\n4.Back\n"

	msg_main_print4:
	.string "Enter your choice again:\t"

	msg_main_print5:
	.string "Enter valid choice\n"
	
	msg_main_print6:
	.string "Enter data to be insert:\t"
	
	msg_main_print7:
	.string "memory allocation FAILED\n"

	msg_main_print8:
	.string "\nLinked list is:\n"

	msg_main_print9:
	.string "Empty\n"

	msg_main_print10:
	.string "<-|%d|->"
	
	msg_main_print11:
	.string "\n"

	msg_main_print12:
	.string "Enter the position: \t"

	msg_main_print13:
	.string "Position is invalid\n"
	
	msg_main_print14:
	.string "Total node present : %d\n"

	msg_main_print15:
	.string "Linked List Empty, Deletion impossible.\n"

	msg_main_print16:
	.string "\n1.DeleteFirst\n2.DeleteLast\n3.DeleteAtPosition\n4.Back\n"

	msg_main_print17:
	.string "Enter your choice again:\t"

	msg_main_print18:
	.string "Deleted Data is %d\n"

	msg_main_print19:
	.string "Linked List Empty, searching impossible.\n"

	msg_main_print20:
	.string "\n1.SearchFirstOccurance\n2.SearchLastOccurance\n3.SearchAllOccurance\n4.Back\n"

	msg_main_print21:
	.string "Enter data to be search:\t"

	msg_main_print22:
	.string "Linked List Empty\n"
	
	msg_main_print23:
	.string "Data not found\n"

	msg_main_print24:
	.string "Data found at %d position\n"

	msg_main_print25:
	.string "Data found %d times\n"
	
	msg_main_print26:
	.string "Bye...\n"
	
	msg_main_print27:
	.string "\nReverse Linked List is :\n"

.section .text
.globl main
.type main,@function
main:
	pushl %ebp
	movl %esp,%ebp
	andl $-16,%esp

	subl $48,%esp

	movl $0,-16(%ebp)
	movl $0,-20(%ebp)

label_big_while:	
	movl $msg_main_print1,(%esp)
	call printf

	movl $msg_main_print2,(%esp)
	call printf

	leal -12(%ebp),%ebx
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf
	
	movl -12(%ebp),%eax
	cmpl $1,%eax	
	je label_main_insert_case1

	cmpl $2,%eax
	je label_main_Delete_case2

	cmpl $3,%eax
	je label_main_search_case3

	cmpl $4,%eax
	je label_main_count_case4

	cmpl $5,%eax
	je label_main_reverseDisplay_case5

	cmpl $6,%eax
	je label_main_exit_case6

	jmp lable_main_default
###########################################
label_main_insert_case1:

	movl $msg_main_print3,(%esp)
	call printf
	
	movl $msg_main_print4,(%esp)
	call printf

	leal -12(%ebp),%ebx
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	#if(chioce == 4)
	movl -12(%ebp),%eax
	cmpl $4,%eax
	je label_insert_break

	cmpl $0,%eax
	jle label_main_cond_true
			
	cmpl $3,%eax
	jg label_main_cond_true
	
	jmp label_main_cond_false
	
label_main_cond_true:
	movl $msg_main_print5,(%esp)
	call printf
	
	jmp label_main_insert_case1	

label_main_cond_false:

	movl $msg_main_print6,(%esp)
	call printf
	
	leal -4(%ebp),%ebx
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	movl -12(%ebp),%eax
	cmpl $1,%eax
	je label_main_InsertFirst_case1

	cmpl $2,%eax
	je label_main_InsertLast_case2

	cmpl $3,%eax
	je label_main_InsertAtPosition_case3

######insertfirst###########
label_main_InsertFirst_case1:
	leal -16(%ebp),%eax    #pfisrt
	leal -20(%ebp),%ebx    #plast
	movl -4(%ebp),%ecx     #ino

	#InsertFirst(&pFirst,&pLast,ino)		
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call InsertFirst

	jmp label_insert_break_display

########insertlast##########
label_main_InsertLast_case2:

	leal -16(%ebp),%eax    #pfisrt
	leal -20(%ebp),%ebx    #plast
	movl -4(%ebp),%ecx     #ino

	#InsertLast(&pFirst,&pLast,ino)		
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call InsertLast

	jmp label_insert_break_display

########insertAtposition############
label_main_InsertAtPosition_case3:
	movl $msg_main_print12,(%esp)
	call printf

	leal -8(%ebp),%ebx
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	leal -16(%ebp),%eax    #pfirst
	leal -20(%ebp),%ebx    #plast
	movl -4(%ebp),%ecx     #ino
	movl -8(%ebp),%edx     #ipos
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	movl %edx,12(%esp)
	call InsertAtPosition

#######display########
label_insert_break_display:
	#display function
	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display

	jmp label_main_insert_case1

label_insert_break:
	jmp label_big_while

############Delete##############################

label_main_Delete_case2:
	movl -16(%ebp),%eax
	cmpl $0,%eax
	jne label_main_delete_while 
	
	movl $msg_main_print15,(%esp)
	call printf

	jmp label_delete_break


label_main_delete_while:
	#while

	movl $msg_main_print16,(%esp)
	call printf
	
	movl $msg_main_print17,(%esp)
	call printf

	leal -12(%ebp),%ebx   #choice
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	#choice == 4
	movl -12(%ebp),%eax
	cmpl $4,%eax
	je label_delete_break

	#switch
	movl -12(%ebp),%eax
	cmpl $1,%eax
	je label_deleteFirst

	cmpl $2,%eax
	je label_deleteLast

	cmpl $3,%eax
	je label_deleteAtPosition

	jmp label_delete_default

##########deletefisrt############
label_deleteFirst:
	leal -16(%ebp),%eax
	leal -20(%ebp),%ebx

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call DeleteFirst	

	movl %eax,-4(%ebp)
	
	jmp label_if_condition

##########deleteLast#############
label_deleteLast:
	leal -16(%ebp),%eax
	leal -20(%ebp),%ebx

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call DeleteLast

	movl %eax,-4(%ebp)

	jmp label_if_condition

############deleteAtPosition#######
label_deleteAtPosition:
	movl $msg_main_print12,(%esp)
	call printf
	
	leal -8(%ebp),%ebx   #pos
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	leal -16(%ebp),%eax
	leal -20(%ebp),%ebx
	movl -8(%ebp),%ecx

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call DeleteAtPosition

	movl %eax,-4(%ebp)
	
	jmp label_if_condition

#########delete Default#########
label_delete_default:
	movl $msg_main_print5,(%esp)
	call printf
	
	movl $4,-12(%ebp)  #choice = 4

label_if_condition:
	movl -4(%ebp),%eax   #ino
	cmpl $-1,%eax
	jne  label_delele_if1_false 
		
	movl $msg_main_print8,(%esp)
	call printf

	jmp label_delele_if2_false

label_delele_if1_false:
	#if(ichoice != 4 && ino != -2)
	movl -12(%ebp),%eax   #choice
	cmpl $4,%eax
	je label_delele_if2_false

	movl -4(%ebp),%eax   #ino
	cmpl $-2,%eax 
	je label_delele_if2_false 

	movl $msg_main_print18,(%esp)
	movl %eax,4(%esp)
	call printf

	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display

label_delele_if2_false:
	jmp label_main_delete_while

label_delete_break:
	jmp label_big_while

#################Search#########################
label_main_search_case3:
	movl -16(%ebp),%eax
	cmpl $0,%eax
	jne label_while_search 	
	
	movl $msg_main_print19,(%esp)
	call printf

	jmp label_search_end
	
label_while_search:
	movl $msg_main_print20,(%esp)
	call printf

	movl $msg_main_print17,(%esp)
	call printf
	
	leal -12(%ebp),%ebx   #choice
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)
	call scanf

	#choice == 4
	movl -12(%ebp),%eax
	cmpl $4,%eax
	je label_search_end
	
	#choice <= 0 || ichoice > 3	
	cmpl $0,%eax
	jle label_main_search_if2_true
			
	cmpl $3,%eax
	jg label_main_search_if2_true
	
	jmp label_main_search_if2_false
	
label_main_search_if2_true:
	movl $msg_main_print5,(%esp)
	call printf
	
	jmp label_while_search	

label_main_search_if2_false:
	movl -16(%ebp),%eax   #pfirst
	movl -20(%ebp),%ebx   #plast
		
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display	
	
	movl $msg_main_print21,(%esp)
	call printf
		
	leal -4(%ebp),%ebx
	movl $msg_main_scan1,(%esp)
	movl %ebx,4(%esp)	
	call scanf
		
	#switch
	movl -12(%ebp),%eax   #choice 
	cmpl $1,%eax
	je label_searchFirstOccurance

	cmpl $2,%eax
	je   label_searchLastOccurance

	cmpl $3,%eax
	je label_searchAllOccurance

####case1########
label_searchFirstOccurance:
	
	movl -16(%ebp),%eax   #first
	movl -20(%ebp),%ebx   #last
	movl -4(%ebp),%ecx    #ino

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call SearchFirstOccurance

	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	jne  label_main_search_if3_false
	
	movl $msg_main_print22,(%esp)
	call printf
	
	jmp  label_searchfirst_case1_end 

label_main_search_if3_false:
	cmpl $-2,%eax
	jne label_main_search_if4_false	

	movl $msg_main_print23,(%esp)
	call printf
	
	jmp label_searchfirst_case1_end 
	
label_main_search_if4_false:	
	movl $msg_main_print24,(%esp)
	movl %eax,4(%esp)
	call printf	

label_searchfirst_case1_end:

	jmp label_while_search
 

######case2##############
label_searchLastOccurance:
	movl -16(%ebp),%eax   #first
	movl -20(%ebp),%ebx   #last
	movl -4(%ebp),%ecx    #ino

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call SearchLastOccurance

	movl %eax,-4(%ebp)
	
	cmpl $-1,%eax
	jne  label_main_search_if5_false
	
	movl $msg_main_print22,(%esp)
	call printf
	
	jmp  label_searchLast_case2_end 

label_main_search_if5_false:
	cmpl $-2,%eax
	jne label_main_search_if6_false	

	movl $msg_main_print23,(%esp)
	call printf
	
	jmp label_searchLast_case2_end 
	
label_main_search_if6_false:	
	movl $msg_main_print24,(%esp)
	movl %eax,4(%esp)
	call printf	

label_searchLast_case2_end:

	jmp label_while_search 

#########case3###########
label_searchAllOccurance:

	movl -16(%ebp),%eax   #first
	movl -20(%ebp),%ebx   #last
	movl -4(%ebp),%ecx    #ino

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call SearchAllOccurance

	movl %eax,-4(%ebp)
	
	movl $msg_main_print25,(%esp)
	movl %eax,4(%esp)
	call printf

	jmp label_while_search 
label_search_end:
	jmp label_big_while

############count###########
label_main_count_case4:
	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display

	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call CountNode
	
	movl %eax,-4(%ebp)
	
	movl $msg_main_print14,(%esp)
	movl %eax,4(%esp)
	call printf 

	jmp label_big_while

############reverse Display########
label_main_reverseDisplay_case5:
	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display

	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call ReverseDisplay

	jmp label_big_while

label_main_exit_case6:
	movl -16(%ebp),%eax
	movl -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call Display

	movl -16(%ebp),%eax
	cmpl $0,%eax
	je label_main_end
	
	leal -16(%ebp),%eax
	leal -20(%ebp),%ebx
	
	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call DeleteAllNodes
			
label_main_end:
	movl $msg_main_print26,(%esp)
	call printf
		
	movl $0,(%esp)
	call exit

lable_main_default:
	movl $msg_main_print5,(%esp)
	call printf

	jmp label_big_while

###############################################
##############InsertFirst###################### 
.globl InsertFirst
.type InsertFirst,@function
InsertFirst:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $0,-4(%ebp)   #newnode = NULL

	movl $12,(%esp)
	call malloc

	movl %eax,-4(%ebp)
	
	cmpl $0,%eax
	je label_Failure	
	
	#pNewnode->iDAta = ino
	movl -4(%ebp),%ebx   #pnewnode
	movl 16(%ebp),%eax   #ino
	movl %eax,4(%ebx)
	
	#if(NULL == *ppHead)
	movl 8(%ebp),%eax  #pphead
	movl (%eax),%eax   #*pphead
	cmpl $0,%eax
	jne label_InsertFirst_cond_false
	
	#*pphead = pnewnode
	movl -4(%ebp),%eax  #newnode
	movl 8(%ebp),%ebx   #pphead	
	movl %eax,(%ebx)
   
	#*pptail = pnewnode
	movl 12(%ebp),%ebx  #pptail
	movl %eax,(%ebx)   
	
	#(*pptail)->pNext = *ppHead
	movl (%ebx),%ebx    #*pptail
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	movl %eax,8(%ebx)    

	#(*ppHead)->prev = *ppTail
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail
	movl %ebx,(%eax)   
	
	jmp Insert_end
	
label_InsertFirst_cond_false:
	#pNewnode->pNext = *ppHead
	movl -4(%ebp),%eax  #newnode
	movl 8(%ebp),%ebx   #pphead
	movl (%ebx),%ebx    #*pphead
	movl %ebx,8(%eax)    

	#(*ppHead)->pprev = pNewnode
	movl %eax,(%ebx)
	
	#*pphead = pNewnode
	movl 8(%ebp),%ebx  #pphead 
	movl %eax,(%ebx)
	
	#(*pptail)->pNext = *pphead
	movl 12(%ebp),%eax   #pptail
	movl (%eax),%eax     #*pptail
	movl (%ebx),%ebx     #*pphead
	movl %ebx,8(%eax)    

	#(*ppHead)->Pprev = *ppTail	 
	movl %eax,(%ebx)     

Insert_end:		
	movl %ebp,%esp
	popl %ebp 

	ret
#######################################
##########insert Last #################

.globl InsertLast
.type InsertLast,@function
InsertLast:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $0,-4(%ebp)

	movl $12,(%esp)
	call malloc

	movl %eax,-4(%ebp)
	
	cmpl $0,%eax
	je label_Failure	
	
	#pNewnode->iDAta = ino
	movl -4(%ebp),%ebx   #pnewnode
	movl 16(%ebp),%eax   #ino
	movl %eax,4(%ebx)

	#if(NULL == *ppHead)
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	cmpl $0,%eax
	jne label_InsertLast_cond_false
	
	#inititally empty
	#*pphead = pnewnode
	movl -4(%ebp),%eax  #newnode
	movl 8(%ebp),%ebx   #pphead	
	movl %eax,(%ebx)
   
	#*pptail = pnewnode
	movl 12(%ebp),%ebx  #pptail
	movl %eax,(%ebx)   
	
	#(*pptail)->pNext = *ppHead
	movl (%ebx),%ebx    #*pptail
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	movl %eax,8(%ebx)    

	#(*ppHead)->prev = *ppTail
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail
	movl %ebx,(%eax)   
	
	jmp InsertLast_end
	
label_InsertLast_cond_false:
	
	#*pptail -> pnext = pnewnode
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail  
	movl -4(%ebp),%eax  #pnewnode
	movl %eax,8(%ebx)

	#pnewnode -> prev = *pptail
	movl %ebx,(%eax)

	#*pptail = pnewnode
	movl 12(%ebp),%ebx   #pptail 
	movl %eax,(%ebx)

	#(*pptail)->pnext = *pphead
	movl (%ebx),%ebx     #*pptail
	movl 8(%ebp),%eax    #pphead  
	movl (%eax),%eax     #*pphead
	movl %eax,8(%ebx)

	#(*pphead)->pprev = *pptail
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx    #*pptail
 	movl %ebx,(%eax)  

InsertLast_end:
	movl %ebp,%esp
	popl %ebp
	
	ret	
####################################
############InsertAtPosition########
.globl InsertAtPosition
.type InsertAtPosition,@function
InsertAtPosition:
	pushl %ebp
	movl %esp,%ebp

	subl $32,%esp
	
	#parameters
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call CountNode

	movl %eax,-12(%ebp)
	
	#checking position
	#if(ipos<= 0 || ipos > icount +1)
	movl 20(%ebp),%eax    #ipos
	cmpl $0,%eax
	jle label_pos1_condition_true
	
	movl -12(%ebp),%ebx   #count
	addl $1,%ebx          #count+1
	cmpl %ebx,%eax
	jg  label_pos1_condition_true
	
	jmp label_pos1_condition_false

label_pos1_condition_true:
	movl $msg_main_print13,(%esp)
	call printf

	jmp label_InsertAtPosition_end

label_pos1_condition_false:    
	cmpl $1,%eax   #1 == pos
	jne label_pos2_cond_false
	
	#insertFisrt call         #first pos
	movl 8(%ebp),%eax   #pphead
	movl 12(%ebp),%ebx  #pptail
	movl 16(%ebp),%ecx  #ino

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call InsertFirst	

	jmp label_InsertAtPosition_end

label_pos2_cond_false:
	cmpl %ebx,%eax   #count+1 == pos
	jne  label_pos3_cond_false
	
	#insertLast call     #last pos
	movl 8(%ebp),%eax   #pphead
	movl 12(%ebp),%ebx  #pptail
	movl 16(%ebp),%ecx  #ino

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	movl %ecx,8(%esp)
	call InsertLast

	jmp label_InsertAtPosition_end

label_pos3_cond_false:
	#middle position

	movl 8(%ebp),%ebx   #pphead
	movl (%ebx),%ebx    #*pphead
	movl %ebx,-8(%ebp)  #ptemp = *pphead
	
	#icount =1
	movl $1,-12(%ebp)

	#while(icount<ipos-1)
	jmp label_while_condition_InsertAtPos

label_while_code_InsertAtPos:
	
	addl $1,%eax
	movl %eax,-12(%ebp)   #count++

	#ptemp = ptemp -> pnext
	movl -8(%ebp),%ebx   #ptemp	
	movl 8(%ebx),%ebx
	movl %ebx,-8(%ebp)

label_while_condition_InsertAtPos:
	movl -12(%ebp),%eax   #icount
	movl 20(%ebp),%ebx
	subl $1,%ebx          #pos - 1
	cmpl %ebx,%eax
	jl  label_while_code_InsertAtPos	

	#pnewnode = memory
	movl $12,(%esp)
	call malloc
	
	movl %eax,-4(%ebp)

	cmpl $0,%eax
	je  label_Failure

	#newnode -> data =no
	movl -4(%ebp),%eax   #newnode
	movl 16(%ebp),%ebx   #ino
	movl %ebx,4(%eax) 

	#pnewnode -> next = ptemp -> pnext
	movl -8(%ebp),%ebx    #ptemp
	movl 8(%ebx),%ebx
	movl %ebx,8(%eax)   

	#ptemp->pnext->pprev = pnewnode
	movl %eax,(%ebx)	

	#ptemp->next = pnewnode
	movl -8(%ebp),%ebx  #ptemp
	movl %eax,8(%ebx)

	#pnewnode-> prev = ptemp
	movl -4(%ebp),%eax   #newnode
	movl %ebx,(%eax)	

label_InsertAtPosition_end:

	movl %ebp,%esp
	popl %ebp
	
	ret
##############################################
###########DeleteFirst#######################
.globl DeleteFirst
.type DeleteFirst,@function
DeleteFirst:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp
	
	movl $-1,-4(%ebp)
	
	#null == *pphead
	movl 8(%ebp),%ebx  #pphead
	movl (%ebx),%ebx   #*pphead
	cmpl $0,%ebx
	je  label_deletefirst_end

	#deledata = (*pphead)-> idata
	movl 4(%ebx),%ebx
	movl %ebx,-4(%ebp)
	
	#if(*pphead == *pptail)
	movl 8(%ebp),%ebx   #pphead
	movl (%ebx),%ebx    #*pphead
	movl 12(%ebp),%eax  #pptail
	movl (%eax),%eax    #*pptail
	cmpl %eax,%ebx
	jne label_deletefirst_if_false

	#(*pphead)-> pNext = NULL
	movl $0,8(%ebx)   

	#(*pphead)-> prev = NULL
	movl $0,(%ebx) 
	
	#free(*pphead)
	movl %ebx,(%esp)
	call free

	#*pphead = NULL
	movl 8(%ebp),%ebx   #pphead
	movl $0,(%ebx)

	#*pptail = NULL
	movl 12(%ebp),%ebx   #pptail
	movl $0,(%ebx)

	jmp label_deletefirst_end

label_deletefirst_if_false:

	#*pphead = (*pphead)-> pnext
	movl 8(%ebp),%ebx  #pphead
	movl (%ebx),%ebx   #*pphead	
	movl 8(%ebx),%ebx
	movl 8(%ebp),%eax  #pphead
	movl %ebx,(%eax)

	#(*pptail)->pnext->pnext = NULL	
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx   #*pptail
	movl 8(%ebx),%ebx  
	movl $0,8(%ebx)

	#(*pptail)->pnext->pprev = NULL	
	movl $0,(%ebx)

	#free((*ptail) -> next)
	movl 12(%ebp),%ebx    #ptail
	movl (%ebx),%ebx      #*ptail
	movl 8(%ebx),%ebx

	movl %ebx,(%esp)
	call free

	#(*pptail)->pNext = *pphead
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx     #*pptail
	movl 8(%ebp),%eax    #pphead
	movl (%eax),%eax     #*pphead
	movl %eax,8(%ebx)

	#(*ppHead)->Pprev = *ppTail 
	movl %ebx,(%eax)     

label_deletefirst_end:
	movl -4(%ebp),%eax

	movl %ebp,%esp	
	popl %ebp

	ret

#############################################
#############Delete Last################
.globl DeleteLast
.type DeleteLast,@function
DeleteLast:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp
	
	movl $-1,-4(%ebp)
	
	#null == *pphead
	movl 8(%ebp),%ebx  #pphead
	movl (%ebx),%ebx   #*pphead
	cmpl $0,%ebx
	je  label_deletelast_end

	#deledata = (*pptail)-> idata
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx    #*pptail
	movl 4(%ebx),%ebx
	movl %ebx,-4(%ebp)
	
	#if(*pphead == *pptail)
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail
	cmpl %eax,%ebx
	jne label_deletelast_if_false

	#(*pphead)-> pNext = NULL
	movl 8(%ebp),%ebx  #pphead
	movl (%ebx),%ebx   #*pphead
	movl $0,8(%ebx)   

	#(*pphead)-> prev = NULL
	movl $0,(%ebx) 
	
	#free(*pphead)
	movl %ebx,(%esp)
	call free

	#*pphead = NULL
	movl 8(%ebp),%ebx   #pphead
	movl $0,(%ebx)

	#*pptail = NULL
	movl 12(%ebp),%ebx   #pptail
	movl $0,(%ebx)

	jmp label_deletelast_end

label_deletelast_if_false:
	#*pptail = (*pptail) -> pprev
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx   #*pptail
	movl (%ebx),%ebx   #prev	
	movl 12(%ebp),%eax  #pptail
	movl %ebx,(%eax)

	#(*pphead)->pprev->pnext = NULL	
	movl 8(%ebp),%ebx  #pphead
	movl (%ebx),%ebx   #*pphead
	movl (%ebx),%ebx  
	movl $0,8(%ebx)

	#(*pphead)->prev->pprev = NULL	
	movl $0,(%ebx)

	#free((*pphead) -> prev)
	movl 8(%ebp),%ebx     #pphead
	movl (%ebx),%ebx      #*pphead
	movl (%ebx),%ebx

	
movl %ebx,(%esp)
	call free


	#(*pptail)->pNext = *pphead
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx     #*pptail
	movl 8(%ebp),%eax    #pphead
	movl (%eax),%eax     #*pphead
	movl %eax,8(%ebx)

	#(*ppHead)->Pprev = *ppTail
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx     #*pptail	 
	movl %ebx,(%eax)     

label_deletelast_end:
	movl -4(%ebp),%eax

	movl %ebp,%esp	
	popl %ebp

	ret


########################################
###########DeleteAtPosition##############
.globl DeleteAtPosition
.type DeleteAtPosition,@function
DeleteAtPosition:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	#ptemp = NULL
	movl $0,-4(%ebp)

	#countnode
	movl 8(%ebp),%eax   #pphead
	movl (%eax),%eax    #*pphead
	movl 12(%ebp),%ebx  #pptail
	movl (%ebx),%ebx    #*pptail

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call CountNode	 

	movl %eax,-8(%ebp)    #count

	movl 16(%ebp),%eax  #pos
	cmpl $0,%eax
	jle label_DeleteAtPosition_if1_true

	movl -8(%ebp),%ebx #count
	cmpl %ebx,%eax
	jg label_DeleteAtPosition_if1_true

	jmp label_DeleteAtPosition_if1_false
	
label_DeleteAtPosition_if1_true:

	movl $msg_main_print13,(%esp)
	call printf

	movl $-2,-8(%ebp)
	jmp label_DeleteAtPosition_end

label_DeleteAtPosition_if1_false:
	movl 16(%ebp),%eax
	cmpl $1,%eax
	jne label_DeleteAtPosition_if2_false

	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call DeleteFirst
	
	movl %eax,-8(%ebp)

	jmp label_DeleteAtPosition_end

label_DeleteAtPosition_if2_false:
	movl -8(%ebp),%eax
	movl 16(%ebp),%ebx
	cmpl %eax,%ebx
	jne label_DeleteAtPosition_if3_false
	
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx

	movl %eax,(%esp)
	movl %ebx,4(%esp)
	call DeleteLast
	
	movl %eax,-8(%ebp)
		
	jmp label_DeleteAtPosition_end

label_DeleteAtPosition_if3_false:
	###Middle Position
	movl 8(%ebp),%eax
	movl (%eax),%eax

	movl %eax,-4(%ebp)

	movl $1,-8(%ebp)
	jmp label_DeleteAtPosition_while_cond

label_DeleteAtPosition_while_code:
	addl $1,-8(%ebp)
	
	movl -4(%ebp),%eax   #temp
	movl 8(%eax),%eax
	movl %eax,-4(%ebp)

label_DeleteAtPosition_while_cond:

	movl -8(%ebp),%eax  #icount
	movl 16(%ebp),%ebx  #pos
	cmpl %ebx,%eax
	jl label_DeleteAtPosition_while_code	

	#ptemp->prev->next = ptemp->pnext
	movl -4(%ebp),%eax   #temp
	movl 8(%eax),%eax    #ptemp->next
	movl -4(%ebp),%ebx   #temp
	movl (%ebx),%ebx     #temp->prev
	movl %eax,8(%ebx)

	#ptemp->next->prev = ptemp->prev
	movl -4(%ebp),%eax
	movl 8(%eax),%eax
	movl %ebx,(%eax)

	#ptemp -> next = NULL
	movl -4(%ebp),%eax
	movl $0,8(%eax)

	#ptemp -> prev = NULL
	movl -4(%ebp),%eax
	movl $0,(%eax)

	movl -4(%ebp),%eax
	movl 4(%eax),%eax
	movl %eax,-8(%ebp)

	movl -4(%ebp),%eax
	movl %eax,(%esp)
	call free

label_DeleteAtPosition_end:
	movl -8(%ebp),%eax	

	movl %ebp,%esp
	popl %ebp
	
	ret

#####################################
###########SearchFirstOccurance##############
.globl SearchFirstOccurance
.type SearchFirstOccurance,@function
SearchFirstOccurance:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

	movl $-1,-4(%ebp)
	
	#null ==  phead
	movl 8(%ebp),%eax   #phead
	cmpl $0,%eax
	je label_search_first_end
	
	#pos = 1
	movl $1,-4(%ebp)	
	
label_searchfirst_while:
	#do
	#if(head -> data == key)
	movl 16(%ebp),%eax  #key
	movl 8(%ebp),%ebx   #phead
	movl 4(%ebx),%ebx
	cmpl %eax,%ebx
	je label_searchfirst_loop_break

	#pos++
	addl $1,-4(%ebp)
 	
	#phead = phead -> next
	movl 8(%ebp),%eax
	movl 8(%eax),%eax
	movl %eax,8(%ebp)

	#while condition
	movl 8(%ebp),%ebx   #phead
	movl 12(%ebp),%eax  #ptail
	movl 8(%eax),%eax
	
	cmpl %ebx,%eax
	jne label_searchfirst_while   

label_searchfirst_loop_break:
	#if(phead == ptail -> next  && ipos != 1)
	movl 12(%ebp),%ebx   #ptail
	movl 8(%ebx),%ebx
	movl 8(%ebp),%eax   #phead
	cmpl %eax,%ebx
	jne label_search_first_end

	movl -4(%ebp),%eax
	cmpl $1,%eax
	je label_search_first_end		

	movl $-2,-4(%ebp)

label_search_first_end:
	movl -4(%ebp),%eax

	movl %ebp,%esp
	popl %ebp	
	
	ret
#####################################
##########SearchLastOccurance##############
.globl SearchLastOccurance
.type SearchLastOccurance,@function
SearchLastOccurance:
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

	movl $-1,-8(%ebp)
	
	#null ==  phead
	movl 8(%ebp),%eax   #phead
	cmpl $0,%eax
	je label_search_Last_end
	
	#pos = 1
	movl $1,-4(%ebp)	
	
	#iLast = 0
	movl $0,-8(%ebp)

label_searchLast_while:
	#do
	#if(phead -> data == key)
	movl 16(%ebp),%eax  #key
	movl 8(%ebp),%ebx   #phead
	movl 4(%ebx),%ebx
	cmpl %eax,%ebx
	jne label_searchLast_if1_false
	
	movl -4(%ebp),%eax
	movl %eax,-8(%ebp)

label_searchLast_if1_false:
	#pos++
	addl $1,-4(%ebp)
 	
	#phead = phead -> next
	movl 8(%ebp),%eax
	movl 8(%eax),%eax
	movl %eax,8(%ebp)

	#while condition
	movl 8(%ebp),%ebx   #phead
	movl 12(%ebp),%eax  #ptail
	movl 8(%eax),%eax
	
	cmpl %ebx,%eax
	jne label_searchLast_while   

	#if(0 == last)
	movl -8(%ebp),%eax
	cmpl $0,%eax
	jne label_search_Last_end

	movl $-2,-8(%ebp)	

label_search_Last_end:
	movl -8(%ebp),%eax

	movl %ebp,%esp
	popl %ebp	
	
	ret

#####################################
########SearchAllOccurance###########
.globl SearchAllOccurance
.type SearchAllOccurance,@function
SearchAllOccurance:
	
	pushl %ebp
	movl %esp,%ebp
	
	subl $16,%esp

	movl $0,-4(%ebp)
	
	#null ==  phead
	movl 8(%ebp),%eax   #phead
	cmpl $0,%eax
	je label_search_all_end
	
label_search_all_while:
	#do
	#if(phead -> data == key)
	movl 16(%ebp),%eax  #key
	movl 8(%ebp),%ebx   #phead
	movl 4(%ebx),%ebx
	cmpl %eax,%ebx
	jne label_searchAll_if1_false
	
	addl $1,-4(%ebp)

label_searchAll_if1_false:
	#phead = phead -> next
	movl 8(%ebp),%eax
	movl 8(%eax),%eax
	movl %eax,8(%ebp)

	#while condition
	movl 8(%ebp),%ebx   #phead
	movl 12(%ebp),%eax  #ptail
	movl 8(%eax),%eax
	
	cmpl %ebx,%eax
	jne label_search_all_while   

label_search_all_end:
	movl -4(%ebp),%eax

	movl %ebp,%esp
	popl %ebp	
	
	ret

####################################
############CountNode#############
.globl CountNode
.type CountNode,@function
CountNode:
	pushl %ebp
	movl %esp,%ebp	

	subl $16,%esp

	movl $0,-4(%ebp)

	movl 8(%ebp),%eax   #phead
	cmpl $0,%eax
	je label_count_cond_false

label_count_while_true:
	#do
	addl $1,-4(%ebp)

	movl 8(%ebp),%eax
	movl 8(%eax),%eax
	movl %eax,8(%ebp)

	#while condition
	movl 8(%ebp),%ebx   #phead
	movl 12(%ebp),%eax  #ptail
	movl 8(%eax),%eax   

	cmpl %eax,%ebx
	jne  label_count_while_true

label_count_cond_false:
	movl -4(%ebp),%eax

	movl %ebp,%esp
	popl %ebp
	
	ret
##############################
############ReverseDisplay#######
.globl ReverseDisplay
.type ReverseDisplay,@function
ReverseDisplay:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $msg_main_print27,(%esp)
	call printf

	movl 12(%ebp),%eax
	cmpl $0,%eax
	jne label_ReverseDisplay_while

	movl $msg_main_print9,(%esp)
	call printf
	
	jmp label_ReverseDisplay_end

label_ReverseDisplay_while:
	#do	
	movl 12(%ebp),%eax
	movl 4(%eax),%eax

	movl $msg_main_print10,(%esp)	
	movl %eax,4(%esp)
	call printf

	movl 12(%ebp),%eax
	movl (%eax),%eax
	movl %eax,12(%ebp)

	#while cond
	movl 8(%ebp),%eax
	movl (%eax),%eax
	movl 12(%ebp),%ebx
	cmpl %eax,%ebx
	jne label_ReverseDisplay_while
		
	movl $msg_main_print11,(%esp)
	call printf

label_ReverseDisplay_end:
	movl %ebp,%esp
	popl %ebp
	
	ret

#########Display###########
.globl Display
.type Display,@function
Display:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl $msg_main_print8,(%esp)
	call printf

	movl 8(%ebp),%eax
	cmpl $0,%eax
	jne label_display_cond_false

	movl $msg_main_print9,(%esp)
	call printf

	jmp label_display_end

label_display_cond_false:
		
	movl 8(%ebp),%eax
	movl 4(%eax),%eax

	movl $msg_main_print10,(%esp)
	movl %eax,4(%esp)
	call printf

	movl 8(%ebp),%eax
	movl 8(%eax),%eax
	movl %eax,8(%ebp)

	#condition
	movl 8(%ebp),%ebx
	movl 12(%ebp),%eax
	movl 8(%eax),%eax

	cmpl %eax,%ebx
	jne label_display_cond_false	
	
	movl $msg_main_print11,(%esp)
	call printf

label_display_end:
	movl %ebp,%esp
	popl %ebp

	ret

##############################################
###########DeleteAllNodes###################3	
.globl DeleteAllNodes
.type DeleteAllNodes,@function
DeleteAllNodes:
	pushl %ebp
	movl %esp,%ebp

	subl $16,%esp

	movl 8(%ebp),%ebx  #pphead
	movl (%eax),%ebx   #*pphead
	cmpl $0,%ebx
	je label_DeleteAllNodes_end

	jmp label_DeleteAllNodes_while_cond	

label_DeleteAllNodes_while_code:

	#(*pphead)->pprev = NULL
	movl 8(%ebp),%eax  #pphead
	movl (%eax),%eax   #*pphead
	movl $0,(%eax)

	#*pphead = (*pphead) -> pNext
	movl 8(%eax),%eax
	movl 8(%ebp),%ebx
	movl %eax,(%ebx)

	#(*pptail)->pNext->pnext = NULL
	movl 12(%ebp),%eax    
	movl (%eax),%eax
	movl 8(%eax),%eax
	movl $0,8(%eax)

	#free((*pptail) -> pnext)		
	movl %eax,(%esp)
	call free	

	#(*pptail) -> pNext = *pphead
	movl 12(%ebp),%eax
	movl (%eax),%eax
	movl 8(%ebp),%ebx
	movl (%ebx),%ebx
	movl %ebx,8(%eax)

label_DeleteAllNodes_while_cond:
	#*pphead != *pptail
	movl 8(%ebp),%eax    #pphead
	movl (%eax),%eax     #*pphead
	movl 12(%ebp),%ebx   #pptail
	movl (%ebx),%ebx     #*pptail
	cmpl %eax,%ebx
	jne label_DeleteAllNodes_while_code
 
	#(*pphead)->next = NULL
	movl $0,8(%eax)

	#(*pphead)->pprev = NULL
	movl $0,(%eax)

	#free(*pphead)		
	movl %eax,(%esp)
	call free

	movl 8(%ebp),%eax
	movl $0,(%eax)

	movl 12(%ebp),%eax
	movl $0,(%eax)

label_DeleteAllNodes_end:
	movl %ebp,%esp
	popl %ebp

	ret


###############################################	
label_Failure:
	movl $msg_main_print7,(%esp)
	call printf
		
	call exit
