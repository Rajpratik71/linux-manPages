ewfmount                                                               LOCAL                                                              ewfmount

NAME
     ewfmount — mount data stored in EWF files

SYNOPSIS
     ewfmount [-f format] [-X extended_options] [-hvV] ewf_files

DESCRIPTION
     ewfmount is a utility to mount data stored in EWF files.

     ewfmount is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     ewf_files the first or the entire set of EWF segment files mount_point the directory to serve as mount point

     The options are as follows:

     -f format
             specify the input format, options: raw (default), files (restricted to logical volume files)

     -h      shows this help

     -v      verbose output to stderr

     -V      print version

     -X extended_options
             extended options to pass to sub system

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # ewfmount floppy.E01 floppy/
     ewfmount 20110918

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled. Verbose and debug output are only printed when
     enabled at compilation.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: http://code.google.com/p/libewf/

AUTHOR
     These man pages were written by Joachim Metz.

COPYRIGHT
     Copyright 2006-2014, Joachim Metz <joachim.metz@gmail.com>.

     This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.

SEE ALSO
     ewfacquire(1), ewfacquirestream(1), ewfexport(1), ewfinfo(1), ewfrecover(1), ewfverify(1)

libewf                                                           January 19, 2014                                                           libewf
