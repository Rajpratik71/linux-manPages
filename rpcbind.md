
RPCBIND(8)                                                                               BSD System Manager's Manual                                                                               RPCBIND(8)

NAME
     rpcbind — universal addresses to RPC program number mapper

SYNOPSIS
     rpcbind [-adhiLls]

DESCRIPTION
     The rpcbind utility is a server that converts RPC program numbers into universal addresses.  It must be running on the host to be able to make RPC calls on a server on that machine.

     When an RPC service is started, it tells rpcbind the address at which it is listening, and the RPC program numbers it is prepared to serve.  When a client wishes to make an RPC call to a given program
     number, it first contacts rpcbind on the server machine to determine the address where RPC requests should be sent.

     The rpcbind utility should be started before any other RPC service.  Normally, standard RPC servers are started by port monitors, so rpcbind must be started before port monitors are invoked.

     When rpcbind is started, it checks that certain name-to-address translation-calls function correctly.  If they fail, the network configuration databases may be corrupt.  Since RPC services cannot
     function correctly in this situation, rpcbind reports the condition and terminates.

     The rpcbind utility can only be started by the super-user.

OPTIONS
     -a      When debugging (-d), do an abort on errors.

     -d      Run in debug mode.  In this mode, rpcbind will log additional information during operation, and will abort on certain errors if -a is also specified.  With this option, the name-to-address
             translation consistency checks are shown in detail.

     -f      Do not fork and become a background process.

     -h      Specify specific IP addresses to bind to for UDP requests.  This option may be specified multiple times and can be used to restrict the interfaces rpcbind will respond to.  Note that when
             rpcbind is controlled via systemd's socket activation, the -h option is ignored. In this case, you need to edit the ListenStream and ListenDgram definitions in
             /usr/lib/systemd/system/rpcbind.socket instead.

     -i      “Insecure” mode.  Allow calls to SET and UNSET from any host.  Normally rpcbind accepts these requests only from the loopback interface for security reasons.  This change is necessary for pro-
             grams that were compiled with earlier versions of the rpc library and do not make those requests using the loopback interface.

     -l      Turn on libwrap connection logging.

     -s      Cause rpcbind to change to the user daemon as soon as possible.  This causes rpcbind to use non-privileged ports for outgoing connections, preventing non-privileged clients from using rpcbind
             to connect to services from a privileged port.

     -w      Cause rpcbind to do a "warm start" by read a state file when rpcbind starts up. The state file is created when rpcbind terminates.

NOTES
     All RPC servers must be restarted if rpcbind is restarted.

SEE ALSO
     rpcinfo(8)

LINUX PORT
BSD                                                                                           September 14, 1992                                                                                          BSD
