module {
  llvm.func @main() {
    %0 = llvm.call @const_0() : () -> vector<16xi32>
    %1 = llvm.call @const_1() : () -> vector<16xi32>
    %2 = llvm.icmp "sgt" %0, %1 : vector<16xi32>
    llvm.call @placeholder(%2) : (vector<16xi1>) -> ()
    llvm.return
  }
  llvm.func @placeholder(%arg0: vector<16xi1>) {
    llvm.return
  }
  llvm.func @const_0() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
  llvm.func @const_1() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
    llvm.return %0 : vector<16xi32>
  }
}
