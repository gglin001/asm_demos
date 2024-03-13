#include <printf.h>
#include <stdio.h>

extern void _putchar(char character) {
  // call fprint
  fprintf(stdout, "- %c", character);
}

int main() {
  printf("hello\n");
  return 0;
}
