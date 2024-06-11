###############################################################################

DIR=_demos/llvm.call.ptr.mlir && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/main.ll
  mlir/llvm.call.ptr.mlir
)
mlir-translate "${args[@]}"

###############################################################################
