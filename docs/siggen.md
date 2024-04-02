SIGGEN(8)                                                     System Manager's Manual                                                    SIGGEN(8)

NAME
       siggen - signature gathering routine for Tripwire

SYNOPSIS
       siggen [ options... ] file1 [ file2... ]

       Options:

            -t         --terse
            -h         --hexadecimal
            -a         --all
            -C         --CRC32
            -M         --MD5
            -S         --SHA
            -H         --HAVAL

DESCRIPTION
       siggen is a utility that displays the hash function values for the specified files.

OPTIONS
       -t, --terse
              Terse mode.  Prints requested hashes for a given file on one line, delimited by spaces, with no extraneous information.

       -h, --hexadecimal
              Display results in hexadecimal rather than base64 notation.

       -a, --all
              Display all hash function values (default).

       -C, --CRC32
              Display CRC-32, POSIX 1003.2 compliant 32-bit Cyclic Redundancy Check.

       -M, --MD5
              Display MD5, the RSA Data Security, Inc. Message Digest Algorithm.

       -S, --SHA
              Display SHA, Tripwire's implementation of the NIST Secure Hash Standard, SHS (NIST FIPS 180).

       -H, --HAVAL
              Display Haval value, a 128-bit hash code.

       file1 [ file2... ]
              List of filesystem objects for which to display values.

VERSION INFORMATION
       This man page describes siggen version 2.4.

AUTHORS
       Tripwire, Inc.

COPYING PERMISSIONS
       Permission  is granted to make and distribute verbatim copies of this man page provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this man page under the conditions for verbatim  copying,  provided  that
       the entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission  is  granted to copy and distribute translations of this man page into another language, under the above conditions for modified
       versions, except that this permission notice may be stated in a translation approved by Tripwire, Inc.

       Copyright 2000 Tripwire, Inc. Tripwire is a registered trademark of Tripwire, Inc. in the United States and  other  countries.  All  rights
       reserved.

SEE ALSO
       twintro(8), tripwire(8), twadmin(8), twprint(8), twconfig(4), twpolicy(4), twfiles(5)

                                                                    1 July 2000                                                          SIGGEN(8)
