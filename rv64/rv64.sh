# ln -s abspath_to/riscv32-embecosm-macos-gcc13.2.0 $PWD/rv64/toolchain
# ln -s abspath_to/riscv-embecosm-embedded-macos-20230903/ $PWD/rv64/toolchain-llvm

rv64/toolchain/bin/riscv32-unknown-elf-c++ -S -O0 src/hello.c -o rv64/hello.asm
rv64/toolchain/bin/riscv32-unknown-elf-c++ -g -S -O0 src/hello.c -o rv64/hello_d.asm

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

# rvv-intrinsic-doc
git submodule init
git submodule update --init --depth=1
# TODO: use RV64 toolchain
rv64/toolchain/bin/riscv32-unknown-elf-gcc -O0 \
    -march=rv32gcv \
    rv64/rvv-intrinsic-doc/examples/rvv_matmul.c
# in qemu docker container
qemu-riscv32 -cpu rv32,v=true,vext_spec=v1.0 a.out
