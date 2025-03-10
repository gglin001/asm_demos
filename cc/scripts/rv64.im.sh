# toolchain is built with
# `./configure --prefix=$RISCV --with-arch=rv64im --with-abi=lp64 --with-sim=spike --enable-llvm`

# set -x

###############################################################################

args=(
  -march=rv64im
  -mabi=lp64
  # -g
  -O0
  -v
  cc/hello.c
)
riscv64-unknown-elf-gcc -S "${args[@]}"
riscv64-unknown-elf-gcc "${args[@]}"

#####

args=(
  -march=rv64im
  -mabi=lp64
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  -I$PWD/toolchain/riscv-gnu-toolchain/riscv64-unknown-elf/include
  # -g
  -O0
  -v
  cc/hello.c
)
clang -S "${args[@]}"
clang "${args[@]}"

#####

spike --isa rv64imac pk a.out
# spike --isa rv64gc pk a.out

args=(
  # -cpu rv64
  -cpu rv64,i=true,m=true,a=true,f=true,d=false,c=false,e=false
  a.out
)
qemu-riscv64 "${args[@]}"

###############################################################################
