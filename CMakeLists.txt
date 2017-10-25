

cmake_minimum_required(VERSION 3.4 FATAL_ERROR)
project(ndiff-executable VERSION 2.0.0 LANGUAGES C)

include (CheckIncludeFiles)
include (CheckTypeSize)

# Perform checks required for configured header.
# Test for header files exist.
check_include_files(ctype.h HAVE_CTYPE_H)
check_include_files(limits.h HAVE_LIMITS_H)
check_include_files(stddef.h HAVE_STDDEF_H)
check_include_files(stdio.h HAVE_STDIO_H)
check_include_files(stdlib.h HAVE_STDLIB_H)
check_include_files(string.h HAVE_STRING_H)
check_include_files("stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS)

# Test size_t is defined.
set(CMAKE_EXTRA_INCLUDE_FILES "stdlib.h;stddef.h")
check_type_size("size_t" SIZE_T)
set(CMAKE_EXTRA_INCLUDE_FILES)
if (NOT SIZE_T)
    set(SIZE_T_DEF unsigned)
endif ()

# Check that long double is defined, automatically defines HAVE_LONG_DOUBLE
check_type_size("long double" LONG_DOUBLE)

# Check for gmp
find_path(GMP_INCLUDE_DIR gmp.h)
if (GMP_INCLUDE_DIR)
    find_library(GMP_LIBRARY gmp)
    if (GMP_LIBRARY)
        set(HAVE_GMP TRUE)
        add_library(gmp UNKNOWN IMPORTED)
        set_target_properties(gmp PROPERTIES
            IMPORTED_LOCATION ${GMP_LIBRARY}
            INTERFACE_INCLUDE_DIRECTORIES ${GMP_INCLUDE_DIR}
        )
    endif ()
endif ()

# Configure config.h
string(TIMESTAMP TIMESTAMP "%Y-%m-%d %H:%M")
set(CONFIG_HDR "${CMAKE_CURRENT_BINARY_DIR}/include/ndiff/config.h")
configure_file(ndiff_config.h.in.cmake ${CONFIG_HDR})

set(NDIFF_SRCS
    ndiff.c store.c awklib.c regexp/regexp.c regexp/regerror.c)

add_executable(ndiff ${NDIFF_SRCS})
target_include_directories(ndiff PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/include" "${CMAKE_CURRENT_SOURCE_DIR}")
if (HAVE_GMP)
    target_link_libraries(ndiff PUBLIC gmp)
endif ()

install(TARGETS ndiff DESTINATION bin)

