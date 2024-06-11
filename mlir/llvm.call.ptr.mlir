module {
  llvm.func @const_16xi32() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
  llvm.func @main() {
    %1 = llvm.mlir.addressof @const_16xi32 : !llvm.ptr
    llvm.call %1() : !llvm.ptr, () -> vector<16xi32>
    llvm.return
  }
}
