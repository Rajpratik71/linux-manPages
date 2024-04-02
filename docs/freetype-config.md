FREETYPE-CONFIG(1)                                            General Commands Manual                                           FREETYPE-CONFIG(1)

NAME
       freetype-config - Get information about a libfreetype installation

SYNOPSIS
       freetype-config [options]

DESCRIPTION
       freetype-config  returns information needed for compiling and linking programs with the FreeType library, such as linker flags and compila‐
       tion parameters.  Alternatively, it can be used to query information about the FreeType library version installed on the  system,  such  as
       the installation (directory path) prefix or the FreeType version number.

       If pkg-config(1) is found in the path, freetype-config acts as a wrapper for pkg-config.

       This program is part of the FreeType package.

OPTIONS
       There are two types of options: output/display selection options, and path override options.

   Output selection options
       Only one of the output selection options should be given at each program invocation.

       --prefix
              Return  the  prefix  value  of  the  installed  FreeType  library (the default prefix will be `/usr' in most cases for distribution-
              installed packages).

       --exec-prefix
              Return the executable prefix value of the installed FreeType library (will often be the same as the prefix value).

       --ftversion
              Return the FreeType version number, directly derived from file `freetype.h'.

       --version
              Return the `libtool version' of the FreeType library.

       --libtool
              Return the library name for linking with libtool.

       --libs Return compiler flags for linking with the installed FreeType library.

       --cflags
              Return compiler flags for compiling against the installed FreeType library.

       --static
              Make command line options display flags for static linking.

       --help Show help and exit.

   Path override options
       These affect any selected output option, except the libtool version returned by --version.

       --prefix=PREFIX
              Override --prefix value with PREFIX.  This also sets --exec-prefix=PREFIX if option --exec-prefix is not explicitly given.

       --exec-prefix=EPREFIX
              Override --exec-prefix value with EPREFIX.

BUGS
       In case the libraries FreeType links to are located in non-standard directories, and pkg-config(1) is not available, the output from option
       --libs  might  be  incomplete.   It  is thus recommended to use the pkg-config(1) interface instead, which is able to correctly resolve all
       dependencies.

       Setting --exec-prefix (either explicitly or implicitly) might return incorrect results if combined with option --static.  The same  problem
       can occur if you set the SYSROOT environment variable.

AUTHOR
       This manual page was contributed by Nis Martensen <nis.martensen@web.de>, with further refinements from the FreeType team.

FreeType 2.8.1                                                    September 2017                                                FREETYPE-CONFIG(1)
