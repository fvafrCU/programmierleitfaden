#include <stdio.h>
#include <stdbool.h>
int main (void)
{
    false && printf("hello, world\n") || printf("hello, stupid\n");
    return 0;
}
