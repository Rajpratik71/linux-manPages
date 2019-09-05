wapiti-getcookie(1)                                       http://wapiti.sourceforge.net/                                       wapiti-getcookie(1)

NAME
       wapiti-getcookie - A Wapiti utility to fetch cookies from a webpage and store them in the Wapiti JSON format.

SYNOPSIS
       wapiti-getcookie COOKIE_FILE FORM_URL [OPTIONS]

DESCRIPTION
       wapiti-getcookie can be used to fill a web-form from your terminal and obtain the cookies sent by the remote server.  Cookie information is
       stored in JSON format in the COOKIE_FILE given as the first parameter.
       Those cookies can be then loaded by Wapiti using the -c option.

OPTIONS
       -p, --proxy=PROXY_URL
              To specify a proxy. Currently supported proxies are HTTP and HTTPS.
              This option can be called twice to specify the HTTP and the HTTPS proxies.
              Example:
                     -p http://proxy:port/

LICENCE
       Wapiti is covered by the GNU General Public License (GPL), version 2.
       Please read the COPYING file for more information.

COPYRIGHT
       Copyright (c) 2006-2013 Nicolas Surribas.

AUTHORS
       Nicolas Surribas
       David del Pozo
       Alberto Pastor

BUG REPORTS
       If you find a bug in Wapiti please report it to http://sourceforge.net/tracker/?group_id=168625

SEE ALSO
       The README file that comes with Wapiti gives more detailed information on the options.

Version 2.3.0                                             http://wapiti.sourceforge.net/                                       wapiti-getcookie(1)
