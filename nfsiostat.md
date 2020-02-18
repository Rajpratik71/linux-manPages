nfsiostat(8)             System Manager's Manual            nfsiostat(8)

NAME
       nfsiostat   -   Emulate   iostat   for  NFS  mount  points  using
       /proc/self/mountstats

SYNOPSIS
       nfsiostat [[<interval>] [<count>]] [<options>][<mount_point>]

DESCRIPTION
       The nfsiostat command displays NFS client per-mount statisitics.

       <interval>
              specifies the amount  of  time  in  seconds  between  each
              report.  The first report contains statistics for the time
              since each  file  system  was  mounted.   Each  subsequent
              report  contains  statistics collected during the interval
              since the previous report.

       <count>
              If the  <count>  parameter  is  specified,  the  value  of
              <count>  determines  the  number  of  reports generated at
              <interval> seconds apart. if  the  interval  parameter  is
              specified  without the <count> parameter, the command gen‐
              erates reports continuously.

       <options>
              Define below

       <mount_point>
              If one or more <mount point> names are specified,  statis‐
              tics  for only these mount points will be displayed.  Oth‐
              erwise, all NFS mount points on the client are listed.

OPTIONS
       -a  or  --attr
              displays statistics related to the attribute cache

       -d  or  --dir
              displays statistics related to directory operations

       -h  or  --help
              shows help message and exit

       -l LIST or  --list=LIST
              only print stats for first LIST mount points

       -p  or  --page
              displays statistics related to the page cache

       -s  or  --sort
              Sort NFS mount points by ops/second

       --version
              show program's version number and exit

FILES
       /proc/self/mountstats

SEE ALSO
       iostat(8), mountstats(8), nfsstat(8)

AUTHOR
       Chuck Lever <chuck.lever@oracle.com>

                               15 Apr 2010                  nfsiostat(8)
