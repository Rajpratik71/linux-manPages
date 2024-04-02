SFPARSE(1)                                                     GNUstep System Manual                                                    SFPARSE(1)

NAME
       sfparse - string file parse

SYNOPSIS
       sfparse [ --utf8 | --unicode ] filename

DESCRIPTION
       This tool has two different functions.  When invoked with just a filename as argument, it checks that a file is a valid strings-file, which
       basically amounts to seeing whether the file is in proper serialized NSDictionary format (type "defaults plist" for info on this).

       On the other hand, if one of the two options is given, no such checking is performed, but the file IS converted into the named encoding.

OPTIONS
       --unicode    - convert an ASCII or UTF8 file to Unicode

       --utf8       - convert an ASCII or Unicode to UTF8

HISTORY
       Written in 1999.

       This manual page first appeared in gnustep-base 1.9.2 (March 2004).

AUTHORS
       sfparse was written by Richard Frith-Macdonald <rfm@gnu.org>

GNUstep                                                            February 2004                                                        SFPARSE(1)
