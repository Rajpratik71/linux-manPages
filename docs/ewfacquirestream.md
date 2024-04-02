ewfacquirestream                                                       LOCAL                                                      ewfacquirestream

NAME
     ewfacquirestream — acquires data in the EWF format from stdin

SYNOPSIS
     ewfacquirestream [-A codepage] [-b number_of_sectors] [-B number_of_bytes] [-c compression_values] [-C case_number] [-d digest_type]
                      [-D description] [-e examiner_name] [-E evidence_number] [-f format] [-l log_filename] [-m media_type] [-M media_flags]
                      [-N notes] [-o offset] [-p process_buffer_size] [-P bytes_per_sector] [-S segment_file_size] [-t target]
                      [-2 secondary_target] [-hqsvVx]

DESCRIPTION
     ewfacquirestream is a utility to acquire media data from stdin and store it in EWF format (Expert Witness Format).  ewfacquirestream acquires
     media data in a format equivalent to EnCase and FTK imager, including meta data. Under Linux, FreeBSD, NetBSD, OpenBSD, MacOS-X/Darwin

     ewfacquirestream is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     The options are as follows:

     -A codepage
             the codepage of header section, options: ascii (default), windows-874, windows-932, windows-936, windows-949, windows-950, win‐
             dows-1250, windows-1251, windows-1252, windows-1253, windows-1254, windows-1255, windows-1256, windows-1257 or windows-1258

     -b number_of_sectors
             the number of sectors to read at once (per chunk), options: 16, 32, 64 (default), 128, 256, 512, 1024, 2048, 4096, 8192, 16384 or
             32768

     -B number_of_bytes
             the number of bytes to acquire

     -c compression_values
             specify the compression values as: level or method:level compression method options: deflate (default), bzip2 (bzip2 is only sup‐
             ported by EWF2 formats) compression level options: none (default), empty-block, fast or best

     -C case_number
             the case number (default is case_number)

     -d digest_type
             calculate additional digest (hash) types besides md5, options: sha1, sha256

     -D description
             the description (default is description)

     -e examiner_name
             the examiner name (default is examiner_name)

     -E evidence_number
             the evidence number (default is evidence_number)

     -f format
             the EWF file format to write to, options: ftk, encase2, encase3, encase4, encase5, encase6 (default), encase7, linen5, linen6,
             linen7, ewfx.  libewf does not support streamed writes for other EWF formats.

     -h      shows this help

     -l log_filename
             logs acquiry errors and the digest (hash) to the log filename

     -m media_type
             the media type, options: fixed (default), removable, optical, memory

     -M media_flags
             the media flags, options: logical, physical (default)

     -N notes
             the notes (default is notes)

     -o offset
             the offset to start to acquire (default is 0)

     -p process_buffer_size
             the process buffer size (default is the chunk size)

     -P bytes_per_sector
             the number of bytes per sector (default is 512)

     -q      quiet shows minimal status information

     -s      swap byte pairs of the media data (from AB to BA) (use this for big to little endian conversion and vice versa)

     -S segment_file_size
             the segment file size in bytes (default is 1.4 GiB) (minimum is 1.0 MiB, maximum is 7.9 EiB for encase6 and encase7 format and 1.9
             GiB for other formats)

     -t target
             the target file (without extension) to write to (default is image)

     -v      verbose output to stderr

     -V      print version

     -x      use the chunk data instead of the buffered read and write functions.

     -2 secondary_target
             the secondary target file (without extension) to write to

     ewfacquirestream will read from stding until it encounters a read error.  On read error it will stop no error information is stored in the
     EWF file(s).

     Empty block compression detects blocks of sectors with entirely the same byte data and compresses them using the default compression level.

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     # ewfacquirestream -C 1 -D Floppy -E 1.1 -e 'John D.' -N 'Just a floppy in my system' -m removable -M logical -t floppy </dev/fd0
     ewfacquirestream 20120805

     Using the following acquiry parameters:
     Image path and filename:                floppy.E01
     Case number:                            1
     Description:                            Floppy
     Evidence number:                        1.1
     Examiner name:                          John D.
     Notes:                                  Just a floppy in my system
     Media type:                             removable
     Volume type:                            logical
     EWF file format:                        EnCase 5
     Compression method:                     deflate
     Compression level:                      none
     Acquiry start offet:                    0
     Number of bytes to acquire:             0 (until end of input)
     Evidence segment file size:             1.4 GiB (1572864000 bytes)
     Block size:                             64 sectors
     Error granularity:                      64 sectors
     Retries on read error:                  2

     Acquiry started at: Sun Aug  5 11:32:41 2012

     This could take a while.

     Status: acquired 1.4 MiB (1474560 bytes)
             in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     Acquiry completed at: Sun Aug  5 11:32:42 2012

     Written: 1.4 MiB (1474560 bytes) in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     MD5 hash calculated over data:          ae1ce8f5ac079d3ee93f97fe3792bda3

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
     ewfacquire(1), ewfexport(1), ewfinfo(1), ewfmount(1), ewfrecover(1), ewfverify(1)

libewf                                                           January 19, 2014                                                           libewf
