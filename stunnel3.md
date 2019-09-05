STUNNEL(8)                                                                                                                              STUNNEL(8)

NAME
       stunnel - universal SSL tunnel

SYNOPSIS
       stunnel [-c ⎪ -T] [-D [facility.]level] [-O a⎪l⎪r:option=value[:value]] [-o file] [-C cipherlist] [-p pemfile] [-v level] [-A certfile]
       [-S sources] [-a directory] [-t timeout] [-u ident_username] [-s setuid_user] [-g setgid_group] [-n protocol] [-P { filename ⎪ '' } ]
       [-B bytes] [-R randfile] [-W] [-E socket] [-I host] [-d [host:]port [-f] ] [ -r [host:]port ⎪ { -l ⎪ -L } program [-- progname args] ]

DESCRIPTION
       The stunnel program is designed to work as SSL encryption wrapper between remote clients and local (inetd-startable) or remote servers. The
       concept is that having non-SSL aware daemons running on your system you can easily set them up to communicate with clients over secure SSL
       channels.

       stunnel can be used to add SSL functionality to commonly used inetd daemons like POP-2, POP-3, and IMAP servers, to standalone daemons like
       NNTP, SMTP and HTTP, and in tunneling PPP over network sockets without changes to the source code.

       This product includes cryptographic software written by Eric Young (eay@cryptsoft.com)

OPTIONS
       -h  Print stunnel help menu

       -D level
           Debugging level

           Level is a one of the syslog level names or numbers emerg (0), alert (1), crit (2), err (3), warning (4), notice (5), info (6), or
           debug (7).  All logs for the specified level and all levels numerically less than it will be shown.  Use -D debug or -D 7 for greatest
           debugging output.  The default is notice (5).

           The syslog facility 'daemon' will be used unless a facility name is supplied.  (Facilities are not supported on windows.)

           Case is ignored for both facilities and levels.

       -O a⎪l⎪r:option=value[:value]
           Set an option on accept/local/remote socket

           The values for linger option are l_onof:l_linger. The values for time are tv_sec:tv_usec.

           Examples:

           -O l:SO_LINGER=1:60 - set one minute timeout for closing local socket

           -O r:TCP_NODELAY=1 - turn off the Nagle algorithm for remote sockets

           -O r:SO_OOBINLINE=1 - place out-of-band data directly into the receive data stream for remote sockets

           -O a:SO_REUSEADDR=0 - disable address reuse (enabled by default)

           -O a:SO_BINDTODEVICE=lo - only accept connections on loopback interface

           The available options and their defaults are:
               Option          Accept    Local     Remote    OS default
               SO_DEBUG            --        --        --             0
               SO_DONTROUTE        --        --        --             0
               SO_KEEPALIVE        --        --        --             0
               SO_LINGER           --        --        --    0:0
               SO_OOBINLINE        --        --        --             0
               SO_RCVBUF           --        --        --         87380
               SO_SNDBUF           --        --        --         16384
               SO_RCVLOWAT         --        --        --             1
               SO_SNDLOWAT         --        --        --             1
               SO_RCVTIMEO         --        --        --         0:0
               SO_SNDTIMEO         --        --        --         0:0
               SO_REUSEADDR             1    --        --             0
               SO_BINDTODEVICE     --        --        --        --
               IP_TOS              --        --        --             0
               IP_TTL              --        --        --            64
               TCP_NODELAY         --        --        --             0

       -o file
           Append log messages to a file.

       -C cipherlist
           Select permitted SSL ciphers

           A colon delimited list of the ciphers to allow in the SSL connection.  For example DES-CBC3-SHA:IDEA-CBC-MD5

       -c  client mode (remote service uses SSL)

           default: server mode

       -T  transparent proxy mode

           Re-write address to appear as if wrapped daemon is connecting from the SSL client machine instead of the machine running stunnel.
           Available only on some operating systems (Linux only, we believe) and then only in server mode. Note that this option will not combine
           with proxy mode (-r) unless the client's default route to the target machine lies through the host running stunnel, which cannot be
           localhost.

       -p pemfile
           private key and certificate chain PEM file name

           A PEM is always needed in server mode (by default located in /etc/stunnel/stunnel.pem). Specifying this flag in client mode will use
           this key and certificate chain as a client side certificate chain.  Using client side certs is optional. The certificates must be in
           PEM format and must be sorted starting with the certificate to the highest level (root CA).

       -v level
           verify peer certificate

           ·       level 1 - verify peer certificate if present

           ·       level 2 - verify peer certificate

           ·       level 3 - verify peer with locally installed certificate

           ·       default - no verify

       -a directory
           client certificate directory

           This is the directory in which stunnel will look for certificates when using the -v options. Note that the certificates in this direc‐
           tory should be named XXXXXXXX.0 where XXXXXXXX is the hash value of the cert.

       -A certfile
           Certificate Authority file

           This file contains multiple CA certificates, used with the -v options.

       -t timeout
           session cache timeout

           default: 300 seconds.

       -N servicename
           Service name to use for tcpwrappers. If not specified then a tcpwrapper service name will be generated automatically for you. This will
           also be used when auto-generating pid filenames.

       -u ident_username
           Use IDENT (RFC 1413) username checking

       -n proto
           Negotiate SSL with specified protocol

           currently supported: smtp, pop3, nntp

       -E socket
           Entropy Gathering Daemon socket to use to feed OpenSSL random number generator.  (Available only if compiled with OpenSSL 0.9.5a or
           higher)

       -R filename
           File containing random input.  The SSL library will use data from this file first to seed the random number generator.

       -W  Do not overwrite the random seed files with new random data.

       -B bytes
           Number of bytes of data read from random seed files.  With SSL versions less than 0.9.5a, also determines how many bytes of data are
           considered sufficient to seed the PRNG.  More recent OpenSSL versions have a builtin function to determine when sufficient randomness
           is available.

       -I host
           IP of the outgoing interface is used as source for remote connections.  Use this option to bind a static local IP address, instead.

       -d [host:]port
           daemon mode

           Listen for connections on [host:]port. If no host specified, defaults to all IP addresses for the local host.

           default: inetd mode

       -f  foreground mode

           Stay in foreground (don't fork) and log to stderr instead of via syslog (unless -o is specified).

           default: background in daemon mode

       -l program [-- programname [arg1 arg2 arg3...]  ]
           execute local inetd-type program.

       -L program [-- programname [arg1 arg2 arg3...]  ]
           open local pty and execute program.

       -s username
           setuid() to username in daemon mode

       -g groupname
           setgid() to groupname in daemon mode. Clears all other groups.

       -P { file ⎪ '' }
           Pid file location

           If the argument is a filename, then that filename will be used for the pid. If the argument is empty ('', not missing), then no pid
           file will be created.

       -r [host:]port
           connect to remote service

           If no host specified, defaults to localhost.

EXAMPLES
       In order to provide SSL encapsulation to your local imapd service, use

         stunnel -d 993 -l /usr/sbin/imapd -- imapd

       In order to let your local e-mail client connect to a SSL-enabled imapd service on another server, configure the e-mail client to connect
       to localhost on port 119 and use:

         stunnel -c -d 143 -r servername:993

       If you want to provide tunneling to your pppd daemon on port 2020, use something like

         stunnel -d 2020 -L /usr/sbin/pppd -- pppd local

ENVIRONMENT
       If Stunnel is used to create local processes using the -l or -L options, it will set the following environment variables

       REMOTE_HOST
           The IP address of the remote end of the connection.

       SSL_CLIENT_DN
           The DN (Distinguished Name, aka subject name) of the peer certificate, if a certificate was present and verified.

       SSL_CLIENT_I_DN
           The Issuer's DN of the peer's certificate, if a certificate was present and verified.

CERTIFICATES
       ·   Each SSL enabled daemon needs to present a valid X.509 certificate to the peer. It also needs a private key to decrypt the incoming
           data.  The easiest way to obtain a certificate and a key is to generate them with the free openssl package. You can find more informa‐
           tion on certificates generation on pages listed below.

           Two things are important when generating certificate-key pairs for stunnel. The private key cannot be encrypted, because the server has
           no way to obtain the password from the user. To produce an unencrypted key add the -nodes option when running the req command from the
           openssl kit.

           The order of contents of the .pem file is also important. It should contain the unencrypted private key first, then a signed certifi‐
           cate (not certificate request). There should be also empty lines after certificate and private key. Plaintext certificate information
           appended on the top of generated certificate should be discarded. So the file should look like this:

             -----BEGIN RSA PRIVATE KEY-----
             [encoded key]
             -----END RSA PRIVATE KEY-----
             [empty line]
             -----BEGIN CERTIFICATE-----
             [encoded certificate]
             -----END CERTIFICATE-----
             [empty line]

RANDOMNESS
       ·   stunnel needs to seed the PRNG (pseudo random number generator) in order for SSL to use good randomness.  The following sources are
           loaded in order until sufficient random data has been gathered:

           ·       The file specified with the -R flag.

           ·       The file specified by the RANDFILE environment variable, if set.

           ·       The file .rnd in your home directory, if RANDFILE not set.

           ·       The file specified with '--with-random' at compile time.

           ·       The contents of the screen if running on Windows.

           ·       The egd socket specified with the -E flag.

           ·       The egd socket specified with '--with-egd-sock' at compile time.

           ·       The /dev/urandom device.

           With recent (>=OpenSSL 0.9.5a) version of SSL it will stop loading random data automatically when sufficient entropy has been gathered.
           With previous versions it will continue to gather from all the above sources since no SSL function exists to tell when enough data is
           available.

           Note that on Windows machines that do not have console user interaction (mouse movements, creating windows, etc) the screen contents
           are not variable enough to be sufficient, and you should provide a random file for use with the -R flag.

           Note that the file specified with the -R flag should contain random data -- that means it should contain different information each
           time stunnel is run.  This is handled automatically unless the -W flag is used.  If you wish to update this file manually, the openssl
           rand command in recent versions of OpenSSL, would be useful.

           One important note -- if /dev/urandom is available, OpenSSL has a habit of seeding the PRNG with it even when checking the random
           state, so on systems with /dev/urandom you're likely to use it even though it's listed at the very bottom of the list above.  This
           isn't stunnel's behaviour, it's OpenSSLs.

LIMITATIONS
       ·   stunnel cannot be used for the FTP daemon because of the nature of the FTP protocol which utilizes multiple ports for data transfers.
           There are available SSL enabled versions of FTP and telnet daemons, however.

SEE ALSO
           tcpd(8) access control facility for internet services

           inetd(8)
                   internet ``super-server''

           http://stunnel.mirt.net/
                   Stunnel homepage

           http://www.stunnel.org/
                   Stunnel Frequently Asked Questions

           http://www.openssl.org/
                   OpenSSL project website

AUTHOR
           Michal Trojnara
                   <Michal.Trojnara@mirt.net>

                                                                    2003-08-01                                                          STUNNEL(8)
