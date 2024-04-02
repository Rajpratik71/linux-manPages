SSLSTRIP(1)                                                        User Commands                                                       SSLSTRIP(1)

NAME
       sslstrip - SSL/TLS man-in-the-middle attack tool

SYNOPSIS
       sslstrip <options>

DESCRIPTION
       sslstrip 0.6 by Moxie Marlinspike

OPTIONS
       -w <filename>, --write=<filename>
               Specify file to log to (optional).

       -p, --post
              Log only SSL POSTs. (default)

       -s, --ssl
              Log all SSL traffic to and from server.

       -a, --all
              Log all SSL and HTTP traffic to and from server.

       -l <port>, --listen=<port>
              Port to listen on (default 10000).

       -f, --favicon
              Substitute a lock favicon on secure requests.

       -k, --killsessions
              Kill sessions in progress.

       -h     Print this help message.

sslstrip.py                                                        February 2011                                                       SSLSTRIP(1)
