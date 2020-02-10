upstart-socket-bridge(8)                                                                 System Manager's Manual                                                                 upstart-socket-bridge(8)

NAME
       upstart-socket-bridge - Bridge between Upstart and sockets

SYNOPSIS
       upstart-socket-bridge [OPTIONS]...

DESCRIPTION
       The  upstart-socket-bridge  queries  the  Upstart init(8) daemon for all job configurations which start on or stop on the socket event. It then waits for an incoming connection on each specified
       socket(7) and when detected emits the socket event (socket-event (7)), setting a number of environment variables for the job to query.

AUTHOR
       Written by Scott James Remnant <scott@netsplit.com>

       Manual page written by James Hunt <james.hunt@ubuntu.com>

BUGS
       Report bugs at <https://launchpad.net/upstart/+bugs>

COPYRIGHT
       Copyright © 2011 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       init(5) init(8) socket(2) socket(7) socket-event(7)

upstart                                                                                         2011-03-08                                                                       upstart-socket-bridge(8)
