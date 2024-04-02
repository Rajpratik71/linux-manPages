UZ(1)                                                                                     Mtools Users Manual                                                                                    UZ(1)

NAME
       uz - gunzips and extracts a gzip'd tar'd archive

SYNOPSIS
       uz file

DESCRIPTION
       uz  extracts  a  gzip'd tar'd archive, that is a tar(1) archive compressed with the gzip(1) utility.  It is not strictly necessary on Debian GNU/Linux, because the GNU tar(1) program provides
       the same capability with the command

       tar -xzf file

       but this utility is provided in the mtools package for other platforms and is retained here for completeness.

AUTHOR
       Robert King (Robert.King@mailbox.gu.edu.au) wrote this page for the Debian/GNU mtools package.

SEE ALSO
       mtools(1), gzip(1), tar(1), lz(1).

                                                                                     Wed Feb 23 00:00:00 EET 2000                                                                                UZ(1)
