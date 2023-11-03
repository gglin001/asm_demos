# ln -s /Users/allen/Downloads/riscv32-embecosm-macos-gcc13.2.0 $PWD/rv64/toolchain
# ln -s /Users/allen/Downloads/riscv-embecosm-embedded-macos-20230903/ $PWD/rv64/toolchain-llvm

rv64/toolchain/bin/riscv32-unknown-elf-c++ -g -O0 src/hello.c

# or
rv64/toolchain-llvm/bin/clang --gcc-toolchain=$PWD/rv64/toolchain \
    --target=riscv64-unknown-elf \
    -g -O0 src/hello.c

# in qemu docker container
qemu-riscv64 -g 1234 a.out

# host
rv64/toolchain/bin/riscv32-unknown-elf-gdb a.out
# target remote :1234
# l
# b main
# c
# bt
