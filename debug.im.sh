# toolchain is built with
# `./configure --prefix=$RISCV --with-arch=rv64im --with-abi=lp64 --with-sim=spike --enable-llvm`
# TODO: support macos

# gcc
args=(
  -march=rv64im
  -mabi=lp64
  # -g
  -O0
  -v
  src/hello.c
  # src/rvv_strlen.c
)
set -x
riscv64-unknown-elf-gcc -S "${args[@]}"
riscv64-unknown-elf-gcc "${args[@]}"
set +x

# clang
args=(
  -march=rv64im
  -mabi=lp64
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  --target=riscv64-unknown-elf
  -I$PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include
  # -g
  -O0
  -v
  src/hello.c
  # src/rvv_strlen.c
)
set -x
clang -S "${args[@]}"
clang "${args[@]}"
set +x

# =============================================================================

# spike
spike --isa rv64gc pk a.out

spike --isa rv64im pk a.out

# in qemu docker container
qemu-riscv64 \
  -cpu rv64 a.out

# =============================================================================

# debug
