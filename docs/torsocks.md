TORSOCKS(1)                                                                                                                            TORSOCKS(1)

NAME
       torsocks — Shell wrapper to simplify the use of the torsocks(8) library to transparently torify an application.

SYNOPSIS
       torsocks [OPTIONS] [COMMAND [ARG ...]]

DESCRIPTION
       torsocks  is  a  wrapper  between the torsocks library and the application in order to make every Internet communication go through the Tor
       network.

       By default, torsocks will assume that it should connect to the Tor SOCKS proxy running at 127.0.0.1 on port 9050 being the defaults of  the
       Tor daemon.

       In  order  to  use  a  configuration file, torsocks tries to read the /etc/tor/torsocks.conf file or look for the environment variable TOR‐
       SOCKS_CONF_FILE with the location of the file. If that file cannot be read, torsocks will use sensible defaults for most Tor installations.

       For further information on configuration, see torsocks.conf(5).

OPTIONS
       -h, --help
              Show summary of possible options and commands.

       --shell
              Create a new shell with LD_PRELOAD including torsocks(8).

       --version
              Show version.

       -u, --user
              Set username for the SOCKS5 authentication. Use for circuit isolation in Tor.  Note that you MUST have a password set either by  the
              command line, environment variable or configuration file (torsocks.conf(5).

       -p, --pass
              Set  password for the SOCKS5 authentication. Use for circuit isolation in Tor.  Note that you MUST have a username set either by the
              command line, environment variable or configuration file (torsocks.conf(5)).

       -a, --address
              Set Tor address.

       -P, --port
              Set Tor port.

       -i, --isolate
              Automatic tor isolation. Set the username and password for the SOCKS5 authentication method to a PID/current time based value  auto‐
              matically. Username and Password MUST NOT be set.

       -d, --debug
              Activate the debug mode. Output will be written on stderr.

       -q, --quiet
              Suppress every log messages (even errors).

       on | off
              This  option  adds  or  removes  torsocks(8) from the LD_PRELOAD environment variable for the current shell. If you want to use this
              option, you HAVE to source torsocks from your shell.

              Add the torsocks library to LD_PRELOAD
              $ . torsocks on
              Remove the torsocks library from LD_PRELOAD
              $ . torsocks off

       show | sh
              Show the current value of the LD_PRELOAD environment variable.

ENVIRONMENT VARIABLES
       Please see torsocks(8) for more detail on possible environment variables.

SEE ALSO
       torsocks(8), torsocks.conf(5)

CREDITS
       torsocks is distributed under the GNU General Public License version 2.

       A Web site is available at https://www.torproject.org for more information.

       You can also find the source code at https://git.torproject.org.

       Mailing list for help is <tor-talk@lists.torproject.org> and for development use <tor-dev@lists.torproject.org>. You can find  the  project
       also on IRC server irc.oftc.net (OFTC) in #tor and #tor-dev.

AUTHOR
       torsocks was originally written by Robert Hogan and has been rewritten by David Goulet <dgoulet@torproject.org> in 2013.

                                                                  March 3rd, 2014                                                      TORSOCKS(1)
