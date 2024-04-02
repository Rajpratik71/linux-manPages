HTC(1)                                                        General Commands Manual                                                       HTC(1)

NAME
       htc - httptunnel client

SYNOPSIS
       htc [options] host[:port]

DESCRIPTION
       This manual page briefly documents the htc command.

       htc  sets  up a httptunnel connection to PORT at HOST (default port is 8888).  When a connection is made, I/O is redirected from the source
       specified by the --device or --forward-port switch to the tunnel.

OPTIONS
       The program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options are included
       below.

       -h, --help
              Show summary of options.

       -c, --content-length BYTES
              use HTTP PUT requests of BYTES size (k, M, and G postfixes recognized)

       -d, --device DEVICE
              use DEVICE for input and output

       -F, --forward-port PORT
              use TCP port PORT for input and output

       -k, --keep-alive SECONDS
              send keepalive bytes every SECONDS seconds (default is 5)

       -M, --max-connection-age SEC
              maximum time a connection will stay open is SEC seconds (default is 300)

       -S, --strict-content-length
              always write Content-Length bytes in requests

       -A, --proxy-authorization USER:PASSWORD
              proxy authorization

       -z, --proxy-authorization-file FILE
              proxy authorization file

       -B, --proxy-buffer-size BYTES
              assume a proxy buffer size of BYTES bytes (k, M, and G postfixes recognized)

       -P, --proxy HOSTNAME[:PORT]
              use a HTTP proxy (default port is 8080)

       -T, --timeout TIME
              timeout, in milliseconds, before sending padding to a buffering proxy

       -U, --user-agent STRING
              specify User-Agent value in HTTP requests

       -V, --version
              output version information and exit

       -w, --no-daemon
              don't fork into the background

AUTHOR
       This manual page was contributed by Teemu Hukkanen <tjhukkan@iki.fi>, and was originally written for the Debian GNU/Linux system.

                                                                                                                                            HTC(1)
