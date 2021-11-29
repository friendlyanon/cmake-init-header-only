cmake_minimum_required(VERSION 3.14)

project(headeronlyTests LANGUAGES CXX)

include(../cmake/project-is-top-level.cmake)
include(../cmake/folders.cmake)
include(../cmake/windows-set-path.cmake)

if(PROJECT_IS_TOP_LEVEL)
  find_package(headeronly REQUIRED)
  enable_testing()
endif()

add_executable(headeronly_test source/headeronly_test.cpp)
target_link_libraries(headeronly_test PRIVATE headeronly::headeronly)
target_compile_features(headeronly_test PRIVATE cxx_std_17)

add_test(NAME headeronly_test COMMAND headeronly_test)

add_folders(Test)
