###############################################################################

DIR=_demos/inline_asm_riscv_ext.mlir && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/main.ll
  mlir/inline_asm_riscv_ext.mlir
)
mlir-translate "${args[@]}"

###############################################################################

DIR=_demos/inline_asm_riscv_ext.mlir && mkdir -p $DIR
args=(
  -march=rv64im
  -mcpu=generic-rv64
  -mabi=lp64
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  # --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  -O0
  -v
  -S
  -o $DIR/main.s
  $DIR/main.ll
)
clang "${args[@]}"

###############################################################################
