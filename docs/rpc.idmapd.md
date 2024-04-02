RPC.IDMAPD(8)                                                                            BSD System Manager's Manual                                                                            RPC.IDMAPD(8)

NAME
     rpc.idmapd — NFSv4 ID <-> Name Mapper

SYNOPSIS
     rpc.idmapd [-v] [-f] [-p path] [-c path]

DESCRIPTION
     rpc.idmapd is the NFSv4 ID <-> name mapping daemon.  It provides functionality to the NFSv4 kernel client and server, to which it communicates via upcalls, by translating user and group IDs to names,
     and vice versa.

     The options are as follows:

     -v           Increases the verbosity level (can be specified multiple times).

     -f           Runs rpc.idmapd in the foreground and prints all output to the terminal.

     -p path      Specifies the location of the RPC pipefs to be path.  The default value is "/var/lib/nfs/rpc_pipefs".

     -c path      Use configuration file path.

     -C           Client-only: perform no idmapping for any NFS server, even if one is detected.

     -S           Server-only: perform no idmapping for any NFS client, even if one is detected.

EXAMPLES
     rpc.idmapd -f -vvv

     Runs rpc.idmapd printing all messages to console, and with a verbosity level of 3.

FILES
     /etc/idmapd.conf

SEE ALSO
     idmapd.conf(5)

AUTHORS
     The rpc.idmapd software has been developed by Marius Aamodt Eriksen ⟨marius@citi.umich.edu⟩.

BSD                                                                                            February 3, 2003                                                                                           BSD
