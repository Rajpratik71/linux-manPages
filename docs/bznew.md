BZNEW(1)                                                                                   General Commands Manual                                                                                   BZNEW(1)



NAME
       bznew -   recompress .gz or .tgz files to .bz2 files

SYNOPSIS
       bznew [ -ftv9PK] [ name.gz ...  ]

DESCRIPTION
       Bznew recompresses files from .gz (gzip) format to .bz2 (bzip2) format.  If you want to recompress a file already in bzip2 format, rename the file to force a .bz2 extension then apply bznew.

OPTIONS
       -f     Force recompression from .gz to .bz2 format even if a .bz2 file already exists.

       -t     Tests the new files before deleting originals.

       -v     Verbose. Display the name and percentage reduction for each file compressed.

       -9     Use the slowest compression method (optimal compression).

       -P     Use pipes for the conversion to reduce disk space usage.

       -K     Keep a .gz file when it is smaller than the .bz2 file

SEE ALSO
       bzip2(1), gzip(1)

BUGS
       Bznew does not maintain the time stamp with the -P option if cpmod(1) is not available and touch(1) does not support the -r option.



                                                                                                                                                                                                     BZNEW(1)
