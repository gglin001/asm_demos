// check `%S/addi.sh`

module {
  func.func @const_16xi32() -> vector<16xi32> {
    %cst = arith.constant dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>
    return %cst : vector<16xi32>
  }
  func.func @nop(%arg0: vector<16xi32>) {
    return
  }
  func.func @main() {
    %0 = call @const_16xi32() : () -> vector<16xi32>
    %1 = arith.addi %0, %0 : vector<16xi32>
    call @nop(%1) : (vector<16xi32>) -> ()
    return
  }
}

// module {
//   llvm.func @const_16xi32() -> vector<16xi32> {
//     %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>
//     llvm.return %0 : vector<16xi32>
//   }
//   llvm.func @nop(%arg0: vector<16xi32>) {
//     llvm.return
//   }
//   llvm.func @main() {
//     %0 = llvm.call @const_16xi32() : () -> vector<16xi32>
//     %1 = llvm.add %0, %0 : vector<16xi32>
//     llvm.call @nop(%1) : (vector<16xi32>) -> ()
//     llvm.return
//   }
// }
