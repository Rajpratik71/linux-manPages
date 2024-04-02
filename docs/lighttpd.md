LIGHTTPD(8)                                                                                                                            LIGHTTPD(8)

NAME
       lighttpd - a fast, secure and flexible web server

SYNOPSIS
       lighttpd [-ptDvVh] -f configfile [-m moduledir]

DESCRIPTION
       lighttpd (pronounced 'lighty') is an advanced HTTP daemon that aims to be secure, fast, compliant and very flexible.  It has been optimized
       for high performance.  Its feature set includes, but is not limited to, FastCGI, CGI, basic and digest HTTP authentication, output compres‐
       sion, URL rewriting.

       This manual page only lists the command line arguments.  For details on how to configure lighttpd and its modules see the files in the doc-
       directory.

OPTIONS
       The following options are supported:

       -f  configfile
               Load configuration file configfile.

       -m  moduledir
               Use moduledir as the directory that contains modules, instead of the default.

       -p      Print the parsed configuration file in its internal form and exit.

       -t      Test the configuration file for syntax errors and exit.

       -D      Do not daemonize (go into background). The default is to daemonize.

       -v      Show version and exit.

       -V      Show compile-time features and exit.

       -h      Show a brief help message and exit.

FILES
       /etc/lighttpd/lighttpd.conf
               The standard location for the configuration file.

       /var/run/lighttpd.pid
               The standard location for the PID of the running lighttpd process.

SEE ALSO
       Online Documentation: http://wiki.lighttpd.net/

       spawn-fcgi(1)

       Hypertext Transfer Protocol -- HTTP/1.1, RFC 2616.

       HTTP Authentication: Basic and Digest Access Authentication, RFC 2617.

       The Common Gateway Interface Version 1.1, RFC 3875.

       The FastCGI specification.

AUTHOR
       Jan Kneschke <jan@kneschke.de>

                                                                    2009-03-07                                                         LIGHTTPD(8)
