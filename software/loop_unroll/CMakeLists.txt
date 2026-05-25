cmake_minimum_required(VERSION 3.13)
project(loop_unroll)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "found llvm ${LLVM_PACKAGE_VERSION}")

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
add_library(loop_unroll MODULE loop_unroll.cpp)
target_compile_features(loop_unroll PRIVATE cxx_std_17)

if(APPLE)
    target_link_options(loop_unroll PRIVATE -undefined dynamic_lookup)
endif()