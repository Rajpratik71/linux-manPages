affsign(1)                                                   sign an existing AFF file                                                  affsign(1)

NAME
       affsign - sign an existing AFF file

SYNOPSIS
       affcopy [options] file1 file
       affcopy [options] file1 file2 file3 ... dir
       affcopy [options] file1 file2 file3 ... dir1 dir2...

DESCRIPTION
       Sign an existing AFF file. This program will:

              ·  Sign each segment if there are no segment signatures.

              ·  Write signed chain-of-custody Bill of Materials segment.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       General options:

              -n     Ask for a chain-of-custody note.

              -v     Just print the version number and exit.

       Signature Options:

              -k filename.key
                     Specify private key for signing.

              -c filename.cer
                     Specify a X.509 certificate that matches the private key (by default, the file is assumed to be the same  one  provided  with
                     the -k option).

              -Z     ZAP (remove) all signature segments.

SEE ALSO
       affcat(1),  affcompare(1),  affconvert(1),  affcopy(1),  affcrypto(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1),
       affstats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFSIGN 3.7.4                                                        Oct 2014                                                           affsign(1)
