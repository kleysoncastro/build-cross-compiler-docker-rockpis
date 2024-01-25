cmake_minimum_required(VERSION 3.16)

project(mraa-rk3308)

option(CROSS_BR "CROSS COMPILER BUILDROOT" ON)


if(CROSS_BR) 
set(sysroot /toolchain/sysroot)
set(toolchain /toolchain/gcc/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu)
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_SYSROOT ${sysroot})
set(CMAKE_C_COMPILER ${toolchain}/bin/aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER ${toolchain}/bin/aarch64-linux-gnu-g++)


# Define as opções do compilador e as flags necessárias
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

# Define os diretórios de include e link para as bibliotecas
include_directories(${sysroot}/usr/include)
link_directories(${sysroot}/usr/lib)

endif()


option(TEST "RUN test host compiler" OFF)
if(TEST)
    message("building tests cpputest")
# config code coverage
set(CMAKE_CXX_FLAGS "-g -O0 -coverage")
set(CMAKE_BUILD_TYPE "Debug")
find_program(LCOV lcov REQUIRED)
  find_program(GENHTML genhtml REQUIRED)
  add_custom_target(coverage
  # gather data
  COMMAND ${LCOV} --directory . --capture --output-file coverage.info 
  # generate report
  COMMAND ${GENHTML} --demangle-cpp -o coverage coverage.info
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
    add_subdirectory(test)
else()
    message("building executable")
endif()


add_subdirectory(src)
