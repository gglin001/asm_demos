DIR=_demos/_collections && mkdir -p $DIR
args=(
  -v
  #
  # -S
  #
  $DIR/main.ll
  -o $DIR/main.ll.elf
  #
)
clang "${args[@]}"
