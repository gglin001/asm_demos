###############################################################################

DIR=_demos/inline_asm_riscv.mlir && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/main.ll
  mlir/inline_asm_riscv.mlir
)
mlir-translate "${args[@]}"

###############################################################################

DIR=_demos/inline_asm_riscv.mlir && mkdir -p $DIR
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

DIR=_demos/inline_asm_riscv.mlir && mkdir -p $DIR
args=(
  -march=rv64im
  -mcpu=generic-rv64
  # -mabi=lp64
  -mabi=lp64d
  -mcpu=generic-rv64
  --target=riscv64-unknown-elf
  --gcc-toolchain=$PWD/toolchain/riscv-gnu-toolchain
  -O0
  -v
  # -S
  -o $DIR/main
  $DIR/main.ll
)
clang "${args[@]}"

#####

DIR=_demos/inline_asm_riscv.mlir && mkdir -p $DIR
args=(
  # -M no-aliases
  # -x
  # -s
  -d
  $DIR/main
)
llvm-objdump "${args[@]}" >$DIR/main.objdump

#####

DIR=_demos/inline_asm_riscv.mlir && mkdir -p $DIR
args=(
  # -l
  --isa rv64gc
  pk
  $DIR/main
)
spike "${args[@]}"

###############################################################################
