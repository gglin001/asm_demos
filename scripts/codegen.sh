# riscv
# setup `toolchain/readme.md` first
# gcc, which is used now
riscv64-unknown-elf-gcc -S -O0 src/hello.c -o rv64/hello.asm
riscv64-unknown-elf-gcc -S -g -O0 src/hello.c -o rv64/hello_d.asm
# clang
clang --target=riscv64-unknown-elf --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain -I $PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include \
  -S -O0 -o rv64/hello.asm src/hello.c
clang --target=riscv64-unknown-elf --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain -I $PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include \
  -S -g -O0 -o rv64/hello_d.asm src/hello.c

# arm macos
# https://clang.llvm.org/docs/CrossCompilation.html#target-triple
clang -target arm64-apple-darwin -S -O0 src/hello.c -o arm64/hello.asm
clang -target arm64-apple-darwin -S -g -O0 src/hello.c -o arm64/hello_d.asm
