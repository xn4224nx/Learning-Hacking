#include <stdio.h>

int main(int argc, char **argv)
{
	char buffer[4];
	
	sprintf(buffer, "Debug: program '%s' is starting.\n", argv[0]);
	
	printf("%s\n\n", buffer);
	
	return 0;
}
