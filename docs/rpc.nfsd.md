rpc.nfsd(8)                                                                                System Manager's Manual                                                                                rpc.nfsd(8)



NAME
       rpc.nfsd - NFS server process

SYNOPSIS
       /usr/sbin/rpc.nfsd [options] nproc

DESCRIPTION
       The  rpc.nfsd program implements the user level part of the NFS service. The main functionality is handled by the nfsd kernel module. The user space program merely specifies what sort of sockets the
       kernel service should listen on, what NFS versions it should support, and how many kernel threads it should use.

       The rpc.mountd server provides an ancillary service needed to satisfy mount requests by NFS clients.

OPTIONS
       -d  or  --debug
              enable logging of debugging messages

       -H  or  --host hostname
              specify a particular hostname (or address) that NFS requests will be accepted on. By default, rpc.nfsd will accept NFS requests on all known network addresses.  Note that  lockd  (which  per-
              forms file locking services for NFS) may still accept request on all known network addresses.  This may change in future releases of the Linux Kernel. This option can be used multiple time to
              listen to more than one interface.

       -p  or  --port port
              specify a different port to listen on for NFS requests. By default, rpc.nfsd will listen on port 2049.

       -r  or  --rdma
              specify that NFS requests on the standard RDMA port ("nfsrdma", port 20049) should be honored.

       --rdma=port
              Listen for RDMA requests on an alternate port - may be a number or a name listed in /etc/services.

       -N  or  --no-nfs-version vers
              This option can be used to request that rpc.nfsd does not offer certain versions of NFS. The current version of rpc.nfsd can support NFS versions 2,3,4 and the newer version 4.1.

       -s  or  --syslog
              By default, rpc.nfsd logs error messages (and debug messages, if enabled) to stderr. This option makes rpc.nfsd log these messages to syslog  instead.  Note  that  errors  encountered  during
              option processing will still be logged to stderr regardless of this option.

       -T  or  --no-tcp
              Disable rpc.nfsd from accepting TCP connections from clients.

       -U  or  --no-udp
              Disable rpc.nfsd from accepting UDP connections from clients.

       -V  or  --nfs-version vers
              This option can be used to request that rpc.nfsd offer certain versions of NFS. The current version of rpc.nfsd can support NFS versions 2,3,4 and the newer version 4.1.

       -L  or  --lease-time seconds
              Set the lease-time used for NFSv4.  This corresponds to how often clients need to confirm their state with the server. Valid range is from 10 to 3600 seconds.

       -G  or  --grace-time seconds
              Set the grace-time used for NFSv4 and NLM (for NFSv2 and NFSv3).  New file open requests (NFSv4) and new file locks (NLM) will not be allowed until after this time has passed to allow clients
              to recover state.

       nproc  specify the number of NFS server threads. By default, just one thread is started. However, for optimum performance several threads should be used. The actual figure depends on the  number  of
              and the work load created by the NFS clients, but a useful starting point is 8 threads. Effects of modifying that number can be checked using the nfsstat(8) program.

       Note  that  if the NFS server is already running, then the options for specifying host, port, and protocol will be ignored.  The number of processes given will be the only option considered, and the
       number of active nfsd processes will be increased or decreased to match this number.  In particular rpc.nfsd 0 will stop all threads and thus close any open connections.


NOTES
       If the program is built with TI-RPC support, it will enable any protocol and address family combinations that are marked visible in the netconfig database.


SEE ALSO
       rpc.mountd(8), exports(5), exportfs(8), rpc.rquotad(8), nfsstat(8), netconfig(5).

AUTHOR
       Olaf Kirch, Bill Hawes, H. J. Lu, G. Allan Morris III, and a host of others.



                                                                                                 20 Feb 2014                                                                                      rpc.nfsd(8)
