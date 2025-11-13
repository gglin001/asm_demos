DIR=_demos/_collections && mkdir -p $DIR
args=(
  -v
  #
  $DIR/main.ll
  -o $DIR/main.ll.elf
  #
)
clang "${args[@]}"
