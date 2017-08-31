/* ndiff_config.h.in.cmake.  Generate ndiff/config.h from this file.  */

#ifndef NDIFF_CONFIG_H
#define NDIFF_CONFIG_H

/* Define if the `long double' type works.  */
#cmakedefine01 HAVE_LONG_DOUBLE

/* Define to `unsigned' if <sys/types.h> doesn't define.  */
#cmakedefine size_t ${SIZE_T_DEF}

/* Define if you have the ANSI C header files.  */
#cmakedefine01 STDC_HEADERS

/* Define if you have the <ctype.h> header file.  */
#cmakedefine01 HAVE_CTYPE_H

/* Define if you have the <limits.h> header file.  */
#cmakedefine01 HAVE_LIMITS_H

/* Define if you have the <stddef.h> header file.  */
#cmakedefine01 HAVE_STDDEF_H

/* Define if you have the <stdio.h> header file.  */
#cmakedefine01 HAVE_STDIO_H

/* Define if you have the <stdlib.h> header file.  */
#cmakedefine01 HAVE_STDLIB_H

/* Define if you have the <string.h> header file.  */
#cmakedefine01 HAVE_STRING_H

/* Define if you have the gmp library */
#cmakedefine01 HAVE_GMP

#endif /* NDIFF_CONFIG_H */
