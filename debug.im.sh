# toolchain is built with
# `./configure --prefix=$RISCV --with-arch=rv64im --with-abi=lp64 --with-sim=spike --enable-llvm`

# hello
riscv64-unknown-elf-gcc -g -O0 src/hello.c

# rvv
args=(
  -g
  -O0
  -march=rv64im
  # rv64/rvv/strlen.c
  # rv64/rvv/strlen.s
  rv64/rvv/saxpy.c
  rv64/rvv/saxpy.s
)
set -x
riscv64-unknown-elf-gcc "${args[@]}"
set +x

# spike
spike --isa rv64im pk a.out
# spike --isa rv64gc pk a.out

# spike debug
spike --isa rv64im -d pk a.out

# in qemu docker container
qemu-riscv64 \
  -cpu rv64,v=true,vext_spec=v1.0 a.out
