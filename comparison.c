#include<stdio.h>

#include<conio.h>

#define LT 1

#define LE 2

#define GT 4

#define GE 8

#define EE 16

int campare(int ,int);

int main()

{

	int no1,no2;

	char ch;

	printf("Enter the two numbers for showing relation:");

	scanf_s("%d %d",&no1,&no2);

	ch=campare(no1,no2);

	if((ch&LT) == LT && (ch&LE) == LE)  

	{   

	printf("\n%d is less than %d\n",no1,no2);

	printf("\n%d is less than or equal to %d\n",no1,no2);

	printf("\n%d is not greater than %d\n",no1,no2)

	printf("\n%d is not greater than equal %d",no1,no2);

	}	

	if((ch&GT) == GT && (ch&GE) == GE)

	{ 
	printf("\n%d is not less than %d\n",no1,no2);
	printf("\n%d is not less than or equal to %d\n",no1,no2);
	printf("\n%d is greater than %d\n",no1,no2);
	printf("\n%d is greater than or equal to %d\n",no1,no2);  

	}

	if((ch&EE) == EE)  

	{	

	printf("\n%d is not less than %d\n",no1,no2);
	printf("\n%d is less than or equal to %d\n",no1,no2)
	printf("\n%d is not greater than %d\n",no1,no2);
	printf("\n%d is greater than or equal to %d\n",no1,no2);
	printf("\n%d is equal to %d",no1,no2);

	}	

	else

	{ 

		printf("\n%d and %d is not equal to %d",no1,no2);



	}	

	_getch();

	return 0;

}

int campare(int no1,int no2)

{

	unsigned char ch=0;

	if(no1<no2)

	{

		ch=ch|LT;

		ch=ch|LE;

	}

	if(no1>no2)

	{

		ch=ch|GT;

		ch=ch|GE;

	}

	if(no1==no2)

	{

		ch=ch|LE;

		ch=ch|GE;

		ch=ch|EE;

	}

	return ch;

}
