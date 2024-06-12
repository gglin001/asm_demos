module {

  llvm.func @main() {
    %1 = llvm.mlir.addressof @const_16xi32 : !llvm.ptr
    // TODO: add a arg for callee
    // llvm.call %1() : !llvm.ptr, () -> vector<16xi32>
    llvm.call @placeholder(%1, %1) : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }

  llvm.func @placeholder(%0 : !llvm.ptr, %1 : !llvm.ptr) -> (){
    llvm.return
  }

  llvm.func @const_16xi32() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
}
