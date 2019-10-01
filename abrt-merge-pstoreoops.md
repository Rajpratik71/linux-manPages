ABRT-MERGE-PSTOREO(1)                                                                            ABRT Manual                                                                            ABRT-MERGE-PSTOREO(1)



NAME
       abrt-merge-pstoreoops - Scans files for split oops message. Can print and/or delete them.

SYNOPSIS
       abrt-merge-pstoreoops [-v] [-od] FILE...

DESCRIPTION
       This tool takes list of files, reads all of the files, scans them for split oops messages and join oops parts to original oops message.

OPTIONS
       -o
           Print found oopses

       -d
           Delete files with found oopses

       -v, --verbose
           Be more verbose. Can be given multiple times.

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-MERGE-PSTOREO(1)
