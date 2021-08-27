#include<stdio.h>

int main()
{
	FILE *fp = NULL;

	int iNoOfChars = 0;
	int iNoOfSpaces = 0;
	int iNoOfTabs = 0;
	int iNoOfLines = 0;
	char chChar;

	fp = fopen("chars_spaces_tabs_newlines_count.txt","r");

	if(NULL == fp)
	{
		printf("Cant Open The File");
		return -1;
	}

	while(1)
	{
		chChar = fgetc(fp);
	
		if(chChar == EOF)
			break;

		iNoOfChars++;

		if(chChar == ' ')
			iNoOfSpaces++;
		else if(chChar == '\t')
			iNoOfTabs++;
		else if(chChar == '\n')
			iNoOfLines++;
	}

	fclose(fp);
	fp = NULL;

	printf("\nNo of characters are %d\n", iNoOfChars);
	printf("No of spaces are %d\n", iNoOfSpaces);
	printf("No of tabs are %d\n", iNoOfTabs);
	printf("No of lines are %d\n", iNoOfLines);

	return 0;
}

