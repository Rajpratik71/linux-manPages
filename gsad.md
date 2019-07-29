gsad(8)                                                       System Manager's Manual                                                      gsad(8)

NAME
       gsad - Greenbone Security Assistant for the Open Vulnerability Assessment System (OpenVAS)

SYNOPSIS
       gsad OPTIONS

DESCRIPTION
       Together,  OpenVAS  Scanner  (openvassd(8))  and  OpenVAS  Manager  (openvasmd(8)) provide the core functionality of the Open Vulnerability
       Assessment System (OpenVAS), with OpenVAS Scanner handling the actual scan process and OpenVAS Manager adding various management  function‐
       alities to handle and organise scan results.

       The  Greenbone  Security  Assistant  Daemon (gsad) is a web application that connects to the OpenVAS Manager to provide for a full-featured
       user interface for vulnerability management.

OPTIONS
       -f, --foreground
              Run in foreground.

       --http-only
              Serve HTTP only, without SSL.

       --listen=ADDRESS
              Listen on ADDRESS.

       --mlisten=ADDRESS
              Manager address.

       -p, --port=PORT
              Listen on port number PORT.

       -m, --mport=PORT
              Use manager port number PORT.

       -r, --rport=PORT
              Redirect HTTP from port number PORT.

       --no-redirect
              Don't redirect HTTP to HTTPS.

       -k, --ssl-private-key=FILE
              Use FILE as the private key for HTTPS

       -c, --ssl-certificate=FILE
              Use FILE as the certificate for HTTPS

       --do-chroot
              Do chroot and drop privileges.

       --gnutls-priorities=PRIORITIES
              GnuTLS priorities string.

       --dh-params=FILE
              Diffie-Hellman parameters file for PFS support. Functional only with Libmicrohttpd 0.9.35 and higher.

       --unix-socket=FILE
              Listen for HTTP requests on the provided unix socket file.

       -v, --verbose
              Print progress messages.

       -V, --version
              Print version.

       --http-frame-opts=FRAME-OPTS
              X-Frame-Options HTTP header. Defaults to "SAMEORIGIN".

       --http-csp=CSP
              Content-Security-Policy HTTP header. Defaults to "default-src 'self' 'unsafe-inline'; img-src 'self' blob:; frame-ancestors  'self'"
              --http-frame-opts=FRAME-OPTS X-Frame-Options HTTP header. Defaults to ""

       --http-csp=CSP
              Content-Security-Policy HTTP header. Defaults to "default-src 'self' 'unsafe-inline'; img-src 'self' blob:; frame-ancestors *"

       --http-sts
              Enable HTTP Strict-Tranport-Security header.

       --http-sts-max-age=max-age
              max-age in seconds for HTTP Strict-Tranport-Security header.  Defaults to 31536000.

       -?, --help
              Show help.

EXAMPLES
       gsad

       Start gsad with the default port configuration and listen on port 443 for HTTPS requests.

SEE ALSO
       openvassd(8), Bopenvasad(8), omp(8), openvasmd(8), gsd(8)

MORE INFORMATION ABOUT THE OPENVAS PROJECT
       The  canonical  places  where  you  will  find  more  information  about  the  OpenVAS project are: http://www.openvas.org/ (Official site)
       http://wald.intevation.org/projects/openvas/ (Development Platform)

COPYRIGHT
       The Greenbone Security Assistant is released under the GNU GPL, version 2, or, at your option, any later version.

Manuals                                                                User                                                                gsad(8)
