#include <stdio.h>
#include <stdlib.h>

int foo(int, int, int);

int x = 0x41;

int
main(int argc, char **argv)
{

   int y = x;
   int *p;
   int ret;

   p = malloc(sizeof(int));

   *p = y;
   ret = foo(++*p, 10, 42);
   exit(ret);
}

int
foo(int a, int b, int c)
{

   printf("foo: %x\n", a);
   return a;
}
