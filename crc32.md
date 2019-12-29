CRC32(1)                                General Commands Manual                               CRC32(1)

NAME
       crc32 - compute CRC-32 checksums for the given files

SYNOPSIS
       crc32 filename [ filename ... ]

DESCRIPTION
       crc32 is a simple utility that calculates the CRC-32 checksum for each of the given files.

       Note  that  the CRC-32 checksum is merely used for error detection in transmission and storage.
       It is not intended to guard against the malicious modification of files  (i.e.,  it  is  not  a
       cryptographic hash).

       This utility is supplied with the Archive::Zip module for Perl.

SEE ALSO
       Archive::Zip(3pm).

AUTHOR
       The Archive::Zip module was written by Ned Konz.
       This  manual  page  was prepared by Ben Burton <bab@debian.org> for the Debian GNU/Linux system
       (but may be used by others).

                                             June 21, 2005                                    CRC32(1)
