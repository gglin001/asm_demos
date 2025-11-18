module {
  llvm.func @main(%arg0: vector<16xi32>) attributes {} {
    %0 = llvm.mlir.constant(1 : index) : i32

    %2 = llvm.alloca %0 x f32 {alignment = 64 : i64} : (i32) -> !llvm.ptr<1>

    %3 = llvm.ptrtoint %2 : !llvm.ptr<1> to i32

    llvm.call @placeholder(%3) : (i32) -> ()
    llvm.return
  }
  llvm.func @placeholder(%arg0: i32) {
    llvm.return
  }
}
