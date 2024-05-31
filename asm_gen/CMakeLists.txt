# keep dir depth==1 & one asm to one exe
file(GLOB ASM_SRCS *.s)
foreach(ASM_SRC ${ASM_SRCS})
  cmake_path(GET ASM_SRC STEM ASM_SRC_NAME)
  message("found: ${ASM_SRC}")
  add_executable(${ASM_SRC_NAME}_s ${ASM_SRC})
endforeach()
