###############################################################################

PIPELINE=""
PIPELINE+="convert-vector-to-llvm,"
PIPELINE+="convert-func-to-llvm,"
PIPELINE+="canonicalize"
PIPELINE="builtin.module("$PIPELINE")"
DIR=_demos/addi.mlir && mkdir -p $DIR
args=(
  --pass-pipeline="$PIPELINE"
  -o $DIR/addi.mlir
  mlir/addi.mlir
)
mlir-opt "${args[@]}"

######

DIR=_demos/addi.mlir && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/addi.ll
  $DIR/addi.mlir
)
mlir-translate "${args[@]}"

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
  $DIR/addi.ll
)
clang "${args[@]}"

###############################################################################
