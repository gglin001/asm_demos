# setup `toolchain/readme.md` first

riscv64-unknown-elf-gcc -S -O0 src/hello.c -o rv64/hello.asm
riscv64-unknown-elf-gcc -S -g -O0 src/hello.c -o rv64/hello_d.asm
