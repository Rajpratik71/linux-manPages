affsegment(1)                                                segment manipulation tool                                               affsegment(1)

NAME
       affsegment - segment manipulation tool

SYNOPSIS
       affsegment [options] file1.aff [file2.aff ...]

DESCRIPTION
       This is a segment manipulation tool.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       Options:

              -c     Create AFF files if they do not exist.

              -ssegval
                     Sets the value of a segment; may be repeated.

              -psegname
                     Prints the contents of the segment name for each file.

              -V     Just print the version number and exit.

              -dname Delete segment 'name'.

              -h, -? Print this message.

              -Q     interpert 8-byte segments as a 64-bit value.

              -A     Print the 32-bit arg, not the segment value.

              -x     Print the segment as a hex string.

       Setting the segment values:

              -sname=-
                     Take the new value of segment 'name' from stdin.

              -sname=val
                     Sets segment 'name' to be 'val'.

              -sname=<val
                     Sets segment 'name' to be contents of file 'val'

       Setting the segment args:

              -sname/arg
                     Sets segment 'name' arg to be 'arg' (may be repeated).

       Setting both the segment value and the arg:

              -sname/arg=val
                     Sets both arg and val for segment 'name'.  -sname/arg=<file Sets the arg and take contents from file 'file'.

              -sname/arg=-
                     Sets the arg of segment 'name' and take the contents from stdin.

NOTES
       All deletions are done first, then all updates. Don't specify the same segment twice on one command line.

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsign(1),  affs‐
       tats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFSEGMENT 3.7.4                                                     Oct 2014                                                        affsegment(1)
