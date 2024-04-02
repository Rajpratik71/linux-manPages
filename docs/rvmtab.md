RVMTAB(8)                                                                                   The SuSE boot concept                                                                                   RVMTAB(8)



RVMTAB
       Rvmtab - Sort /proc/mounts in the order of /proc/self/mountinfo

SYNOPSIS
       rvmtab

DESCRIPTION
       rvmtab  will list out the content of /proc/mounts sorted first of all in the reverse order of the parent IDs found in /proc/self/mountinfo and then in a second sub sort in the reverse order of mount
       IDs also found in /proc/self/mountinfo.

OPTIONS
       Currently rvmtab does not know about any option.

EXAMPLES
       rvmtab

RETURN VALUE
       Beside permsissions and and alloc errors rvmtab always returns success.

FILES
       /proc/ path to the proc file system (see proc(5)).

       /proc/mounts
              this file contains of a list of all the file systems currently mounted.

       /proc/self/mountinfo
              this file contains information about mount points like the unique mount ID.

SEE ALSO
       proc(5),

COPYRIGHT
       2011 Werner Fink, 2011 SUSE LINUX Products GmbH, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Feb 01, 2011                                                                                       RVMTAB(8)
