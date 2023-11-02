#include <stdio.h>

void func() {
  int a = 10;
  int b = 110;
  int c = a + b;
  printf("c: %i", c);
}

int main() {
  printf("hello\n");
  func();
  return 0;
}
