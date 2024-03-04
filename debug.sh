# hello
riscv64-unknown-elf-gcc -g -O0 src/hello.c

# rvv
args=(
  -g
  -O0
  -march=rv64gcv
  # rv64/rvv/strlen.c
  # rv64/rvv/strlen.s
  rv64/rvv/saxpy.c
  rv64/rvv/saxpy.s
)
set -x
riscv64-unknown-elf-gcc "${args[@]}"
set +x

# spike
spike --isa rv64gcv pk a.out

# spike debug
spike --isa rv64gcv -d pk a.out

# in qemu docker container
qemu-riscv64 \
  -cpu rv64,v=true,vext_spec=v1.0 a.out

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
