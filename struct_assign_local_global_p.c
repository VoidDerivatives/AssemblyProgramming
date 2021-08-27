#include<stdio.h>
#include<stdlib.h>
struct demo
{
	char chchar;
	int iNo;
	short int shiNo;
}obj1;
int main(void)
{
	struct demo obj2;
	struct demo obj3;
	
	printf("Enter the obj2 values:\n");
	printf("Enter the chchar:\t");	
	scanf("%c",&obj2.chchar);
	printf("Enter iNo\t");
	scanf("%d",&obj2.iNo);
	printf("Enter the shiNo");
	scanf("%hd",&obj2.shiNo);

	printf("Obj2 is \n");
	printf("chchar = %c ,iNo =%d,shiNo = %hd\n",obj2.chchar,obj2.iNo,obj2.shiNo);

	obj1.chchar = obj2.chchar;
	obj1.iNo = obj2.iNo;
	obj1.shiNo = obj2.shiNo;

	obj3.chchar = obj2.chchar;
	obj3.iNo = obj2.iNo;
	obj3.shiNo = obj2.shiNo;

	printf("\n obj1 is \n");
	printf("chchar = %c ,iNo =%d,shiNo = %hd\n",obj1.chchar,obj1.iNo,obj1.shiNo);

	printf("\nobj3 is \n");
	printf("chchar = %c ,iNo =%d,shiNo = %hd\n",obj3.chchar,obj3.iNo,obj3.shiNo);

	exit(0);
}

