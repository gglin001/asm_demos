###############################################################################

DIR=_demos/addi.mlir && mkdir -p $DIR
args=(
  #
  -march=rv64im_zicsr_zve64x_zvl512b
  # or
  # -march=rv64im_zicsr_zve64x
  # -mllvm --riscv-v-vector-bits-min=512
  #
  -mabi=lp64
  # -mabi=lp64d
  #
  --target=riscv64-unknown-elf
  #
  -v
  -S
  -o $DIR/addi.s
  llvmir/addi.ll
)
clang "${args[@]}"

###############################################################################
