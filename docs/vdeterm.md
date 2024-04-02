VDETERM(1)                                                    General Commands Manual                                                   VDETERM(1)

NAME
       vdeterm - (simple) Remote terminal for vde management sockets

SYNOPSIS
       vdeterm socket

DESCRIPTION
       A vdeterm is a terminal application for a vde tools stream socket.

       It has been created as a part of the vde-2 project: it is used as a remote console for vde_switch or for the wirefilter application.

       vdeterm  provides command editing, history of previous commands, command completion.  Debug asynchronous messages do not interfere with the
       command editing line.

NOTICE
       Virtual Distributed Ethernet is not related in any way with www.vde.com ("Verband der Elektrotechnik, Elektronik  und  Informationstechnik"
       i.e. the German "Association for Electrical, Electronic & Information Technologies").

SEE ALSO
       vde_switch(1), wirefilter(1).

AUTHOR
       VDE is a project by Renzo Davoli <renzo@cs.unibo.it>

Virtual Distributed Ethernet                                       July 29, 2008                                                        VDETERM(1)
