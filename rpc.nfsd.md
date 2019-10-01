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
              specify a particular hostname (or address) that NFS requests will be accepted on. By default, rpc.nfsd will accept NFS requests on all known network addresses.  Note that  lockd  (which  per‐
              forms file locking services for NFS) may still accept request on all known network addresses.  This may change in future releases of the Linux Kernel. This option can be used multiple time to
              listen to more than one interface.

       -p  or  --port port
              specify a different port to listen on for NFS requests. By default, rpc.nfsd will listen on port 2049.

       -r  or  --rdma
              specify that NFS requests on the standard RDMA port ("nfsrdma", port 20049) should be honored.

       --rdma=port
              Listen for RDMA requests on an alternate port - may be a number or a name listed in /etc/services.

       -N  or  --no-nfs-version vers
              This option can be used to request that rpc.nfsd does not offer certain versions of NFS. The current version of rpc.nfsd can support major NFS versions 2,3,4 and the minor versions  4.0,  4.1
              and 4.2.

       -s  or  --syslog
              By  default,  rpc.nfsd  logs  error  messages  (and debug messages, if enabled) to stderr. This option makes rpc.nfsd log these messages to syslog instead. Note that errors encountered during
              option processing will still be logged to stderr regardless of this option.

       -T  or  --no-tcp
              Disable rpc.nfsd from accepting TCP connections from clients.

       -U  or  --no-udp
              Disable rpc.nfsd from accepting UDP connections from clients.

       -V  or  --nfs-version vers
              This option can be used to request that rpc.nfsd offer certain versions of NFS. The current version of rpc.nfsd can support major NFS versions 2,3,4 and the minor versions 4.0, 4.1 and 4.2.

       -L  or  --lease-time seconds
              Set the lease-time used for NFSv4.  This corresponds to how often clients need to confirm their state with the server. Valid range is from 10 to 3600 seconds.

       -G  or  --grace-time seconds
              Set the grace-time used for NFSv4 and NLM (for NFSv2 and NFSv3).  New file open requests (NFSv4) and new file locks (NLM) will not be allowed until after this time has passed to allow clients
              to recover state.

       nproc  specify  the  number  of NFS server threads. By default, eight threads are started. However, for optimum performance several threads should be used. The actual figure depends on the number of
              and the work load created by the NFS clients, but a useful starting point is eight threads. Effects of modifying that number can be checked using the nfsstat(8) program.

       Note that if the NFS server is already running, then the options for specifying host, port, and protocol will be ignored.  The number of processes given will be the only option considered,  and  the
       number of active nfsd processes will be increased or decreased to match this number.  In particular rpc.nfsd 0 will stop all threads and thus close any open connections.


CONFIGURATION FILE
       Many of the options that can be set on the command line can also be controlled through values set in the [nfsd] section of the /etc/nfs.conf configuration file.  Values recognized include:

       threads
              The number of threads to start.

       host   A host name, or comma separated list of host names, that rpc.nfsd will listen on.  Use of the --host option replaces all host names listed here.

       grace-time
              The grace time, for both NFSv4 and NLM, in seconds.

       lease-time
              The lease time for NFSv4, in seconds.

       port   Set the port for TCP/UDP to bind to.

       rdma   Set RDMA port.  Use "rdma=nfsrdma" to enable standard port.

       UDP    Enable (with "on" or "yes" etc) or disable ("off", "no") UDP support.

       TCP    Enable or disable TCP support.

       vers2

       vers3

       vers4  Enable or disable a major NFS version.  3 and 4 are normally enabled by default.

       vers4.1

       vers4.2
              Setting  these  to  "off"  or similar will disable the selected minor versions.  Setting to "on" will enable them.  The default values are determined by the kernel, and usually minor versions
              default to being enabled once the implementation is sufficiently complete.


NOTES
       If the program is built with TI-RPC support, it will enable any protocol and address family combinations that are marked visible in the netconfig database.


SEE ALSO
       rpc.mountd(8), exports(5), exportfs(8), nfs.conf(5), rpc.rquotad(8), nfsstat(8), netconfig(5).

AUTHOR
       Olaf Kirch, Bill Hawes, H. J. Lu, G. Allan Morris III, and a host of others.



                                                                                                 20 Feb 2014                                                                                      rpc.nfsd(8)
