
#include<stdio.h>
#include<stdlib.h>
struct demo
{
	char chchar;
	int ino;
	short int shiNo;
}obj1 = {'A',10,20};

int main(void)
{
	struct demo obj2 = {'B',30,40};
	
	struct demo obj3 = {'B',30,40};
	
	printf("obj1 is \n");
	printf("chchar = %c ,iNo = %d ,shiNo = %hd\n\n",obj1.chchar,obj1.ino,obj1.shiNo);

	printf("obj2 is :\n");
	printf("chchar = %c ,ino = %d ,shiNo = %hd\n\n",obj2.chchar,obj2.ino,obj2.shiNo);

	printf("obj3 is :\n");
	printf("chchar = %c ,ino = %d ,shiNo = %hd\n\n",obj3.chchar,obj3.ino,obj3.shiNo);

	printf("obj1 & obj2 comparision is ");

	if(obj1.chchar == obj2.chchar && obj1.ino == obj2.ino && obj1.shiNo == obj2.shiNo)
		printf("equal \n");
	else
		printf(" not equal \n");

	printf("obj2 and obj3 comparision is ");
	
	if(obj3.chchar == obj2.chchar && obj3.ino == obj2.ino && obj3.shiNo == obj2.shiNo)
		printf("Equal \n");
	else
		printf("Not equal \n");

	exit(0);	
}
