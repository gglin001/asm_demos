# setup `toolchain/README.md` first

###############################################################################

# gcc
args=(
  -S
  # -g
  -O0
  # -v
  -o asm_gen/hello.s
  cc/hello.c
)
riscv64-unknown-elf-gcc "${args[@]}"

###############################################################################

# riscv64-unknown-elf
args=(
  # -march=rv64gcv
  # -mabi=lp64d
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  -I$PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include
  -S
  # -g
  -O0
  # -v
  -o asm_gen/add_f32.s
  cc/add_f32.c
)
clang "${args[@]}"

###############################################################################
