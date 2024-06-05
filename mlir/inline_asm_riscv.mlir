// mlir-translate --mlir-to-llvmir mlir/inline_asm_riscv.mlir

module {
  llvm.func @printf(!llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("res : %i\n")

  llvm.func @main()  {
    %c_42 = llvm.mlir.constant(-42: i32) :i32
    %val = llvm.inline_asm "add $0, $1, $1", "=r,r" %c_42 : (i32) -> i32
    // call printf
    %str0_addr = llvm.mlir.addressof @str0 : !llvm.ptr
    %_ = llvm.call @printf(%str0_addr, %val)
      vararg(!llvm.func<i32 (ptr, ...)>) : (!llvm.ptr, i32) -> i32
    llvm.return
  }
}

// @str0 = internal constant [9 x i8] c"res : %i\0A"
// declare i32 @printf(ptr, ...)
// define void @main() {
//   %1 = call i32 asm "add $0, $1, $1", "=r,r"(i32 -42)
//   %2 = call i32 (ptr, ...) @printf(ptr @str0, i32 %1)
//   ret void
// }
