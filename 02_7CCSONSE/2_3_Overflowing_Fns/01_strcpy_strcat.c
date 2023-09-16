#include <stdio.h>
#include <string.h>

int main(int argc, char **argv)
{
	// Define a small buffer
	char buffer[4];
	
	// Copy the second argument into the buffer
	strcpy(buffer, argv[1]);
	
	// Append a string onto the buffer
	strcat(buffer, " - appended text");
	
	printf("%s\n\n", buffer);
	
	return 0;
}
