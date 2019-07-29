ewfverify                                                              LOCAL                                                             ewfverify

NAME
     ewfverify — verifies media data stored in EWF files

SYNOPSIS
     ewfverify [-A codepage] [-d digest_type] [-f format] [-l log_filename] [-p process_buffer_size] [-hqvVwx] ewf_files

DESCRIPTION
     ewfverify is a utility to verify media data stored in EWF files.

     ewfverify is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     ewf_files the first or the entire set of EWF segment files

     The options are as follows:

     -A codepage
             the codepage of header section, options: ascii (default), windows-874, windows-932, windows-936, windows-949, windows-950, win‐
             dows-1250, windows-1251, windows-1252, windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258

     -d digest_type
             calculate additional digest (hash) types besides md5, options: sha1, sha256

     -f format
             specify the input format, options: raw (default), files (restricted to logical volume files)

     -h      shows this help

     -l log_filename
             logs verification errors and the digest (hash) to the log filename

     -p process_buffer_size
             the process buffer size (default is the chunk size)

     -q      quiet shows minimal status information

     -v      verbose output to stderr

     -V      print version

     -w      zero sectors on checksum error (mimic EnCase like behavior)

     -x      use the chunk data instead of the buffered read and write functions.

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     ewfverify can either verify the raw storage media data or logical file data stored in EWF file(s).

   To verify the raw storage media data:
     # ewfverify floppy.E01
     ewfverify 20110801

     Verify started at: Tue Jan 11 19:21:51 2011

     This could take a while.

     Status: at 2%.
             verified 32 kB (32768 bytes) of total 1.4 MiB (1474560 bytes).

           ...

     Status: at 100%.
             verified 1.4 MiB (1474560 bytes) of total 1.4 MiB (1474560 bytes).
             completion in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     Verify completed at: Tue Jan 11 19:21:52 2011

     Read: 1.4 MiB (1474560 bytes) in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     MD5 hash stored in file:      ae1ce8f5ac079d3ee93f97fe3792bda3
     MD5 hash calculated over data:          ae1ce8f5ac079d3ee93f97fe3792bda3

     ewfverify: SUCCESS

   To verify logical file data:
     # ewfverify -f files logical.E01
     ewfverify 20110111

     Verify started at: Tue Jan 11 19:21:51 2011

     Single file: file1.txt
     MD5 hash stored in file:                6fef2a64afbf070a264366183698bb5e
     MD5 hash calculated over data:          6fef2a64afbf070a264366183698bb5e

           ...

     Verify completed at: Tue Jan 11 19:21:52 2011

     ewfverify: SUCCESS

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
     ewfacquire(1), ewfacquirestream(1), ewfexport(1), ewfinfo(1), ewfmount(1), ewfrecover(1)

libewf                                                           January 19, 2014                                                           libewf
