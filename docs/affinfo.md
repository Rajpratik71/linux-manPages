affinfo(1)                                              print information about an AFF file                                             affinfo(1)

NAME
       affinfo - print information about an AFF file

SYNOPSIS
       affinfo [options] infile

DESCRIPTION
       Print information about an AFF file.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       General options:

              -a     Print ALL segments (normally data segments are suppressed).

              -b     Print how many bad blocks in each segment (implies -a).

              -i     Identify the files; don't do info on them.

              -w     Wide output; print more than 1 line if necessary.

              -s <segment>
                     Just print information about 'segment' (may be repeated).

              -m     Validate MD5 hash of entire image.

              -S     Validate SHA1 hash of entire image.

              -v     Validate the hash of each page (if present).

              -y     Don't print segments of lengths 16 and 20 as hex.

              -p<passphrase>
                     Specify <passphrase> to decrypt a file.

              -l     Just print the segment names and exit

              -V     Just print the version number and exit.

       Preview Options:

              -X     No data preview; just print the segment names.

              -x     Print binary values in hex (default is ASCII).

       Misc:

              -d     Debug.

              -A     If infile is a device, print the number of sectors and sector size to stdout in XML.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1),  affix(1),  affrecover(1),  affsegment(1),  affsign(1),
       affstats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFINFO 3.7.4                                                        Oct 2014                                                           affinfo(1)
