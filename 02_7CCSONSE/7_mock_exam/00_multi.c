#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int Multi(int a, int b)
{
return a*b;
}
int main(int argc, char *argv[])
{
int a, b;

printf("Multi of %d, %d = %fn", a, b, Multi(a, b));
return 0;
}
