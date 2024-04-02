HTS(1)                                                        General Commands Manual                                                       HTS(1)

NAME
       hts - httptunnel server

SYNOPSIS
       hts [options] [host:][port]

DESCRIPTION
       This manual page briefly documents the hts command.

       hts listens for incoming httptunnel connections at PORT (default port is 8888), and optionally binds to ip address HOST.  When a connection
       is made, I/O is redirected to the destination specified by the --device or --forward-port switch.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options are included
       below.

       -h, --help
              Show summary of options.

       -c, --content-length BYTES
              use HTTP PUT requests of BYTES size (k, M, and G postfixes recognized)

       -d, --device DEVICE
              use DEVICE for input and output

       -F, --forward-port HOST:PORT
              connect to PORT at HOST and use it for input and output

       -k, --keep-alive SECONDS
              send keepalive bytes every SECONDS seconds (default is 5)

       -M, --max-connection-age SEC
              maximum time a connection will stay open is SEC seconds (default is 300)

       -s, --stdin-stdout
              use stdin/stdout for communication (implies --no-daemon)

       -S, --strict-content-length
              always write Content-Length bytes in requests

       -V, --version
              output version information and exit

       -w, --no-daemon
              don't fork into the background

       -p, --pid-file LOCATION
              write a PID file to LOCATION

       -C, --chroot LOCATION
              chroot to LOCATION before serving clients

       -u, --user USER
              change user and group identities before serving clients

AUTHOR
       This manual page was contributed by Teemu Hukkanen <tjhukkan@iki.fi>, and was originally written for the Debian GNU/Linux system.

                                                                                                                                            HTS(1)
