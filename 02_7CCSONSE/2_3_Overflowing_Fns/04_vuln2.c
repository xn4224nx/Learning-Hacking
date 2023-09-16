void foobar(char *cpy_txt){

    char buffer[100];     // A buffer of 100 cells each cell is one byte.
    strcpy(buffer, cpy_txt);    // Copy the string argument into the buffer
}

int main(int argc, char **argv) {
	
	// Check enough arguments have been given
    if (!argv[1])
        return -1;	
	
	foobar(argv[1]);
	exit(0);
}


