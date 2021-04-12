# ---- Developer mode ----

if(PROJECT_IS_TOP_LEVEL)
  option(headeronly_DEVELOPER_MODE "Enable developer mode" OFF)

  if("$ENV{CI}")
    set(headeronly_DEVELOPER_MODE ON CACHE INTERNAL "")
  endif()
endif()

# ---- Warning guard ----

if(NOT PROJECT_IS_TOP_LEVEL)
  option(
      headeronly_INCLUDE_WITHOUT_SYSTEM
      "Enable headeronly's warnings for dependents"
      OFF
  )
endif()
set(headeronly_warning_guard SYSTEM)
if(PROJECT_IS_TOP_LEVEL OR headeronly_INCLUDE_WITHOUT_SYSTEM)
  set(headeronly_warning_guard "")
endif()
