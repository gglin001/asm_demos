#include <stdio.h>

int main() {
  int a[5] = {1, 1, 1, 1, 1};
  int b[5] = {2, 2, 2, 2, 2};
  int c[5] = {0, 0, 0, 0, 0};

  for (int i = 0; i < 5; ++i) {
    c[i] = a[i] + b[i];
  }

  printf("c: ");
  for (int i = 0; i < 5; ++i) {
    printf("%d\t", c[i]);
  }
  printf("\n");

  return 0;
}
