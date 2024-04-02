MKLIBS(1)                                                          User Commands                                                         MKLIBS(1)

NAME
       mklibs - prints informations about ELF shared objects and executables

SYNOPSIS
       mklibs-readelf [OPTION]... FILE...

DESCRIPTION
       Prints informations about ELF shared objects and executables.

       Mandatory arguments to long options are mandatory for short options too.

       -i, --print-interp
              Print interpreter of executable

       -n, --print-needed
              Print needed shared libs

       -R, --print-rpath
              Print rpath setting

       -s, --print-soname
              Print soname of shared object

       -p, --print-symbols-provided
              Print provided symbols

       -u, --print-symbols-undefined
              Print undefined symbols

       --help Display this help and exit

       --version
              Output version information and exit

mklibs                                                             October 2005                                                          MKLIBS(1)
