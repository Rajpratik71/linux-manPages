blkmapd(8)               System Manager's Manual              blkmapd(8)

NAME
       blkmapd - pNFS block layout mapping daemon

SYNOPSIS
       blkmapd [-d] [-f]

DESCRIPTION
       The  blkmapd daemon performs device discovery and mapping for the
       parallel NFS (pNFS) block layout client [RFC5663].

       The pNFS block layout protocol builds a complex storage hierarchy
       from a set of simple volumes.  These simple volumes are addressed
       by content, using a signature on the volume to uniquely name each
       one.   The daemon locates a volume by examining each block device
       in the system for the given signature.

       The topology typically consists of a hierarchy of  volumes  built
       by  striping, slicing, and concatenating the simple volumes.  The
       blkmapd daemon uses the device-mapper driver to construct logical
       devices  that  reflect  the  server  topology,  and  passes these
       devices to the kernel for use by the pNFS block layout client.

OPTIONS
       -d     Performs device discovery only then exits.

       -f     Runs blkmapd in the foreground and sends output to  stderr
              (as opposed to syslogd)

SEE ALSO
       nfs(5), dmsetup(8)

       RFC 5661 for the NFS version 4.1 specification.
       RFC 5663 for the pNFS block layout specification.

AUTHORS
       Haiying Tang <Tang_Haiying@emc.com>
       Jim Rees <rees@umich.edu>

                             11 August 2011                   blkmapd(8)
