#include<stdio.h>
int main(void)
{
	FILE *fp = NULL;
	char chChar;

	fp = fopen("print_characters.txt","r");
	
	if(fp == NULL)
	{	
		printf("\n cant open File \n");
		return -1;
	}

	while(1)
	{
		if((chChar = fgetc(fp)) == EOF)
			break;
		else
			printf("%c",chChar);
	}

	fclose(fp);
	fp = NULL;
	
	return 0;
}
