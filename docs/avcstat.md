avcstat(8)                                                                            SELinux Command Line documentation                                                                           avcstat(8)



NAME
       avcstat - Display SELinux AVC statistics

SYNOPSIS
       avcstat [-c] [-f status_file] [interval]

DESCRIPTION
       Display SELinux AVC statistics.  If the interval parameter is specified, the program will loop, displaying updated statistics every interval seconds.  Relative values are displayed by default.

OPTIONS
       -c     Display the cumulative values.

       -f     Specifies the location of the AVC statistics file, defaulting to /sys/fs/selinux/avc/cache_stats.

AUTHOR
       This manual page was written by Dan Walsh <dwalsh@redhat.com>.  The program was written by James Morris <jmorris@redhat.com>.

SEE ALSO
       selinux(8)



dwalsh@redhat.com                                                                                18 Nov 2004                                                                                       avcstat(8)
