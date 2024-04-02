MKLIBS(1)                                                      Debian User's Manual                                                      MKLIBS(1)

NAME
       mklibs - make a minimal set of libraries

SYNOPSIS
       mklibs [OPTION]... -d DESTINATION FILE...

DESCRIPTION
       Place the minimal set of libraries required by FILE(s) in DESTINATION.

OPTIONS
       -d DESTINATION, --dest-dir DESTINATION
              Place the libraries in DESTINATION.

       -D, --no-default-lib
              Omit the default library path.

       -L LIBDIR[:LIBDIR]...
              Prepend LIBDIR(s) to the library search path.

       --ldlib LDLIB
              Use LDLIB for the dynamic linker.

       --libc-extras-dir EXTRADIR
              Use EXTRADIR to find extra libc files.

       --target TARGET
              Prepend TARGET- to the gcc and binutils calls.

       --root ROOT
              Search in ROOT- for library rpaths.

       --sysroot SYSROOT
              Locate libraries and associated files relative to SYSROOT.

       --gcc-options OPTIONS
              Pass OPTIONS to the compiler when relinking.

       --libdir DIR
              Use DIR (for example, lib64) in place of lib in default library paths.

       -v, --verbose
              Explain what is being done.

       -h, --help
              Display help and exit.

BUGS
       mklibs does not support the --dry-run and --version options supported by mklibs.sh.

AUTHOR
       This manual page was written by Matt Kraai.

Debian                                                              2002-07-07                                                           MKLIBS(1)
