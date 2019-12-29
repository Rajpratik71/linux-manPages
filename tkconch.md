CONCH(1)                                                                                      CONCH(1)

NAME
       tkconch - connect to SSH servers graphically

SYNOPSIS
       conch [-l user] [-i identity [ -i identity ... ]] [-c cipher] [-m MAC] [-p port] [-n] [-t] [-T]
       [-V] [-C] [-N] [-s] [arg [...]]

       conch --help

DESCRIPTION
       The --help prints out a usage message to standard output.

       -l, --user <user>
              Log in using this user name.

       -e, --escape <escape character>
              Set escape character; 'none' = disable (default: ~)

       -i, --identity <identity>
              Add an identity file for public key authentication (default: ~/.ssh/identity)

       -c, --cipher <cipher>
              Cipher algorithm to use.

       -m, --macs <mac>
              Specify MAC algorithms for protocol version 2.

       -p, --port <port>
              Port to connect to.

       -L, --localforward <listen-port:host:port>
              Forward local port to remote address.

       -R, --remoteforward <listen-port:host:port>
              Forward remote port to local address.

       -t, --tty
              Allocate a tty even if command is given.

       -n, --notty
              Do not allocate a tty.

       -V, --version
              Display version number only.

       -C, --compress
              Enable compression.

       -a, --ansilog
              Print the received data to stdout.

       -N, --noshell
              Do not execute a shell or command.

       -s, --subsystem
              Invoke command (mandatory) as SSH2 subsystem.

       --log  Print the receieved data to stderr.

DESCRIPTION
       Open an SSH connection to specified server, and either run the command given there  or  open  a
       remote interactive shell.

AUTHOR
       Written by Moshe Zadka, based on conch's help messages

REPORTING BUGS
       To report a bug, visit http://twistedmatrix.com/trac/

COPYRIGHT
       Copyright © 2002-2008 Twisted Matrix Laboratories.
       This  is  free software; see the source for copying conditions.  There is NO warranty; not even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       ssh(1)

                                             October 2002                                     CONCH(1)
