ABRT-HARVEST-PSTOR(1)                                                                            ABRT Manual                                                                            ABRT-HARVEST-PSTOR(1)



NAME
       abrt-harvest-pstoreoops - Reconstruct oops from /sys/fs/pstore/* files, create ABRT problems and remove the files

SYNOPSIS
       abrt-harvest-pstoreoops

DESCRIPTION
       This script is meant to be run once at system startup after abrtd is up and running. It scans /sys/fs/pstore/*, reconstructs oops text(s) from these files, creates ABRT problem directories from
       them, then removes the files (pstore storage is a limited resource).

SEE ALSO
       abrt-merge-pstoreoops(1)

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-HARVEST-PSTOR(1)
