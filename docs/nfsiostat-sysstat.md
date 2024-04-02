NFSIOSTAT-SYSSTAT(1)                                                                         Linux User's Manual                                                                         NFSIOSTAT-SYSSTAT(1)



NAME
       nfsiostat-sysstat (the nfsiostat command from the sysstat package) - Report input/output statistics for network filesystems (NFS).

SYNOPSIS
       nfsiostat-sysstat [ -h ] [ -k | -m ] [ -t ] [ -V ] [ interval [ count ] ]

DESCRIPTION
       The nfsiostat-sysstat command displays statistics about read and write operations on NFS filesystems.

       The  interval  parameter  specifies  the amount of time in seconds between each report. The first report contains statistics for the time since system startup (boot). Each subsequent report contains
       statistics collected during the interval since the previous report.  A report consists of an NFS header row followed by a line of statistics for each network filesystem that is mounted.   The  count
       parameter  can  be specified in conjunction with the interval parameter. If the count parameter is specified, the value of count determines the number of reports generated at interval seconds apart.
       If the interval parameter is specified without the count parameter, the nfsiostat-sysstat command generates reports continuously.


REPORT
       The Network Filesystem (NFS) report provides statistics for each mounted network filesystem.  Transfer rates are shown in 1K blocks by default, unless the  environment  variable  POSIXLY_CORRECT  is
       set, in which case 512-byte blocks are used.  The report shows the following fields:

       Filesystem:
              This columns shows the hostname of the NFS server followed by a colon and by the directory name where the network filesystem is mounted.

       rBlk_nor/s (rkB_nor/s, rMB_nor)
              Indicate the number of blocks (kilobytes, megabytes) read by applications via the read(2) system call interface. A block has a size of 512 bytes.

       wBlk_nor/s (wkB_nor/s, wMB_nor/s)
              Indicate the number of blocks (kilobytes, megabytes) written by applications via the write(2) system call interface.

       rBlk_dir/s (rkB_dir/s, rMB_dir/s)
              Indicate the number of blocks (kilobytes, megabytes) read from files opened with the O_DIRECT flag.

       wBlk_dir/s (wkB_dir/s, wMB_dir/s)
              Indicate the number of blocks (kilobytes, megabytes) written to files opened with the O_DIRECT flag.

       rBlk_svr/s (rkB_svr/s, rMB_svr/s)
              Indicate the number of blocks (kilobytes, megabytes) read from the server by the NFS client via an NFS READ request.

       wBlk_svr/s (wkB_svr/s, wMB_svr/s)
              Indicate the number of blocks (kilobytes, megabytes) written to the server by the NFS client via an NFS WRITE request.

       ops/s
              Indicate the number of operations that were issued to the filesystem per second.

       rops/s
              Indicate the number of 'read' operations that were issued to the filesystem per second.

       wops/s
              Indicate the number of 'write' operations that were issued to the filesystem per second.

OPTIONS
       -h     Make the NFS report easier to read by a human.

       -k     Display statistics in kilobytes per second.

       -m     Display statistics in megabytes per second.

       -t     Print the time for each report displayed. The timestamp format may depend on the value of the S_TIME_FORMAT environment variable (see below).

       -V     Print version number then exit.


ENVIRONMENT
       The nfsiostat-sysstat command takes into account the following environment variables:


       S_TIME_FORMAT
              If  this  variable  exists and its value is ISO then the current locale will be ignored when printing the date in the report header. The nfsiostat-sysstat command will use the ISO 8601 format
              (YYYY-MM-DD) instead.  The timestamp displayed with option -t will also be compliant with ISO 8601 format.


       POSIXLY_CORRECT
              When this variable is set, transfer rates are shown in 512-byte blocks instead of the default 1K blocks.


BUG
       /proc filesystem must be mounted for nfsiostat-sysstat to work.


FILE
       /proc/self/mountstats contains statistics for network filesystems.


WARNING
       The nfsiostat command from the sysstat package (nfsiostat-sysstat) is now obsolete and is no longer maintained.  It will be removed in a future sysstat version.  Please use now the nfsiostat command
       from the nfs-utils package.


AUTHORS
       Written by Ivana Varekova (varekova <at> redhat.com)

       Maintained by Sebastien Godard (sysstat <at> orange.fr)

SEE ALSO
       nfsiostat(8), sar(1), pidstat(1), mpstat(1), vmstat(8), iostat(1), cifsiostat(1)

       http://pagesperso-orange.fr/sebastien.godard/



Linux                                                                                            JANUARY 2014                                                                            NFSIOSTAT-SYSSTAT(1)
