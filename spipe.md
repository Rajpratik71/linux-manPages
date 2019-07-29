SPIPE(1)                                                           spipe README                                                           SPIPE(1)

NAME
       spipe - spiped client utility

SYNOPSIS
       spipe -t <target socket> -k <key file> [-f | -g] [-j] [-o <connection timeout>]

OPTIONS
       -t <target socket>
              Address to which spipe should connect.

       -k <key file>
              Use the provided key file to authenticate and encrypt.

       -f     Use fast/weak handshaking: This reduces the CPU time spent in the initial connection setup, at the expense of losing perfect forward
              secrecy.

       -g     Require perfect forward secrecy by dropping connections if the other host is using the -f option.

       -j     Disable transport layer keep-alives.  (By default they are enabled.)

       -o <connection timeout>
              Timeout, in seconds, after which an attempt to connect to the target or a protocol handshake will be  aborted  (and  the  connection
              dropped) if not completed.  Defaults to 5s.

SEE ALSO
       spiped(1).

spiped 1.4.1                                                     September 7, 2014                                                        SPIPE(1)
