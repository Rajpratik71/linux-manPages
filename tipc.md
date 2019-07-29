TIPC(8)                             Linux                             TIPC(8)

NAME
       tipc - a TIPC configuration and management tool

SYNOPSIS
       tipc [ OPTIONS ] COMMAND ARGUMENTS

       COMMAND := { bearer | link | media | nametable | node | socket }

       OPTIONS := { -h[help] }

DESCRIPTION
       The Transparent Inter-Process Communication (TIPC) protocol offers
       total address transparency between processes which allows applications
       in a clustered computer environment to communicate quickly and reli‐
       ably with each other, regardless of their location within the cluster.

       TIPC originated at the telecommunications manufacturer Ericsson. The
       first open source version of TIPC was created in 2000 when Ericsson
       released its first Linux version of TIPC. TIPC was introduced in the
       mainline Linux kernel in 2006 and is now widely used both within and
       outside of Ericsson.

OPTIONS
       -h, --help
              Show help about last given command. For example tipc bearer
              --help will show bearer help and tipc --help will show general
              help. The position of the option in the string is irrelevant.

COMMANDS
       BEARER - Show or modify TIPC bearers

       LINK   - Show or modify TIPC links

       MEDIA  - Show or modify TIPC media

       NAMETABLE
              - Show TIPC nametable

       NODE   - Show or modify TIPC node parameters

       SOCKET - Show TIPC sockets

ARGUMENTS
       Command arguments are described in a command specific man page and
       typically consists of nested commands along with key value pairs.  If
       no arguments are given a command typically shows its help text. The
       explicit help option -h or --help can occur anywhere among the argu‐
       ments and will show help for the last valid command given.

EXIT STATUS
       Exit status is 0 if command was successful or a positive integer upon
       failure.

SEE ALSO
       tipc-bearer(8), tipc-link(8), tipc-media(8), tipc-nametable(8), tipc-
       node(8), tipc-peer(8), tipc-socket(8)

REPORTING BUGS
       Report any bugs to the Network Developers mailing list <net‐
       dev@vger.kernel.org> where the development and maintenance is primar‐
       ily done.  You do not have to be subscribed to the list to send a mes‐
       sage there.

AUTHOR
       Richard Alpe <richard.alpe@ericsson.com>

iproute2                         02 Jun 2015                          TIPC(8)
