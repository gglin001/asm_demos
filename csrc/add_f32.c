#include <stdio.h>

int main() {
  float a[5] = {1.3f, 1.3f, 1.3f, 1.3f, 1.3f};
  float b[5] = {2.3f, 2.3f, 2.3f, 2.3f, 2.3f};
  float c[5] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f};

  for (int i = 0; i < 5; ++i) {
    c[i] = a[i] + b[i];
  }

  printf("c: ");
  for (int i = 0; i < 5; ++i) {
    printf("%f\t", c[i]);
  }
  printf("\n");

  return 0;
}
