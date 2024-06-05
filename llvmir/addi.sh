###############################################################################

DIR=_demos/addi.ll && mkdir -p $DIR
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
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  #
  -O0
  -v
  -S
  -o $DIR/addi.s
  llvmir/addi.ll
)
clang "${args[@]}"

###############################################################################
