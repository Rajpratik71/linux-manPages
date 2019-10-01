RPC.IDMAPD(8)                                                                            BSD System Manager's Manual                                                                            RPC.IDMAPD(8)

NAME
     rpc.idmapd — NFSv4 ID <-> Name Mapper

SYNOPSIS
     rpc.idmapd [-h] [-f] [-v] [-C] [-S] [-p path] [-c path]

DESCRIPTION
     rpc.idmapd is the NFSv4 ID <-> name mapping daemon.  It provides functionality to the NFSv4 kernel client and server, to which it communicates via upcalls, by translating user and group IDs to names,
     and vice versa.

     Note that on more recent kernels only the NFSv4 server uses rpc.idmapd.  The NFSv4 client instead uses nfsidmap(8), and only falls back to rpc.idmapd if there was a problem running the nfsidmap(8)
     program.

     The options are as follows:

     -h           Display usage message.

     -v           Increases the verbosity level (can be specified multiple times).

     -f           Runs rpc.idmapd in the foreground and prints all output to the terminal.

     -p path      Specifies the location of the RPC pipefs to be path.  The default value is "/var/lib/nfs/rpc_pipefs".

     -c path      Use configuration file path.  This option is deprecated.

     -C           Client-only: perform no idmapping for any NFS server, even if one is detected.

     -S           Server-only: perform no idmapping for any NFS client, even if one is detected.

CONFIGURATION FILES
     rpc.idmapd recognizes the following value from the [general] section of the /etc/nfs.conf configuration file:

     pipefs-directory
                  Equivalent to -p.

     All other settings related to id mapping are found in the /etc/idmapd.conf configuration file.

EXAMPLES
     rpc.idmapd -f -vvv

     Runs rpc.idmapd printing all messages to console, and with a verbosity level of 3.

FILES
     /etc/idmapd.conf, /etc/nfs.conf

SEE ALSO
     idmapd.conf(5), nfs.conf(5), nfsidmap(8)

AUTHORS
     The rpc.idmapd software has been developed by Marius Aamodt Eriksen ⟨marius@citi.umich.edu⟩.

BSD                                                                                            February 3, 2003                                                                                           BSD
