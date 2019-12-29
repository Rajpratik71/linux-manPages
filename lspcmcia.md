PCCARDCTL(8)                            System Manager's Manual                           PCCARDCTL(8)

NAME
       pccardctl - PCMCIA card control utility
       lspcmcia - display extended PCMCIA debugging information

SYNOPSIS
       pccardctl [-V] [-v ...] command [socket]
       lspcmcia [-V] [-v ...] [socket]

DESCRIPTION
       pccardctl  is  used  to monitor and control the state of PCMCIA sockets.  If a socket number is
       specified, the command will be applied to just one socket; otherwise, all sockets will  be  af‐
       fected.

       If  pccardctl is executed by root, all commands are available.  If it is executed by an unpriv‐
       iledged user, only the informational commands are accessible.

       lspcmcia is an alias for pccardctl ls, provided for convenience.

COMMANDS
       status
           Display the current socket status flags.

       config
           Display the socket configuration, including power settings, interrupt and I/O  window  set‐
           tings, and configuration registers.  --not yet implemented

       ident
           Display card identification information, including product identification strings, manufac‐
           turer ID codes, and function ID codes.  Not yet implemented for cardbus  cards.  Use  lspci
           instead.

       info
           Much  like the ident command, but its output is formatted as a series of Bourne-stype shell
           variable definitions for use in scripts.  Not yet implemented for cardbus cards.

       ls  Display extended debugging information about the PCMCIA sockets and devices present in  the
           system.

       suspend
           Shut down and then disable power for a socket.

       resume
           Restore power to a socket, and re-configure for use.

       eject
           Notify all client drivers that this card will be ejected, then cut power to the socket.

       insert
           Notify all client drivers that this card has just been inserted.

OPTIONS
       -V     Show version information and exit.

       -v     Increase  the verbosity of the ls command.  Giving this option twice increases verbosity
              further.

AUTHOR
       Daniel Ritz - daniel.ritz@gmx.ch
       based upon the original cardctl man page by
       David Hinds - dahinds@users.sourceforge.net

pcmciautils                                   2005/10/22                                  PCCARDCTL(8)
