PROXYTUNNEL(1)                                                                                                                      PROXYTUNNEL(1)

NAME
       proxytunnel - program to tunnel a connection through a standard HTTPS proxy

SYNOPSIS
       proxytunnel [OPTION]...

DESCRIPTION
       proxytunnel is a program to tunnel any connection through a standard HTTPS proxy, circumventing standard HTTP filtering mechanisms. It’s
       mostly used as a backend for OpenSSH’s ProxyCommand, and as a proxy backend for Putty. It can also be used for other proxy-traversing
       purposes like proxy bouncing.

OPTIONS
       -i, --inetd
           Run from inetd (default: off)

       -a, --standalone=port
           Run as standalone daemon on specified port

       -p, --proxy=host:_port_
           Use host and port as the local proxy to connect to, if not specified the HTTP_PROXY environment variable, if set, will be used instead

       -r, --remproxy=host:_port_
           Use host and port as the remote (secondary) proxy to connect to

       -d, --dest=host:_port_
           Use host and port as the destination for the tunnel, you can also specify them as the argument to the proxytunnel command

       -e, --encrypt
           SSL encrypt data between local proxy and destination

       -E, --encrypt-proxy
           SSL encrypt data between client and local proxy

       -X, --encrypt-remproxy
           SSL encrypt data between local and remote (secondary) proxy

       -W, --wa-bug-29744
           If SSL is in use (by -e, -E, -X options), stop using it immediately after the CONNECT exchange to workaround apache server bugs. (This
           might not work on all setups; see /usr/share/doc/proxytunnel/README.Debian.gz for more details.)

       -B, --buggy-encrypt-proxy
           Equivalent to -E -W. (Provided for backwards compatibility.)

ADDITIONAL OPTIONS
       -F, --passfile=filename
           Use filename for reading username and password for HTTPS proxy authentication, the file uses the same format as .wgetrc and can be
           shared with wget. Use this option, or environment variables to hide the password from other users

       -P, --proxyauth=username:_password_
           Use username and password as credentials to authenticate against a local HTTPS proxy, the username and password can also be specified
           in the PROXYUSER and PROXYPASS environment variables to hide them from other users. If the password is ommited and no PROXYPASS
           environment variable is set, proxytunnel will prompt for a password

       -R, --remproxyauth=username:_password_
           Use username and password as credentials to authenticate against a remote (secondary) HTTPS proxy, the username and password can also
           be specified in the REMPROXYUSER and REMPROXYPASS environment variables to hide them from other users. If the password is ommited and
           no REMPROXYPASS environment variable is set, proxytunnel will prompt for a password

       -N, --ntlm
           Use NTLM basd authentication

       -t, --domain=STRING
           Specify NTLM domain (default: autodetect)

       -H, --header=STRING
           Add additional HTTP headers to send to proxy

       -x, --proctitle=STRING
           Use a different process title

MISCELLANEOUS OPTIONS
       -v, --verbose
           Turn on verbosity

       -q, --quiet
           Suppress messages

       -h, --help
           Print help and exit

       -V, --version
           Print version and exit

ARGUMENTS
       host:_port_ is the destination hostname and port number combination

           Note
           Specifying the destination as arguments is exactly the same as specifying them using the -d or --dest option.

USAGE
       Depending on your situation you might want to do any of the following things:

       ·   Connect through a local proxy to your home system on port 22

               $ proxytunnel -v -p proxy.company.com:8080 -d system.home.nl:22

       ·   Connect through a local proxy (with authentication) to your home system

               $ proxytunnel -v -p proxy.company.com:8080 -P username:password -d system.home.nl:22

       ·   Connect through a local proxy (with authentication) hiding your password

               $ export PROXYPASS=password
               $ proxytunnel -v -p proxy.company.com:8080 -P username -d system.home.nl:22

       ·   Connect through a local proxy to a remote proxy and bounce to any system

               $ proxytunnel -v -p proxy.company.com:8080 -r proxy.athome.nl:443 -d system.friend.nl:22

       ·   Connect using SSL through a local proxy to your home system

               $ proxytunnel -v -E -p proxy.company.com:8080 -d system.home.nl:22

OPENSSH CONFIGURATION
       To use this program with OpenSSH to connect to a host somewhere, create a ~/.ssh/config file with the following content:

           Host system.athome.nl
               ProxyCommand proxytunnel -p proxy.company.com:8080 -d %h:%p
               ServerAliveInterval 30

           Note
           The ServerAliveInterval directive makes sure that idle connections are not being dropped by intermediate firewalls that remove active
           sessions aggresively. If you see your connection dropping out, try to lower the value even more.

       To use the dynamic (SOCKS) portforwarding capability of the SSH client, you can specify the DynamicForward directive in your ssh_config
       file like:

           Host system.athome.nl
               DynamicForward 1080
               ProxyCommand proxytunnel -p proxy.company.com:8080 -d %h:%p
               ServerAliveInterval 30

NOTES
           Important
           Most HTTPS proxies do not allow access to ports other than HTTPS (tcp/443) and SNEWS (tcp/563). In this case you need to make sure the
           SSH daemon or remote proxy on the destination system is listening on either tcp/443 or tcp/563 to get through.

ENVIRONMENT
       Proxytunnel can be influenced by setting one of the following environment variables:

       HTTP_PROXY
           If this environment variable is set, proxytunnel will use it as the local proxy if -p or --proxy is not provided

       PROXYUSER
           If this environment variable is set, proxytunnel will use it as the username for proxy authentication, unless specified using the -P or
           --proxyauth option

       PROXYPASS
           If this environment variable is set, proxytunnel will use it as the password for proxy authentication, unless specified using the -P or
           --proxyauth option

       REMPROXYUSER
           If this environment variable is set, proxytunnel will use it as the username for remote (secondary) proxy authentication, unless
           specified using the -R or --remproxyauth option

       REMPROXYPASS
           If this environment variable is set, proxytunnel will use it as the password for remote (secondary) proxy authentication, unless
           specified using the -R or --remproxyauth option

SEE ALSO
           ssh(1), ssh_config(8)

BUGS
       This software is bug-free, at least we’d like to think so. If you do not agree with us, please attach the proof to your friendly email :)

AUTHOR
       This manpage was initially written by Loïc Le Guyader <loic.leguyader@laposte.net[1]> for the Debian GNU/Linux system, revamped in asciidoc
       by Dag Wieërs <dag@wieers.com[2]> and is now maintained by the Proxytunnel developers.

       Homepage at http://proxytunnel.sourceforge.net/

AUTHOR
       Proxytunnel developers
           Author.

NOTES
        1. loic.leguyader@laposte.net
           mailto:loic.leguyader@laposte.net

        2. dag@wieers.com
           mailto:dag@wieers.com

  1.9.0                                                            Augustus 2008                                                    PROXYTUNNEL(1)
