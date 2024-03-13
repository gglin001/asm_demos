# setup `toolchain/readme.md` first

# gcc
riscv64-unknown-elf-gcc -S -O0 csrc/hello.c -o asm/hello.s
# riscv64-unknown-elf-gcc -S -g -O0 csrc/hello.c -o asm/hello_d.s

# clang
# target-triple: https://clang.llvm.org/docs/CrossCompilation.html#target-triple

# # arm64-apple-darwin
# clang -target arm64-apple-darwin -S -O0 csrc/hello.c -o arm64/hello.s

# riscv64-unknown-elf
args=(
  # -march=rv64gcv
  # -mabi=lp64d
  --target=riscv64-unknown-elf
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  -I$PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include
  -S
  # -g
  -O0
  # -v
  -o asm/add_f32.s
  csrc/add_f32.c
)
clang "${args[@]}"
