#include <stdio.h>

extern size_t strlen(const char *str);

int main() {
  char *str = "abc";
  size_t len = strlen(str);
  printf("len: %d \n", len);
}
