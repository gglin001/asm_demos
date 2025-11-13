DIR=_demos/tmp && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  -o $DIR/main.ll
  collections/t0.call.mlir
)
mlir-translate "${args[@]}"
