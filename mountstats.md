mountstats(8)            System Manager's Manual           mountstats(8)

NAME
       mountstats - Displays NFS client per-mount statistics

SYNOPSIS
       mountstats [<options>] <mount_point> [ <mount_point>]

DESCRIPTION
       The  mountstats  command  displays NFS client statisitics on each
       given <mount_point>

OPTIONS
        --nfs display only the NFS statistics

        --rpc display only the RPC statistics

        --version
              display the version of this command

FILES
       /proc/self/mountstats

SEE ALSO
       iostat(8), nfsiostat(8), nfsstat(8)

AUTHOR
       Chuck Lever <chuck.lever@oracle.com>

                               15 Apr 2010                 mountstats(8)
