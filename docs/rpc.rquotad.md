RQUOTAD(8)                                                                                 System Manager's Manual                                                                                 RQUOTAD(8)



NAME
       rpc.rquotad - remote quota server

SYNOPSIS
       /usr/sbin/rpc.rquotad [ -FI ] [ -p port ] [ -s | -S ] [ -x path ]

       /usr/sbin/rpc.rquotad [ -h | -V ]

DESCRIPTION
       rpc.rquotad  is  an rpc(3) server which returns quotas for a user of a local filesystem which is mounted by a remote machine over the NFS.  It also allows setting of quotas on NFS mounted filesystem
       (if configured during compilation and allowed by a command line option -S).  The results are used by quota(1) to display user quotas for remote filesystems and by edquota(8) to set quotas on  remote
       filesystems.  rquotad daemon uses tcp-wrappers library (under service name rquotad) which allows you to specify hosts allowed/disallowed to use the daemon (see hosts.allow(5) manpage for more infor‐
       mation). The rquotad daemon is normally started at boot time from the system startup scripts.

OPTIONS
       -h, --help
              Show program usage and exit.  -V, --version Show version of quota tools.

       -s, --no-setquota
              Don't allow setting of quotas (default). This option is available only if utilities were compiled with the rpcsetquota option.

       -S, --setquota
              Allow setting of quotas. This option is available only if utilities were compiled with the rpcsetquota option.

       -F, --foreground
              Run daemon in foreground (may be useful for debugging purposes).

       -I, --autofs
              Do not ignore autofs mountpoints.

       -p port, --port port
              Listen on alternate port port.

       -x path, --xtab path
              Set an alternative file with NFSD export table. This file is used to determine pseudoroot of NFSv4 exports. The pseudoroot is then prepended to each relative path (i.e. a path  not  beginning
              by '/') received in a quota RPC request.


FILES
       aquota.user or aquota.group
                           quota file at the filesystem root (version 2 quota, non-XFS filesystems)
       quota.user or quota.group
                           quota file at the filesystem root (version 1 quota, non-XFS filesystems)
       /etc/mtab           default filesystems

SEE ALSO
       quota(1), rpc(3), nfs(5), services(5), inetd(8)



                                                                                                                                                                                                   RQUOTAD(8)
