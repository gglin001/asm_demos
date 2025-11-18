DIR=_demos/_collections && mkdir -p $DIR

# args=(
#   #
#   -S
#   #
#   # --no-opaque-pointers
#   # --opaque-pointers
#   --opaque-pointers=0
#   #
#   -o $DIR/main.ll.ll
#   collections/main.ll
#   #
# )
# opt "${args[@]}"

# pixi add mlir=16
# pixi add mlir=15

args=(
  #
  --import-llvm
  #
  -o $DIR/main.ll.mlir
  collections/main.ll
  #
)
mlir-translate "${args[@]}"

args=(
  #
  --mlir-to-llvmir
  --opaque-pointers=0
  #
  -o $DIR/main.ll.mlir.ll
  $DIR/main.ll.mlir
  #
)
mlir-translate "${args[@]}"
