; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"

define <16 x i32> @const_16xi32() {
  ret <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
}

; define void @nop(<16 x i32> %0) {
;   ret void
; }

define void @main() {
  %1 = call <16 x i32> @const_16xi32()
  ; %2 = add <16 x i32> %1, %1
  ; call void @nop(<16 x i32> %2)
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
