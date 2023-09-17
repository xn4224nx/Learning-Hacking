void main()
{   
    // An array for two strings
    char *name[2];
    
    // This string contains a shell that will be executed by the shellcode
    name[0] = "/bin/sh";
    name[1] = 0;
    
    // This function takes three parameters and executes the command in the
    // first parameter.
    execve(name[0], name, 0);
    
    exit(0);
}
