if(PROJECT_IS_TOP_LEVEL)
  set(CMAKE_INSTALL_INCLUDEDIR include/headeronly CACHE PATH "")
endif()

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

install(
    DIRECTORY "${PROJECT_SOURCE_DIR}/include/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT headeronly_Development
)

install(
    TARGETS headeronly_headeronly
    EXPORT headeronlyTargets
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

write_basic_package_version_file(
    headeronlyConfigVersion.cmake
    COMPATIBILITY SameMajorVersion
    ARCH_INDEPENDENT
)

set(
    headeronly_INSTALL_CMAKEDIR "${CMAKE_INSTALL_LIBDIR}/cmake/headeronly"
    CACHE STRING "CMake package config location relative to the install prefix"
)

mark_as_advanced(headeronly_INSTALL_CMAKEDIR)

install(
    FILES
    "${PROJECT_SOURCE_DIR}/cmake/headeronlyConfig.cmake"
    "${PROJECT_BINARY_DIR}/headeronlyConfigVersion.cmake"
    DESTINATION "${headeronly_INSTALL_CMAKEDIR}"
    COMPONENT headeronly_Development
)

install(
    EXPORT headeronlyTargets
    NAMESPACE headeronly::
    DESTINATION "${headeronly_INSTALL_CMAKEDIR}"
    COMPONENT headeronly_Development
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
