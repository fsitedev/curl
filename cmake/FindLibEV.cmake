find_path(LIBEV_INCLUDE_DIR NAMES ev.h
  HINTS /usr/include/libev /usr/local/Cellar/libev/4.24/include )
find_library(LIBEV_LIBRARIES NAMES ev
  HINTS /usr/lib /usr/lib64 /usr/local/Cellar/libev/4.24/libs )

if(LIBEV_INCLUDE_DIR AND LIBEV_LIBRARIES)
    set(LIBEV_FOUND ON)
endif(LIBEV_INCLUDE_DIR AND LIBEV_LIBRARIES)

if(LIBEV_FOUND)
    if (NOT LIBEV_FIND_QUIETLY)
        message(STATUS "Found libev includes: ${LIBEV_INCLUDE_DIR}/ev.h")
        message(STATUS "Found libev library: ${LIBEV_LIBRARIES}")
    endif (NOT LIBEV_FIND_QUIETLY)
else(LIBEV_FOUND)
    if (LIBEV_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find libev development files")
    endif (LIBEV_FIND_REQUIRED)
endif (LIBEV_FOUND)
