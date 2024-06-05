
module {
  llvm.func @printf(!llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("res : %i\n")

  llvm.func @main()  {
    %c_0 = llvm.mlir.constant(0 : i32) : i32
    %c_42 = llvm.mlir.constant(-42: i32) :i32
    %val = llvm.inline_asm "add $0, $1, $1", "=r,r" %c_42 : (i32) -> i32
    // call printf
    %5 = llvm.mlir.addressof @str0 : !llvm.ptr
    %6 = llvm.getelementptr %5[%c_0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.array<9 x i8>
    %7 = llvm.call @printf(%6, %val) vararg(!llvm.func<i32 (ptr, ...)>): (!llvm.ptr, i32) -> i32
    llvm.return
  }
}
