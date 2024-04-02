affstats(1)                                    print specific statistics about one or more AFF files                                   affstats(1)

NAME
       affstats - print specific statistics about one or more AFF files

SYNOPSIS
       affstats [options] file
       affstats [options] file1 file2 file3

DESCRIPTION
       Print  specific statistics about one or more AFF files. Ideally, the stats can be gotten from the metadata, but this program will calculate
       it if necessary.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF is an open and extensible file format to store disk images and associated metadata. It is useful  in  several  scenaries,  as  computer
       forensics investigations.

OPTIONS
       -m     Print all output in megabytes.

       -v     Just print the version number and exit.

SEE ALSO
       affcat(1),  affcompare(1),  affconvert(1),  affcopy(1),  affcrypto(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1),
       affsign(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFSTATS 3.7.4                                                       Oct 2014                                                          affstats(1)
