DIR=_demos/_collections && mkdir -p $DIR
args=(
  -v
  #
  -O0
  # -O1
  # -O2
  #
  $DIR/main.ll
  #
  # -o $DIR/main.ll.elf
  #
  -S
  -o $DIR/main.ll.asm
  #
  # -mllvm -print-before-all
  # -mllvm -print-after-all
)
clang "${args[@]}"
