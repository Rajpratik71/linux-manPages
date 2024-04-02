ewfrecover                                                             LOCAL                                                            ewfrecover

NAME
     ewfrecover — exports media data stored in EWF files

SYNOPSIS
     ewfrecover [-A codepage] [-l log_filename] [-p process_buffer_size] [-t target] [-hquvVx] ewf_files

DESCRIPTION
     ewfrecover is a utility to recover corrupt EWF files.

     ewfrecover is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     ewf_files the first or the entire set of EWF segment files

     The options are as follows:

     -A codepage
             the codepage of header section, options: ascii (default), windows-874, windows-932, windows-936, windows-949, windows-950, win‐
             dows-1250, windows-1251, windows-1252, windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258

     -h      shows this help

     -l log_filename
             logs recover errors and the digest (hash) to the log filename

     -p process_buffer_size
             the process buffer size (default is the chunk size)

     -t target
             the target file to recover to (default is recover)

     -v      verbose output to stderr

     -V      print version

     -x      use the chunk data instead of the buffered read and write functions.

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     ewfrecover will ask the information it needs.

   Recovering a corrupted image
     ewfrecover corrupt.E01
     ewfrecover 20120805

     Export started at: Mon Aug  6 07:09:34 2012

     This could take a while.

           ...

     Export completed at: Mon Aug  6 07:09:34 2012

     MD5 hash calculated over data:          d41d8cd98f00b204e9800998ecf8427e
     ewfrecover: SUCCESS

   Trying to recover a non-corrupted image
     ewfrecover notcorrupt.E01
     ewfrecover 20120805

     EWF file(s) are not corrupted.

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
     ewfacquire(1), ewfacquirestream(1), ewfexport(1), ewfinfo(1), ewfmount(1), ewfverify(1)

libewf                                                           January 19, 2014                                                           libewf
