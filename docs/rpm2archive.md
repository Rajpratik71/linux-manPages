rpm2archive(8)                                                System Manager's Manual                                               rpm2archive(8)

NAME
       rpm2archive - Extract archive archive from RPM Package Manager (RPM) package.

SYNOPSIS
       rpm2archive [filename]

DESCRIPTION
       rpm2archive  converts the .rpm file specified as a single argument to a archive archive on standard out. If a '-' argument is given, an rpm
       stream is read from standard in.

       rpm2archive rpm-1.1-1.i386.rpm
       rpm2archive - < glint-1.0-1.i386.rpm
       rpm2archive glint-1.0-1.i386.rpm | tar tvf -

SEE ALSO
       rpm(8)

AUTHOR
       Erik Troan <ewt@redhat.com>

Red Hat, Inc.                                                     11 January 2001                                                   rpm2archive(8)
