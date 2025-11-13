module {
  llvm.func @main() {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    %1 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    %2 = llvm.icmp "sgt" %0, %1 : vector<16xi32>
    llvm.return
  }
}
