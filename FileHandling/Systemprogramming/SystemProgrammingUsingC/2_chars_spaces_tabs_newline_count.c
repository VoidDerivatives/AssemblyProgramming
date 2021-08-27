#include<stdlib.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdio.h>

#define MAX 256
int main(void)
{
	int fd;        // file descriptor
	int No_of_chars = 0;
	int No_of_spaces = 0;
	int No_of_tabs = 0;
	int No_of_lines = 0;

	int ReadCount;
	int counter;
	char Buffer[MAX];   // Buffer
	
	fd = open("chars_spaces_tabs_newlines_count.txt",O_RDONLY);

	if(fd == -1)
	{
		write(1,"Can't open file",sizeof("Can't open file"));
		exit(-1);
	}

	while( (ReadCount = read(fd,Buffer,MAX)) > 0)
	{	
		No_of_chars = No_of_chars + ReadCount;		
				
		for(counter = 0 ; counter < ReadCount ; counter++)
		{
			if(Buffer[counter] == ' ')
				No_of_spaces++;
			else if(Buffer[counter] == '\t')
				No_of_tabs++;	
			else if(Buffer[counter] == '\n')
				No_of_lines++;
		}
	}
			

	close(fd);
	
	printf("\nNo of characters are %d\n", No_of_chars);
	printf("No of spaces are %d\n", No_of_spaces);
	printf("No of tabs are %d\n", No_of_tabs);
	printf("No of lines are %d\n", No_of_lines);

	exit(0);
}
