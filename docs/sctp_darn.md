sctp_darn(1)                                                  General Commands Manual                                                 sctp_darn(1)

NAME
       sctp_darn - Send and receive messages via SCTP

SYNOPSIS
       sctp_darn -H local_address -P local_port [-h remote_host] [-p remote_port] -l|s

DESCRIPTION
       This  is a userspace test application for the SCTP Linux kernel reference implementation state machine.  It is vaguely inspired by Stevens'
       program "sock".

       It has the limited ability to send messages and to listen for messages sent via SCTP.

OPTIONS
       -H, --local local_address
              specify one of the local addresses

       -P, --local-port local_port
              specify the port number for local addresses

       -h, --remote remote_address
              specify the peer address

       -p, --remote-port remote_port
              specify the port number for the peer address

       -l, --listen
              print messages received from the peer

       -s, --send
              send messages to the peer

       -B, --bindx-add address
              add the specified address(es) as additional bind addresses to the local socket. Multiple addresses can be specified by this argument
              multiple times.  For example, '-B 10.0.0.1 -B 20.0.0.2'.

       -b, --bindx-rem address
              remove  the  specified address(es) from the bind addresses of the local socket. Multiple addresses can be specified by this argument
              multiple times.  For example, '-b 10.0.0.1 -b 20.0.0.2'.

       -I     use the interactive mode.

       -i     setup the specified number of endpoints by using the specified local host (-H) and local port (-P). The port number will  be  incre‐
              mented  by one for each additional endpoint.  All of these endpoints will be listening.  If a remote host (-h) and a remote port are
              also specified, the first endpoint will start sending fixed sized messages to the remote host.

       -m size
              specify the sockopt sndbuf/rcvbuf size.

       -n     set the socket(s) to be in the non-blocking mode.  collect messages from stdin and deliver them to the peer

       --use-poll
              use system call poll() for polling among the number of endpoints specified by the -i option. Without this option, select() would  be
              used as default.

       -t     use SOCK_STREAM tcp-style sockets.

       -z size
              specify the message size to be sent.  The default message size generated would be 16K.

       --interface ifname
              select interface for sin6_scope_id.

AUTHOR
       Michael Biebl <biebl@debian.org>

                                                                                                                                      sctp_darn(1)
