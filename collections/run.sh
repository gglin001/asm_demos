DIR=_demos/tmp && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/main.ll
  collections/llvm.call.ptr.f32.mlir
)
mlir-translate "${args[@]}"
