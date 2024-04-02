SPIKEPROXY(1)                                                 General Commands Manual                                                SPIKEPROXY(1)

NAME
       spikeproxy - web application auditing tool

SYNOPSIS
       spkproxy [-s SSLproxyhost] [-p port] [-U NTLMUser] [-D NTLMDomain] [-P NTLMPassword] [-l ListenHost] [-c cache_directory]

DESCRIPTION
       This  manual  page documents briefly the spikeproxy command.  This manual page was written for the Debian distribution because the original
       program does not have a manual page.

       SPIKE proXY functions as an HTTP and HTTPS proxy, and allows web developers or web application auditors low level access to the entire  web
       application  interface,  while  also providing a number  of automated tools and techniques for discovering common problems. These automated
       tools include:

       1.Automated SQL Injection Detection

       2.Web Site Crawling (guaranteed not to crawl sites other than the one being tested)

       3.Login form brute forcing

       4.Automated overflow detection

       5.Automated directory traversal detection

       In addition to automated analysis, SPIKE proXy allows the user to penetrate into the internals of the web application by viewing and chang‐
       ing  all  variables,  cookies,  headers,  or  other  parts of the request and resubmit them. SPIKE proXy maintains a careful record of each
       request made - saving both each request, and the entire response. The user can later go back and replace any request or view any response.

OPTIONS
       This program can be configured with the options listed below.  The options may be given in any order.

       -c cache directory
              The directory that will be used to cache all the requests. This directory is created if it does not exist. The default  location  is
              /var/cache/spikeproxy  but it can only be used by the root user.  -l listenhost The IP address the proxy will listen on (it defaults
              to 127.0.0.1 so it is not available from external hosts).

       -p port
              This option sets the port the proxy will listen on (it defaults to 8080 if not provided).

       -h proxyHost
              Sets a proxy host to use in the proxy chain.  Spike will forward all requests to this proxy.

       -H proxyPort
              Sets the port for the proxy host.

       -s proxySSLHost
              Sets a proxy host for SSL connections. Spike will forward all SSL requests to this proxy.

       -S proxySSLPort
              Sets the port for the SSL proxy host.

       -U NTLM Username
              Defines the NTLM username it will use when authenticating to the proxy host.

       -P NTLM Password
              Sets the password it will use when authenticating to the proxy host.

       -D NTLM Domain
              Sets the NTLM domain it will use when providing credentials to the proxy host.

SEE ALSO
       The program provides inline documentation in the user interface when connected to it through a web client. If you are trying to audit a web
       application you might want to read OWASP Guide to Building Secure Web Applications and Web Services, Application Security Attack Components
       project, Application Security Testing Framework, and the OWASP Web Application Security TopTen available at  http://www.owasp.org  and  the
       World Wide Web Security FAQ available at http://www.w3.org/Security/Faq/

AUTHOR
       This  manual  page  was  written by Javier Fernandez-Sanguino Pen~a <jfs@computer.org>, for the Debian GNU/Linux system (but may be used by
       others).

                                                                 October  2, 2006                                                    SPIKEPROXY(1)
