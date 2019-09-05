TGZ(1)                                                                                    Mtools Users Manual                                                                                   TGZ(1)

NAME
       tgz - makes a gzip'd tar archive

SYNOPSIS
       tgz [ destination [ source ...  ] ]

DESCRIPTION
       Make  a  gzip'd tar archive with the name of the first parameter out of specified files or, if no source files are specified, from everything in the current directory.  If the first parameter
       is omitted as well, the archive will be written to stdout.

BUGS
       tgz requires gzip in the user's path.  It also needs gnu tar or something close due to use of --exclude, --totals and -S.

AUTHOR
       Filip Van Raemdonck (mechanix@debian.org) wrote this page for the Debian/GNU mtools package.

SEE ALSO
       gzip(1), tar(1)

mtools 3.9.8                                                                                   May 2002                                                                                         TGZ(1)
