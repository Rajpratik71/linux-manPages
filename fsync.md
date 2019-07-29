FSYNC(1)                                                                                    The SuSE boot concept                                                                                    FSYNC(1)



NAME
       fsync - synchronize the specified file with storage device

SYNOPSIS
       fsync file

DESCRIPTION
       fsync synchronize the in-core state of the specified file with the storage device

BUGS
       The fsync program uses the fsync(2) function and therefore shows the same weaknesses by any system activity.

SEE ALSO
       fsync(2), fdatasync(2).

COPYRIGHT
       2007 Werner Fink, 2007 SuSE GmbH Nuernberg, Germany.

AUTHOR
       Werner Fink <werner@suse.de>



3rd Berkeley Distribution                                                                        Jun 18, 2007                                                                                        FSYNC(1)
