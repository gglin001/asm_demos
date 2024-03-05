# toolchain is built with
# `./configure --prefix=$RISCV --with-arch=rv64gc --with-abi=lp64d --with-sim=spike --enable-llvm`
# TODO: support macos

# gcc
args=(
  -march=rv64gcv
  -mabi=lp64d
  # -g
  -O0
  # -S
  -v
  # src/hello.c
  src/rvv_strlen.c
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
  # src/hello.c
  src/rvv_strlen.c
)
set -x
clang "${args[@]}"
set +x

# =============================================================================

# spike
spike --isa rv64gcv pk a.out

# spike debug
spike --isa rv64gcv -d pk a.out

# in qemu docker container
qemu-riscv64 \
  -cpu rv64,v=true,vext_spec=v1.0 a.out

# =============================================================================

# debug

# TODO support gdb on mac?
# # in qemu docker container
# qemu-riscv64 \
#   rv64,v=true,vext_spec=v1.0 \
#   -g 1234 a.out
# # host
# riscv64-unknown-elf-gdb a.out
# # target remote :1234
# # l
# # b main
# # c
# # bt

# TODO can lldb be used for riscv target?
