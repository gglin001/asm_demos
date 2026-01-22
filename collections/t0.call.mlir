module {
  llvm.func @main() {
    %0 = llvm.mlir.addressof @const_0 : !llvm.ptr
    llvm.call @placeholder(%0, %0) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @placeholder(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    llvm.return
  }
  llvm.func @const_0() -> vector<16xf32> {
    %0 = llvm.mlir.constant(dense<[1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, -1.0, -1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]> : vector<16xf32>) : vector<16xf32>
    llvm.return %0 : vector<16xf32>
  }
}
