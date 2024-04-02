qcowinfo                                                                                          LOCAL                                                                                          qcowinfo

NAME
     qcowinfo — determines information about a QEMU Copy-On-Write (QCOW) image file

SYNOPSIS
     qcowinfo [-hvV] source

DESCRIPTION
     qcowinfo is a utility to determine information about a QEMU Copy-On-Write (QCOW) image file

     qcowinfo is part of the libqcow package.  libqcow is a library to access the QEMU Copy-On-Write (QCOW) image format

     source is the source file.

     The options are as follows:

     -h      shows this help

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # qcowinfo file.qcow
     qcowinfo 20101231

     QEMU Copy-On-Write (QCOW) image information:
             Format:         2
           ...

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled.  Verbose and debug output are only printed when enabled at compilation.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: https://github.com/libyal/libqcow/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright (C) 2010-2016, Joachim Metz <joachim.metz@gmail.com>.

SEE ALSO
libqcow                                                                                      January 19, 2014                                                                                     libqcow
