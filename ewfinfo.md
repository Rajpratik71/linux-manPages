ewfinfo                                                                LOCAL                                                               ewfinfo

NAME
     ewfinfo — show meta data stored in EWF files

SYNOPSIS
     ewfinfo [-A codepage] [-d date_format] [-f format] [-ehimvV] ewf_files

DESCRIPTION
     ewfinfo is a utility to show meta data stored in EWF files.

     ewfinfo is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     ewf_files the first or the entire set of EWF segment files

     The options are as follows:

     -A codepage
             the codepage of header section, options: ascii (default), windows-874, windows-932, windows-936, windows-949, windows-950, win‐
             dows-1250, windows-1251, windows-1252, windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258

     -d date_format
             the date format, options: ctime (default), dm (day/month), md (month/day), iso8601

     -e      only show EWF read error information

     -f format
             specify the output format, options: text (default), dfxml

     -h      shows this help

     -i      only show EWF acquiry information

     -m      only show EWF media information

     -v      verbose output to stderr

     -V      print version

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # ewfinfo -d dm floppy.E01
     ewfinfo 20120805

     Acquiry information
             Case number:            1
             Description:            Floppy
             Examiner name:          John D.
             Evidence number:        1.1
             Notes:                  Just a floppy in my system
             Acquiry date:           09/12/2006 10:00:12
             System date:            09/12/2006 10:00:12
             Operating system used:  Linux
             Software version used:  20061209
             Password:               N/A

     EWF information
             File format:            EnCase 5
             Sectors per chunk:      64
             Error granularity:      64
             Compression method:     deflate
             Compression level:      no compression
             Set identifier:         869910fc-e143-4908-9328-afedf4a7be1e

     Media information
             Media type:             removable disk
             Is physical:            no
             Bytes per sector:       512
             Number of sectors:      2880
             Media size:             1.4 MiB (1474560 bytes)

     Digest hash information
             MD5:                    ae1ce8f5ac079d3ee93f97fe3792bda3

DIAGNOSTICS
     Errors, verbose and debug output are printed to stderr when verbose output -v is enabled. Verbose and debug output are only printed when
     enabled at compilation.

BUGS
     Please report bugs of any kind to <joachim.metz@gmail.com> or on the project website: http://code.google.com/p/libewf/

AUTHOR
     These man pages were written by Kees Mastwijk.

     Alterations for distribution have been made by Joachim Metz.

COPYRIGHT
     Copyright 2006-2014, Joachim Metz <joachim.metz@gmail.com>.

     This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
     PURPOSE.

SEE ALSO
     ewfacquire(1), ewfacquirestream(1), ewfexport(1), ewfmount(1), ewfrecover(1), ewfverify(1)

libewf                                                           January 19, 2014                                                           libewf
