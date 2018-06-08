#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	int x = 10;
	int *p;
	p = &x;

	int y = 20;
	*p = y;

	printf("x = %d, y = %d\n", x, y);

	return 0;
}