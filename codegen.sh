# riscv
# setup `toolchain/readme.md` first

riscv64-unknown-elf-gcc -S -O0 src/hello.c -o rv64/hello.asm
riscv64-unknown-elf-gcc -S -g -O0 src/hello.c -o rv64/hello_d.asm

# arm macos
# https://clang.llvm.org/docs/CrossCompilation.html#target-triple
clang -target arm64-apple-darwin -S -O0 src/hello.c -o arm64/hello.asm
clang -target arm64-apple-darwin -S -g -O0 src/hello.c -o arm64/hello_d.asm
