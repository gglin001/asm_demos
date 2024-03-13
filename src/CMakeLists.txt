# add_executable(hello_c hello.c)

set(PRINTF_SRC "${CMAKE_SOURCE_DIR}/3rd/printf")
add_executable(hello_c hello.c ${PRINTF_SRC}/printf.c)
target_include_directories(hello_c SYSTEM PUBLIC "${PRINTF_SRC}")
