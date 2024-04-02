CRYWRAP(8)                                                            CryWrap                                                           CRYWRAP(8)

NAME
       CryWrap - Simple TCP/IP service encryption using TLS/SSL

SYNOPSIS
       crywrap --listen HOST/PORT --destination HOST/PORT [options]

DESCRIPTION
       CryWrap is a simple wrapper that waits for TLS/SSL connections, and proxies them to an unencrypted location.

OPTIONS
       CryWrap takes the following options:

   Required options
       --destionation (-d) HOST/PORT
              The destionation host and address, where CryWrap should connect to. Both arguments are required.

   TLS options
       --anon (-a)
              Enables Anon-DH mode. If enabled, no certificate will be sent to the client, and only anonymous sessions will be enabled.
              Default is off.

       --cert (-c) PATH

       --key (-k) PATH
              The public certificate to send to clients, and the private server key.
              Default is /etc/crywrap/server.pem, unless --anon is also specified, in which case no certificate will be used.  --ca (-z) PATH
              A Certificate Authority certificate to be used for verification of client certificates.

       --verify (-v) [LEVEL]
              Set  the  level  of  client certificate verification. Level one simply logs the result, level two and above abort if the certificate
              could not be verified.
              Default is 0.

   Miscellaneous options
       --inetd (-i)
              Enable inetd-mode. Use this if you want to run CryWrap from inetd. If this option is  not  enabled,  then  --listen  is  a  required
              option.
              Default is off.

       --listen (-l) HOST/PORT
              The  host  and  port CryWrap should listen on. HOST can be an IPv4 or IPv6 address, or a hostname, and is optional - if unspecified,
              CryWrap will listen on all available addresses. PORT is mandatory.
              This option is required, unless CryWrap was put into inetd mode.

       --pidfile (-P) PIDFILE
              Write the pid thy runs with to PIDFILE.
              Default is /var/run/crywrap.pid.

       --user (-u) UID
              UID is the numerical user id of the user thy should run as.
              Default is 65534.

       --version (-V)
              Print the version number and exit.

       --help (-?)
              Print a verbose help screen and exit.

       --usage
              Print a short summary of options.

EXAMPLES
   Setting up pop3s
       crywrap --listen /995 --destination localhost/110

   Setting up imaps with a different certificate
       crywrap --listen /993 --destination localhost/143 \
            --pem /etc/ssl/certs/imap.pem

FILES
       /etc/crywrap/
              This directory contains the default server key and certificate.

BUGS
       Probably many.

AUTHOR
       Gergely Nagy <algernon@bonehunter.rulez.org>

CryWrap                                                             03 May 2003                                                         CRYWRAP(8)
