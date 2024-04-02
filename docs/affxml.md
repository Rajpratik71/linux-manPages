affxml(1)                                                  print AFF information as XML                                                  affxml(1)

NAME
       affxml - print AFF information as XML

SYNOPSIS
       affxml [options] infile

DESCRIPTION
       Print AFF information as XML.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       -j <segname>
              Just print information about segname (may be repeated).

       -s     Output 'stats' for the file data (may a long time).

       -V     Just print the version number and exit.

       -x     Don't include the infile filename in output.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1),  affinfo(1),  affix(1),  affrecover(1),  affsegment(1),
       affsign(1), affstats(1), affuse(1), affverify(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFXML 3.7.4                                                         Oct 2014                                                            affxml(1)
