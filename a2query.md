A2QUERY.IN(1)                                           User Contributed Perl Documentation                                          A2QUERY.IN(1)

NAME
       a2query - retrieve runtime configuration from a local Apache 2 HTTP server

SYNOPSIS
       a2query  [-m [MODULE]] [-s [SITE]] [-c [CONF]] [-a] [-v] [-M] [-d] [-h]

DESCRIPTION
       a2query is a program designed to retrieve configuration values from a locally available Apache 2 HTTP web server. It was designed to be as
       robust as possible by returning feasible values even if the Apache 2 syntax validator fails.

       This program is primarily meant to be used from maintainer scripts.

OPTIONS
       -a  Returns the Apache 2 "Module Magic Version" (API version) number, the server was compiled with. The returned version does not contain
           any minor versions which are known to be compatible with the major version returned.

       -c [CONF]
           Checks whether the configuration CONF is enabled. If no argument was given, all enabled configuration files are being returned. CONF is
           compared by string comparison by ignoring a leading "mod_" prefix and possibly a '.conf' or '.load' suffix.

       -h  Displays a brief summary how the program can be called and exits.

       -m [MODULE]
           Checks whether the module MODULE is enabled, The argument is interpreted in the same way, as for configuration files queried by the -c
           switch.

       -M  Returns the currently enabled Apache 2 MPM (Multi Processing Module).

       -s [SITE]
           Checks whether the module SITE is enabled, The argument is interpreted in the same way, as for configuration files queried by the -c
           switch.

       -v  returns the currently installed Apache 2 HTTP server version

       -q  suppress any output. This is useful to invoke a2query from another script. This is useful if only the return code is of interest.

EXIT CODES
       a2query returns with a zero (0) exit status if the requested operation was effectuated successfully and with a non-zero status otherwise.
       In case of an error it leaves with error code 32 if a requested module, site or configuration was not found and 33 if a module, site or
       configuration was disabled by a maintainer script. However, exit status 1 is returned if the module was not found at all

SEE ALSO
       apache2ctl(8), apache2(8), perl(1)

AUTHOR
       This manual and a2query was written by Arno Toell <debian@toell.net>.

perl v5.22.1                                                        2019-04-02                                                       A2QUERY.IN(1)
