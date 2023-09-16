#include <stdio.h>

int main(int argc, char **argv)
{
	char buffer[4];     // Define a small buffer
	
	gets(buffer);       // Fill the buffer from the user input
	
	printf("%s\n\n", buffer);   // Show what is in the buffer
	
	return 0;
}
