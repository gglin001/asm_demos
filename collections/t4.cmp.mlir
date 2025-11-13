module {
  llvm.func @main() {
    %0 = llvm.call @const_0() : () -> vector<8xi32>
    %1 = llvm.mlir.constant(dense<[1, 2, 3, 4, 5, 6, 7, 8]> : vector<8xi32>) : vector<8xi32>
    %2 = llvm.icmp "sgt" %0, %1 : vector<8xi32>
    llvm.call @placeholder(%2) : (vector<8xi1>) -> ()
    llvm.return
  }
  llvm.func @placeholder(%arg0: vector<8xi1>) {
    llvm.return
  }
  llvm.func @const_0() -> vector<8xi32> {
    %0 = llvm.mlir.constant(dense<[0, 1, 2, 3, 4, 5, 6, 7]> : vector<8xi32>) : vector<8xi32>
    llvm.return %0 : vector<8xi32>
  }
}
