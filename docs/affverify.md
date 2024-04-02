affverify(1)                                       verify the digital signature on a signed file                                      affverify(1)

NAME
       affverify - verify the digital signature on a signed file

SYNOPSIS
       affverify [options] filename.aff

DESCRIPTION
       Verify the digital signature on a signed file.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       -a     Print all segments.

       -V     Just print the version number and exit.

       -v     Verbose.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1),  affinfo(1),  affix(1),  affrecover(1),  affsegment(1),
       affsign(1), affstats(1), affuse(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFVERIFY 3.7.4                                                      Oct 2014                                                         affverify(1)
