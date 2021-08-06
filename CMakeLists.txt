cmake_minimum_required(VERSION 3.14)

include(cmake/in-source-guard.cmake)

project(
    headeronly
    VERSION 0.1.0
    DESCRIPTION "Short description"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES NONE
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

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT headeronly_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of headeronly"
  )
endif()

include(cmake/dev-mode.cmake)
