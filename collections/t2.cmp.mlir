module {
  llvm.func @main() {
    %2 = llvm.call @const_16xi32() : () -> vector<16xi32>
    %3 = llvm.call @const_16xi32_1() : () -> vector<16xi32>
    %4 = llvm.icmp "sgt" %2, %3 : vector<16xi32>
    llvm.return
  }
  llvm.func @const_16xi32() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
  llvm.func @const_16xi32_1() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
}
