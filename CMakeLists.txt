cmake_minimum_required(VERSION 3.14)

include(cmake/in-source-guard.cmake)

project(
    headeronly
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(headeronly_headeronly INTERFACE)
add_library(headeronly::headeronly ALIAS headeronly_headeronly)

set_property(
    TARGET headeronly_headeronly PROPERTY
    EXPORT_NAME headeronly
)

target_include_directories(
    headeronly_headeronly ${headeronly_warning_guard}
    INTERFACE
    "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
)

target_compile_features(headeronly_headeronly INTERFACE cxx_std_17)

# ---- Install rules ----

include(cmake/install-rules.cmake)

# ---- Developer mode ----

if(NOT headeronly_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of headeronly"
  )
endif()

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

option(BUILD_DOCUMENTATION "Build documentation using Doxygen and m.css" OFF)
if(BUILD_DOCUMENTATION)
  include(cmake/docs.cmake)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)
if(ENABLE_COVERAGE)
  include(cmake/coverage.cmake)
endif()
