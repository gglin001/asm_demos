DIR=_demos/_collections && mkdir -p $DIR
args=(
  # --mlir-to-llvmir
  --llvmir-to-ll
  #
  -o $DIR/main.ll
  #
  # collections/t0.call.mlir
  # collections/t1.cmp.mlir
  # collections/t2.cmp.mlir
  collections/t3.cmp.mlir
  #
)
mlir-translate "${args[@]}"
