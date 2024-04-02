ewfacquire                                                             LOCAL                                                            ewfacquire

NAME
     ewfacquire — acquires data in the EWF format

SYNOPSIS
     ewfacquire [-A codepage] [-b number_of_sectors] [-B number_of_bytes] [-c compression_values] [-C case_number] [-d digest_type]
                [-D description] [-e examiner_name] [-E evidence_number] [-f format] [-g number_of_sectors] [-l log_filename] [-m media_type]
                [-M media_flags] [-N notes] [-o offset] [-p process_buffer_size] [-P bytes_per_sector] [-r read_error_retries]
                [-S segment_file_size] [-t target] [-T toc_file] [-2 secondary_target] [-hqRsuvVwx] source

DESCRIPTION
     ewfacquire is a utility to acquire media data from a source and store it in EWF format (Expert Witness Compression Format).  ewfacquire
     acquires media data in a format equivalent to EnCase and FTK imager, including meta data. Under Linux, FreeBSD, NetBSD, OpenBSD, MacOS-X/Dar‐
     win ewfacquire supports reading directly from device files. On other platforms ewfacquire can convert a raw (dd) image into the EWF format.

     ewfacquire is part of the libewf package.  libewf is a library to access the Expert Witness Compression Format (EWF).

     source the source file(s) or device

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
             the EWF file format to write to, options: ewf, smart, ftk, encase1, encase2, encase3, encase4, encase5, encase6 (default), encase7,
             linen5, linen6, linen7, ewfx.

     -g number_of_sectors
             the number of sectors to be used as error granularity

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
             the number of bytes per sector (default is 512) (use this to override the automatic bytes per sector detection)

     -q      quiet shows minimal status information

     -r read_error_retries
             the number of retries when a read error occurs (default is 2)

     -R      resume acquiry at a safe point

     -s      swap byte pairs of the media data (from AB to BA) (use this for big to little endian conversion and vice versa)

     -S segment_file_size
             the segment file size in bytes (default is 1.4 GiB) (minimum is 1.0 MiB, maximum is 7.9 EiB for encase6 and encase7 format and 1.9
             GiB for other formats)

     -t target
             the target file (without extension) to write to (default is image)

     -T toc_file
             specify the file containing the table of contents (TOC) of an optical disc. The TOC file must be in the CUE format.

     -u      unattended mode (disables user interaction)

     -v      verbose output to stderr

     -V      print version

     -w      zero sectors on read error (mimic EnCase like behavior)

     -x      use the chunk data instead of the buffered read and write functions.

     -2 secondary_target
             the secondary target file (without extension) to write to

     ewfacquire will read from a file or device until it encounters a read error. On read error it will retry the number of retries specified. If
     ewfacquire still is unable to read and, if specified, it will zero (wipe) the the remainder of the number of sectors specified as error gran‐
     ularity. If ewfacquire should mimic EnCase it will zero all of sectors specified as error granularity.

     Empty block compression detects blocks of sectors with entirely the same byte data and compresses them using the default compression level.

     The encase6 and encase7 format allows for segment files greater than 2 GiB (2147483648 bytes).

ENVIRONMENT
     None

FILES
     None

EXAMPLES
     ewfacquire can either image devices, (split) RAW image file(s) or optical disc (split) RAW image files.  ewfacquire will try to detect device
     information, but results may vary per platform.  In attended mode (default) ewfacquire will ask for the information it requires.

   To image a floppy:
     # ewfacquire /dev/fd0
     ewfacquire 20120805

     Device information:
     Bus type:
     Vendor:                                 Y-E DATA
     Model:                                  USB-FDU
     Serial:

     Storage media information:
     Type:                                   Device
     Media size:                             1.4 MB (1474560 bytes)
     Bytes per sector:                       512

     Information about acquiry required, please provide the necessary input
     Image path and filename without extension: floppy
     Case number: 1
     Description: Floppy
     Evidence number: 1.1
     Examiner name: John D.
     Notes: Just a floppy in my system
     Media type (fixed, removable, optical, memory) [fixed]: removable
     Media characteristics (logical, physical) [logical]:
     Use EWF file format (smart, ftk, encase1, encase2, encase3, encase4, encase5, encase6, encase7, linen5, linen6, linen7, ewfx) [encase6]: encase5
     Compression method (deflate) [deflate]:
     Compression level (none, empty-block, fast, best) [none]:
     Start to acquire at offset (0 <= value <= 1474560) [0]:
     The number of bytes to acquire (0 <= value <= 1474560) [1474560]:
     Evidence segment file size in bytes (1.0 MiB <= value <= 1.9 GiB) [1.4 GiB]:
     The number of bytes per sector (1 <= value <= 4294967295) [512]:
     The number of sectors to read at once (16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768) [64]:
     The number of sectors to be used as error granularity (1 <= value <= 64) [64]:
     The number of retries when a read error occurs (0 <= value <= 255) [2]:
     Zero sectors on read error (mimic EnCase like behavior) (yes, no) [no]:

     The following information was provided:
     Image path and filename:                floppy.E01
     Case number:                            1
     Description:                            Floppy
     Evidence number:                        1.1
     Examiner name:                          John D.
     Notes:                                  Just a floppy in my system
     Media type:                             removable
     Is physical:                            no
     EWF file format:                        Encase 5 (.E01)
     Compression method:                     deflate
     Compression level:                      none
     Acquiry start offset:                   0
     Number of bytes to acquire:             1.4 MiB (1474560 bytes)
     Evidence segment file size:             1.4 GiB (1572864000 bytes)
     Bytes per sector:                       512
     Block size:                             64 sectors
     Error granularity:                      64 sectors
     Retries on read error:                  2
     Zero sectors on read error:             no

     Continue acquiry with these values (yes, no) [yes]:

     Acquiry started at: Sun Aug  5 11:32:41 2012

     This could take a while.

     Status: at 2%.
             acquired 32 kB (32768 bytes) of total 1.4 MiB (1474560 bytes).

           ...

     Status: at 100%.
             acquired 1.4 MiB (1474560 bytes) of total 1.4 MiB (1474560 bytes).
             completion in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     Acquiry completed at: Sun Aug  5 11:32:42 2012

     Written: 1.4 MiB (1474560 bytes) in 1 second(s) with 1 MiB/s (1474560 bytes/second).

     MD5 hash calculated over data:          ae1ce8f5ac079d3ee93f97fe3792bda3

   To convert a split RAW image into an EWF image:
     # ewfacquire usb256.raw.0??
     ewfacquire 20120805

     Storage media information:
     Type:                                   RAW image
     Media size:                             262 MB (262144000 bytes)
     Bytes per sector:                       512

           ...

   To convert an optical disc RAW image with a table of contents file into an EWF image:
     # ewfacquire -T cdrom.cue cdrom.iso
     ewfacquire 20120805

     Storage media information:
     Type:                                   Optical disc RAW image
     Media size:                             42 MB (42885120 bytes)
     Bytes per sector:                       2048
     Sessions:
             total number: 2
             at sector(s): 0 - 20619 number: 20620
             at sector(s): 20620 - 20939 number: 320

           ...

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
     ewfacquirestream(1), ewfexport(1), ewfinfo(1), ewfmount(1), ewfrecover(1), ewfverify(1)

libewf                                                           January 19, 2014                                                           libewf
