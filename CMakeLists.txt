cmake_minimum_required(VERSION 3.26.0 FATAL_ERROR)

project(cpp_demos LANGUAGES C CXX ASM)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/)

# TODO: support riscv crosss compile

add_subdirectory(asm)
add_subdirectory(asm_gen)
add_subdirectory(cc)
