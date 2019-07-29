HDEL(1)                                                       General Commands Manual                                                      HDEL(1)

NAME
       hdel - delete both forks of an HFS file

SYNOPSIS
       hdel hfs-path [...]

DESCRIPTION
       hdel  deletes  files  from  the  current HFS volume. Both forks (resource and data) of each named file are removed, freeing space for other
       files.

SEE ALSO
       hfsutils(1), hrmdir(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            05-Apr-1996                                                            HDEL(1)
