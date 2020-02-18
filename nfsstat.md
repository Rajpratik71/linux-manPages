nfsstat(8)               System Manager's Manual              nfsstat(8)

NAME
       nfsstat - list NFS statistics

SYNOPSIS
       nfsstat [OPTION]...

DESCRIPTION
       The  nfsstat displays statistics kept about NFS client and server
       activity.

OPTIONS
       -s, --server
              Print only server-side statistics. The default is to print
              both server and client statistics.

       -c, --client
              Print only client-side statistics.

       -n, --nfs
              Print  only  NFS  statistics. The default is to print both
              NFS and RPC information.

       -2     Print only NFS v2 statistics. The default is to only print
              information  about  the versions of NFS that have non-zero
              counts.

       -3     Print only NFS v3 statistics. The default is to only print
              information  about  the versions of NFS that have non-zero
              counts.

       -4     Print only NFS v4 statistics. The default is to only print
              information  about  the versions of NFS that have non-zero
              counts.

       -m, --mounts
              Print information about each of the mounted NFS file  sys‐
              tems.

              If this option is used, all other options are ignored.

       -r, --rpc
              Print only RPC statistics.

       -o facility
              Display  statistics for the specified facility, which must
              be one of:

              nfs    NFS protocol information, split up by RPC call.

              rpc    General RPC information.

              net    Network layer statistics, such  as  the  number  of
                     received packets, number of TCP connections, etc.

              fh     Usage  information  on  the  server's  file  handle
                     cache, including the total number of  lookups,  and
                     the number of hits and misses.

              rc     Usage  information  on  the  server's request reply
                     cache, including the total number of  lookups,  and
                     the number of hits and misses.

              all    Display all of the above facilities.

       -v, --verbose
              This is equivalent to -o all.

       -l, --list
              Print information in list form.

       -S, --since file
              Instead  of  printing  current statistics, nfsstat imports
              statistics from file and displays the  difference  between
              those  and  the current statistics.  Valid input files may
              be in the form of /proc/net/rpc/nfs  (raw  client  stats),
              /proc/net/rpc/nfsd  (raw  server  stats),  or saved output
              from nfsstat itself (client and/or  server  stats).    Any
              statistics  missing  from  a saved nfsstat output file are
              treated as zeroes.

       -Z[interval], --sleep=[interval]
              Instead of printing  current  statistics  and  immediately
              exiting,  nfsstat  takes a snapshot of the current statis‐
              tics and pauses until it receives SIGINT  (typically  from
              Ctrl-C), at which point it takes another snapshot and dis‐
              plays the difference between  the  two.   If  interval  is
              specified, nfsstat will print the number of NFS calls made
              since the previous report.  Stats will be printed  repeat‐
              edly every interval seconds.

EXAMPLES
       nfsstat -o all -234
              Show all information about all versions of NFS.

       nfsstat --verbose -234
              Same as above.

       nfsstat -o all
              Show all information about active versions of NFS.

       nfsstat --nfs --server -3
              Show statistics for NFS version 3 server.

       nfsstat -m
              Show information about mounted NFS filesystems.

DISPLAY
       The Flags output from the -m option is the same as the flags give
       to the mount command.

FILES
       /proc/net/rpc/nfsd
              procfs-based interface to kernel NFS server statistics.

       /proc/net/rpc/nfs
              procfs-based interface to kernel NFS client statistics.

       /proc/mounts
              procfs-based interface to the mounted filesystems.

SEE ALSO
       rpc.nfsd(8).  nfs(5).

BUGS
       The default output has been changed.  To get the old default out‐
       put you must run nfsstat --auto -2.

       The function of the -v and -a options have changed. The -a option
       is now reserved for future use. The -v does what  the  -a  option
       used to do, and the new -[234] options replace the -v option.

       The Display section should be more complete.

       Further bugs can be found or reported at http://nfs.sf.net/.

AUTHOR
       Olaf Kirch, <okir@suse.de>

                               7 Aug 2007                     nfsstat(8)
