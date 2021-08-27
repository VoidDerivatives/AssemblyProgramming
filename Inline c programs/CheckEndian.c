#include<stdio.h>
int main(void)
{
	int i = 10;
	char *p = (char *)&i;
	int counter = 0;
	
	printf("1st byte  : %d\n",*p);
	printf("2nd byte  : %d\n",*(p+1));
	printf("3rd byte  : %d\n",*(p+2));
	printf("4th byte  : %d\n",*(p+3));

	return 0;
}
