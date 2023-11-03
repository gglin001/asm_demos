clang -g -S src/hello.c -o arm64/hello_d.asm
clang -S src/hello.c -o arm64/hello.asm

# clang -S src/temp.c -o arm64/temp.asm
clang -O0 -S src/temp.c -o arm64/temp.asm
# clang -O3 -S src/temp.c -o arm64/temp.asm
# clang -O0 src/temp.c && ./a.out
