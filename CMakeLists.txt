cmake_minimum_required(VERSION 3.26.0 FATAL_ERROR)

project(cpp_demos LANGUAGES C CXX ASM)

if(APPLE)
  add_subdirectory(arm64)
endif()
