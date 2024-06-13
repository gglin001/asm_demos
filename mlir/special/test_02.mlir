module {
  llvm.mlir.global internal @flag(0 : i32) : i32

  llvm.func @main() {
    %fn_addr = llvm.mlir.addressof @const_16xi32 : !llvm.ptr
    %flag_addr = llvm.mlir.addressof @flag : !llvm.ptr
    %c_1 = llvm.mlir.constant(0 : i32) : i32
    llvm.store %c_1, %flag_addr : i32, !llvm.ptr

    llvm.call @placeholder(%fn_addr, %fn_addr) : (!llvm.ptr, !llvm.ptr) -> ()

    %0 = llvm.load volatile %flag_addr : !llvm.ptr -> i32
  ^bb0:
    llvm.cond_br %0, ^bb1, ^bb2
  ^bb1:
    llvm.return
  ^bb2:
    llvm.br ^bb0
  }

  llvm.func @placeholder(%0 : !llvm.ptr, %1 : !llvm.ptr) -> (){
    llvm.return
  }

  llvm.func @const_16xi32() -> vector<16xi32> {
    %0 = llvm.mlir.constant(dense<[1, 1, 1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, 1]> : vector<16xi32>) : vector<16xi32>

    %c_1 = llvm.mlir.constant(1 : i32) : i32
    %flag_addr = llvm.mlir.addressof @flag : !llvm.ptr
    llvm.store %c_1, %flag_addr : i32, !llvm.ptr

    llvm.return %0 : vector<16xi32>
  }
}
