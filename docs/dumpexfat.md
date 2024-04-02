DUMPEXFAT(8)                                                                     System Manager's Manual                                                                     DUMPEXFAT(8)

NAME
       dumpexfat - dump exFAT file system

SYNOPSIS
       dumpexfat [ -s ] [ -u ] [ -f file ] [ -V ] device

DESCRIPTION
       dumpexfat dumps details about exFAT file system including low-level info. All sizes are in bytes.

OPTIONS
       Command line options available:

       -s     Dump only info from super block. May be useful for heavily corrupted file systems.

       -u     Dump ranges of used sectors starting from 0 and separated with spaces. May be useful for backup tools.

       -f file
              Print  out  a  list of fragments that compose the given file. Each fragment is printed on its own line, as the start offset (in bytes) into the file system, and the length
              (in bytes).

       -V     Print version and copyright.

EXIT CODES
       Zero is returned on success. Any other code means an error.

AUTHOR
       Andrew Nayenko

SEE ALSO
       mkexfatfs(8)

                                                                                        July 2016                                                                            DUMPEXFAT(8)
