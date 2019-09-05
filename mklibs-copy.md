MKLIBS(1)                                                      Debian User's Manual                                                      MKLIBS(1)

NAME
       mklibs-small - make a minimal set of libraries

SYNOPSIS
       mklibs-small [OPTION]... -d DESTINATION FILE...

DESCRIPTION
       Place the minimal set of libraries required by FILE(s) in DESTINATION.

OPTIONS
       -D, --no-default-lib
              Omit the default library path.

       -d DESTINATION, --dest-dir DESTINATION
              Place the libraries in DESTINATION.

       -L LIBDIR[:LIBDIR]...
              Prepend LIBDIR(s) to the library search path.

       --ldlib LDLIB
              Use LDLIB for the dynamic linker.

       --libc-extras-dir EXTRADIR
              Use EXTRADIR to find extra libc files.

       -v, --verbose
              Explain what is being done.

       -h, --help
              Display help and exit.

AUTHOR
       This manual page was written by Matt Kraai.

Debian                                                              2002-07-07                                                           MKLIBS(1)
