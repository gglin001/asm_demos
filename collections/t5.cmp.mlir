module {
  llvm.func @main(%arg0: vector<16xi32>) {
    %1 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    %2 = llvm.icmp "sgt" %arg0, %1 : vector<16xi32>
    llvm.call @placeholder(%2) : (vector<16xi1>) -> ()
    llvm.return
  }
  llvm.func @placeholder(%arg0: vector<16xi1>) {
    llvm.return
  }
}
