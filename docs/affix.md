affix(1)                                                     fix a corrupted AFF file                                                     affix(1)

NAME
       affix - fix a corrupted AFF file

SYNOPSIS
       affix [options] file1 file2 file3 ...

DESCRIPTION
       Fix an aff file that is corrupt. If file does not have a GUID, create one.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       -y     Actually modify the files; normally just reports the problems.

       -v     Just print the version number and exit.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1), affinfo(1), affrecover(1),  affsegment(1),  affsign(1),
       affstats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFIX 3.7.4                                                          Oct 2014                                                             affix(1)
