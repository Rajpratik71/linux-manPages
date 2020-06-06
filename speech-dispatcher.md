SPEECH-DISPATCHER(1)                                                                          User Commands                                                                          SPEECH-DISPATCHER(1)

NAME
       speech-dispatcher - server process managing speech requests in Speech Dispatcher

SYNOPSIS
       speech-dispatcher [-{d|s}] [-l {1|2|3|4|5}] [-c com_method] [-S socket_path] [-p port] | [-v] | [-h]

DESCRIPTION
       speech-dispatcher  is  a  server  process  that  is  responsible  for transforming requests for text-to-speech output into actual speech hearable in the speakers. It arbitrates concurrent speech
       requests based on message priorities, and abstracts different speech synthesizers. Client programs, like screen readers or navigation software, send speech requests  to  speech-dispatcher  using
       TCP  protocol (with the help of client libraries).  speech-dispatcher is usually started automatically by client libraries (i.e. autospawn), so you only need to run it manually if testing/debug‐
       ging, or when in other explicit need for a special setup.

OPTIONS
       -d, --run-daemon
              Run as a daemon

       -s, --run-single
              Run as single application

       -a, --spawn
              Start only if autospawn is not disabled

       -l, --log-level
              Set log level (1..5)

       -c, --communication-method
              Communication method to use (unix_socket or inet_socket) -S, --socket-path Socket path to use for 'unix_socket' method (filesystem path or 'default')

       -p, --port
              Specify a port number for 'inet_socket' method

       -P, --pid-file
              Set path to pid file

       -C, --config-dir
              Set path to configuration

       -v, --version
              Report version of this program

       -D, --debug
              Output debugging information into /tmp/.speech-dispatcher

       -h, --help
              Print this info

BUGS
       Please report bugs to <speechd-bugs@freebsoft.org>

SEE ALSO
       spd-say(1)

       The full documentation for speech-dispatcher is maintained as a Texinfo manual.  If the info and speech-dispatcher programs are properly installed at your site, the command

              info speech-dispatcher

       should give you access to the complete manual.

speech-dispatcher 0.7.1                                                                         March 2011                                                                           SPEECH-DISPATCHER(1)
