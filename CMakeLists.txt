cmake_minimum_required(VERSION 3.26.0 FATAL_ERROR)

project(cpp_demos LANGUAGES C CXX ASM)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/)

if(APPLE)
  add_subdirectory(arm64)
endif()

add_subdirectory(src)
