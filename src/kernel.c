#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
 
void kernel_main(void) 
{
	/* Initialize terminal interface */
	terminal_initialize();
 
	terminal_writestring("Hello, kernel World!\n");
}