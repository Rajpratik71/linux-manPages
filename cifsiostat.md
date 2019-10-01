CIFSIOSTAT(1)                                                                                Linux User's Manual                                                                                CIFSIOSTAT(1)



NAME
       cifsiostat - Report CIFS statistics.

SYNOPSIS
       cifsiostat [ -h ] [ -k | -m ] [ -t ] [ -V ] [ interval [ count ] ]

DESCRIPTION
       The cifsiostat command displays statistics about read and write operations on CIFS filesystems.

       The  interval  parameter  specifies  the amount of time in seconds between each report. The first report contains statistics for the time since system startup (boot). Each subsequent report contains
       statistics collected during the interval since the previous report.  A report consists of a CIFS header row followed by a line of statistics for each CIFS filesystem  that  is  mounted.   The  count
       parameter  can  be specified in conjunction with the interval parameter. If the count parameter is specified, the value of count determines the number of reports generated at interval seconds apart.
       If the interval parameter is specified without the count parameter, the cifsiostat command generates reports continuously.


REPORT
       The CIFS report provides statistics for each mounted CIFS filesystem.  The report shows the following fields:

       Filesystem:
              This columns shows the mount point of the CIFS filesystem.

       rB/s (rkB/s, rMB/s)
              Indicate the average number of bytes (kilobytes, megabytes) read per second.

       wB/s (wkB/s, wMB/s)
              Indicate the average number of bytes (kilobytes, megabytes) written per second.

       rop/s
              Indicate the number of 'read' operations that were issued to the filesystem per second.

       wop/s
              Indicate the number of 'write' operations that were issued to the filesystem per second.

       fo/s
              Indicate the number of open files per second.

       fc/s
              Indicate the number of closed files per second.

       fd/s
              Indicate the number of deleted files per second.

OPTIONS
       -h     Make the CIFS report easier to read by a human.

       -k     Display statistics in kilobytes per second.

       -m     Display statistics in megabytes per second.

       -t     Print the time for each report displayed. The timestamp format may depend on the value of the S_TIME_FORMAT environment variable (see below).

       -V     Print version number then exit.


ENVIRONMENT
       The cifsiostat command takes into account the following environment variables:


       S_TIME_FORMAT
              If this variable exists and its value is ISO then the current locale will be ignored when printing the date in the report header. The nfsiostat command will use the ISO 8601 format  (YYYY-MM-
              DD) instead.  The timestamp displayed with option -t will also be compliant with ISO 8601 format.


BUG
       /proc filesystem must be mounted for cifsiostat to work.


FILE
       /proc/fs/cifs/Stats contains CIFS statistics.

AUTHORS
       Written by Ivana Varekova (varekova <at> redhat.com)

       Maintained by Sebastien Godard (sysstat <at> orange.fr)

SEE ALSO
       sar(1), pidstat(1), mpstat(1), vmstat(8), iostat(1), nfsiostat(1)

       http://pagesperso-orange.fr/sebastien.godard/



Linux                                                                                             JULY 2012                                                                                     CIFSIOSTAT(1)
