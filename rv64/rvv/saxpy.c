#include <stdio.h>

extern void saxpy(unsigned int n, const float a, const float *x, float *y);

int main(){

unsigned int n = 2;
float a = 1.0;

float x[2] = {1.0, 1.0};
float y[2] = {2.0, 2.0};

printf("y[1]: %f \n", y[1]);
saxpy(n, a, x, y);
printf("after saxpy\n");
printf("y[1]: %f \n", y[1]);

}
