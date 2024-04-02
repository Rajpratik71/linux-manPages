upstart-local-bridge(8)                                       System Manager's Manual                                      upstart-local-bridge(8)

NAME
       upstart-local-bridge - Bridge between Upstart and a local client socket connection.

SYNOPSIS
       upstart-local-bridge [OPTIONS]...

DESCRIPTION
       upstart-local-bridge listens on a local domain socket for name=value pairs and creates init(8) events for them.

       The local unix domain socket can be either named or abstract.

OPTIONS
       --any-user
              By  default  the  bridge  will only accept connections from clients running under the same user ID as the bridge itself. This option
              allows connections from any user.

       --daemon
              Detach and run in the background.

       --debug
              Enable debugging output.

       --event event
              Specify name of event to emit on receipt of a name=value pair.

       --help Show brief usage summary.

       --path path
              Specify path for local/abstract socket to listen on. If the first byte of path is an '@', the socket will be created as an  abstract
              socket.

       --verbose
              Enable verbose output.

EVENT DETAILS
       The  following  environment  variables are added automatically to the event to be emitted, with the name=value pair being added as the last
       variable.

       ·   SOCKET_TYPE=unix

       ·   SOCKET_VARIANT=[named|abstract] Sub-type of socket.

       ·   CLIENT_UID=UID User ID of connected client.

       ·   CLIENT_GID=GID Group ID of connected client.

       ·   CLIENT_PID=PID Process ID of connected client.

       ·   SOCKET_PATH=PATH

EXAMPLES
       upstart-local-bridge --event=foo --path=/var/foo/bar
           Listen on local socket /var/foo/bar and when a name=value pair is read, emit an event of the form:

           foo SOCKET_TYPE=unix SOCKET_VARIANT=named SOCKET_PATH=/var/foo/bar name=value

       upstart-local-bridge --event=bar --path=@/var/foo/bar
           Listen on abstract socket @/var/foo/bar and when a name=value pair is read, emit an event of the form:

           bar SOCKET_TYPE=unix SOCKET_VARIANT=abstract SOCKET_PATH=@/var/foo/bar name=value

NOTES
       ·   If a named local socket is specified, all path elements except for the last must already exist before the bridge starts.

LIMITATIONS
       ·   Only a single client connection is serviced at any one time.

AUTHOR
       Written by James Hunt <james.hunt@canonical.com>

BUGS
       Report bugs at <https://launchpad.net/ubuntu/+source/upstart/+bugs>

COPYRIGHT
       Copyright © 2013 Canonical Ltd.

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

SEE ALSO
       init(5) init(8)

upstart                                                             2013-07-23                                             upstart-local-bridge(8)
