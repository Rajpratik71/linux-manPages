NDG_HTTPCLIENT(1)                                                                             User Commands                                                                             NDG_HTTPCLIENT(1)

NAME
       ndg_httpclient - enhanced HTTPS support for httplib and urllib2 using PyOpenSSL

SYNOPSIS
       ndg_httpclient [options] url

OPTIONS
       -h, --help
              show this help message and exit

       -c FILE, --certificate=FILE
              Certificate file - defaults to $HOME/credentials.pem

       -k FILE, --private-key=FILE
              Private key file - defaults to the certificate file

       -t PATH, --ca-certificate-dir=PATH
              Trusted CA certificate file directory

       -d, --debug
              Print debug information.

       -p FILE, --post-data-file=FILE
              POST data file

       -f FILE, --fetch=FILE
              Output file

       -n, --no-verify-peer
              Skip verification of peer certificate.

       -a USER:PASSWD, --basicauth=USER:PASSWD
              HTTP authentication credentials

       --header=HEADER: VALUE
              Add HTTP header to request

ndg_httpclient v0.4.0                                                                          August 2015                                                                              NDG_HTTPCLIENT(1)
