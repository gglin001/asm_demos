# spike
spike pk a.out

# spike debug
spike -d pk a.out

# in qemu docker container
qemu-riscv64 \
    rv32,v=true,vext_spec=v1.0 \
    -g 1234 a.out

# host
rv64/toolchain/bin/riscv32-unknown-elf-gdb a.out
# target remote :1234
# l
# b main
# c
# bt
