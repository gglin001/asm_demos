DIR=_demos/_collections && mkdir -p $DIR
args=(
  --mlir-to-llvmir
  #
  -o $DIR/main.ll
  collections/main.mlir
  #
)
mlir-translate "${args[@]}"
