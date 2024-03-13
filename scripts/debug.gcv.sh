# toolchain is built with
# `./configure --prefix=$RISCV --with-arch=rv64gc --with-abi=lp64d --with-sim=spike --enable-llvm`

# gcc
args=(
  -march=rv64gcv
  -mabi=lp64d
  # -g
  -O0
  # -S
  -v
  # csrc/hello.c
  csrc/rvv_strlen.c
)
set -x
riscv64-unknown-elf-gcc "${args[@]}"
set +x

# clang
args=(
  -march=rv64gcv
  -mabi=lp64d
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  --target=riscv64-unknown-elf
  -I$PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include
  # -g
  -O0
  # -S
  -v
  # csrc/hello.c
  csrc/rvv_strlen.c
)
set -x
clang "${args[@]}"
set +x

# =============================================================================

spike --isa rv64gcv pk a.out
# spike --isa rv64gcv -d pk a.out

args=(
  # -cpu rv64
  -cpu rv64,v=true,vext_spec=v1.0 a.out
  a.out
)
qemu-riscv64 "${args[@]}"

# TODO: how to debug?
# TODO can lldb be used for riscv target?
