# riscv
# setup `toolchain/readme.md` first

riscv64-unknown-elf-gcc -S -O0 src/hello.c -o rv64/hello.asm
riscv64-unknown-elf-gcc -S -g -O0 src/hello.c -o rv64/hello_d.asm

# arm macos
clang -S src/hello.c -o arm64/hello.asm
clang -g -S src/hello.c -o arm64/hello_d.asm

# arm linux
# TODO
