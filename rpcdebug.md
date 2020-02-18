rpcdebug(8)              System Manager's Manual             rpcdebug(8)

NAME
       rpcdebug - set and clear NFS and RPC kernel debug flags

SYNOPSIS
       rpcdebug -vh
       rpcdebug -m module
       rpcdebug -m module -s flags...
       rpcdebug -m module -c flags...

DESCRIPTION
       The rpcdebug command allows an administrator to set and clear the
       Linux kernel's NFS client and server debug flags.  Setting  these
       flags  causes  the  kernel  to emit messages to the system log in
       response to NFS activity; this is typically useful when debugging
       NFS problems.

       The  first form in the synopsis can be used to list all available
       debug flags.  The second form shows the currently set debug flags
       for the given module.  The third form sets one or more flags, and
       the fourth form clears one or more flags.

       The value all may be used to set or clear all the flags  for  the
       given module.

OPTIONS
       -c     Clear the given debug flags.

       -h     Print  a help message and exit.  When combined with the -v
              option, also prints the available debug flags.

       -m module
              Specify which module's flags to set or  clear.   Available
              modules are:

              nfsd   The NFS server.

              nfs    The NFS client.

              nlm    The  Network  Lock Manager, in either an NFS client
                     or server.

              rpc    The Remote Procedure Call module, in either an  NFS
                     client or server.

       -s     Set the given debug flags.

       -v     Increase the verbosity of rpcdebug's output.

FILES
       /proc/sys/sunrpc/{rpc,nfs,nfsd,nlm}_debug
              procfs-based interface to kernel debug flags.

SEE ALSO
       rpc.nfsd(8), nfs(5), syslogd(8).

BUGS
       Bugs can be found or reported at http://nfs.sf.net/.

AUTHOR
       Program    by    Olaf    Kirch    <okir@suse.de>    and    <fred‐
       eric.jolly@bull.ext.net>.   Manpage  by  Greg   Banks   <gnb@mel‐
       bourne.sgi.com>.

                               5 Jul 2006                    rpcdebug(8)
