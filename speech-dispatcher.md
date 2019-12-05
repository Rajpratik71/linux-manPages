SPEECH-DISPATCHER(1)                                                                                                                                 User Commands                                                                                                                                 SPEECH-DISPATCHER(1)

NAME
       speech-dispatcher - manual page for speech-dispatcher 0.9.1

SYNOPSIS
       speech-dispatcher [-{d|s}] [-l {1|2|3|4|5}] [-c com_method] [-S socket_path] [-p port] [-t timeout] | [-v] | [-h]

DESCRIPTION
       Speech Dispatcher -- Common interface for Speech Synthesis (GNU GPL)

OPTIONS
       -d, --run-daemon
              Run as a daemon

       -s, --run-single
              Run as single application

       -a, --spawn
              Start only if autospawn is not disabled

       -l, --log-level
              Set log level (between 1 and 5)

       -L, --log-dir
              Set path to logging

       -c, --communication-method
              Communication method to use ('unix_socket' or 'inet_socket')

       -S, --socket-path
              Socket path to use for 'unix_socket' method (filesystem path or 'default')

       -p, --port
              Specify a port number for 'inet_socket' method

       -t, --timeout
              Set time in seconds for the server to wait before it shuts down, if it has no clients connected

       -P, --pid-file
              Set path to pid file

       -C, --config-dir
              Set path to configuration

       -m, --module-dir
              Set path to modules

       -v, --version
              Report version of this program

       -D, --debug
              Output debugging information into $TMPDIR/speechd-debug if TMPDIR is exported, otherwise to /tmp/speechd-debug

       -h, --help
              Print this info

       Please report bugs to speechd-discuss@nongnu.org

COPYRIGHT
       Copyright © 2002-2012 Brailcom, o.p.s.
       This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2, or (at your option) any later version. Please see COPYING for more details.

SEE ALSO
       The full documentation for speech-dispatcher is maintained as a Texinfo manual.  If the info and speech-dispatcher programs are properly installed at your site, the command

              info speech-dispatcher

       should give you access to the complete manual.

speech-dispatcher 0.9.1                                                                                                                               August 2019                                                                                                                                  SPEECH-DISPATCHER(1)
