corkscrew(1)                                                        Networking                                                        corkscrew(1)

NAME
       corkscrew - Tunnel TCP connections through HTTP proxies

SYNOPSIS
         corkscrew  PROXY PROXYPORT TARGETHOST TARGETPORT [AUTH_FILE]

DESCRIPTION
       corkscrew is a simple tool to tunnel TCP connections through an HTTP proxy supporting the CONNECT method. It reads stdin and writes to std-
       out during the connection, just like netcat. It can be used for instance to connect to an SSH server running on a remote 443 port through a
       strict HTTPS proxy.

       PROXY
           The name of the host running the HTTP proxy.

       PROXYPORT
           The port on which to connect on the proxy.

       TARGET
           The host to reach through the proxy.

       TARGETPORT
           The port to connect to on the target host.

       AUTH_ FILE
           The  auth  file is made of one single line containing your username and password in the form

               username:password

OPTIONS
       None.

EXAMPLES
       The common usage of corkscrew is to put the following line in ~/.ssh/ssh_config:

               ProxyCommand corkscrew proxy proxyport %h %p [<path to auth_file>]

       This will let the ssh connection go through the proxy with the help of corkscrew.

ENVIRONMENT
       None.

FILES
       None.

SEE ALSO
       ssh_config(5)

AUTHORS
       Program was written by Pat Padgett <agroman@agroman.net>.

       This manual page was written by Laurent Fousse <laurent@komite.net> for the Debian GNU system (but may be used by others). Updated by Jari
       Aalto <jari.aalto@cante.net>. Released under license GNU GPL version 2 or (at your option) any later version. For more information about
       license, visit <http://www.gnu.org/copyleft/gpl.html>.

corkscrew                                                           2013-05-23                                                        corkscrew(1)
