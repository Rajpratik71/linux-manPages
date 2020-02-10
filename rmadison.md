RMADISON(1)                                                                                                                                                                                   RMADISON(1)

NAME
       rmadison -- Remotely query the Debian archive database about packages

SYNOPSIS
       rmadison [OPTIONS] PACKAGE ...

DESCRIPTION
       dak ls queries the Debian archive database ("projectb") and displays which package version is registered per architecture/component/suite.  The CGI at https://qa.debian.org/madison.php provides
       that service without requiring SSH access to ftp-master.debian.org or the mirror on mirror.ftp-master.debian.org. This script, rmadison, is a command line frontend to this CGI.

OPTIONS
       -a, --architecture=ARCH
           only show info for ARCH(s)

       -b, --binary-type=TYPE
           only show info for binary TYPE

       -c, --component=COMPONENT
           only show info for COMPONENT(s)

       -g, --greaterorequal
           show buildd 'dep-wait pkg >= {highest version}' info

       -G, --greaterthan
           show buildd 'dep-wait pkg >> {highest version}' info

       -h, --help
           show this help and exit

       -s, --suite=SUITE
           only show info for this suite

       -r, --regex
           treat PACKAGE as a regex

           Note: Since -r can easily DoS the database ("-r ."), this option is not supported by the CGI on qa.debian.org and most other installations.

       -S, --source-and-binary
           show info for the binary children of source pkgs

       -t, --time
           show projectb snapshot and reload time (not supported by all archives)

       -u, --url=URL[,URL ...]
           use URL for the query. Supported shorthands are
            debian https://api.ftp-master.debian.org/madison
            new https://api.ftp-master.debian.org/madison?s=new
            qa https://qa.debian.org/madison.php
            ubuntu http://people.canonical.com/~ubuntu-archive/madison.cgi
            udd https://qa.debian.org/cgi-bin/madison.cgi

           See the RMADISON_URL_MAP_ variable below for a method to add new shorthands.

       --version
           show version and exit

       --no-conf, --noconf
           don't read the devscripts configuration files

       ARCH, COMPONENT and SUITE can be comma (or space) separated lists, e.g.  --architecture=m68k,i386

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables. Command line options can be used to override configuration
       file settings. Environment variable settings are ignored for this purpose. The currently recognised variables are:

       RMADISON_URL_MAP_SHORTHAND=URL
           Add an entry to the set of shorthand URLs listed above. SHORTHAND should be replaced with the shorthand form to be used to refer to URL.

           Multiple shorthand entries may be specified by using multiple RMADISON_URL_MAP_* variables.

       RMADISON_DEFAULT_URL=URL
           Set the default URL to use unless overridden by a command line option.  For Debian this defaults to debian. For Ubuntu this defaults to ubuntu.

       RMADISON_ARCHITECTURE=ARCH
           Set the default architecture to use unless overridden by a command line option.  To run an unrestricted query when RMADISON_ARCHITECTURE is set, use --architecture='*'.

       RMADISON_SSL_CA_FILE=FILE
           Use the specified CA file instead of the default CA bundle for curl/wget, passed as --cacert to curl, and as --ca-certificate to wget.

       RMADISON_SSL_CA_PATH=PATH
           Use the specified CA directory instead of the default CA bundle for curl/wget, passed as --capath to curl, and as --ca-directory to wget.

NOTES
       dak ls was formerly called madison.

       The protocol used by rmadison is fairly simple, the CGI accepts query the parameters a, b, c, g, G, r, s, S, t, and package. The parameter text is passed to enable plain-text output.

SEE ALSO
       dak(1), madison-lite(1)

AUTHOR
       rmadison and https://qa.debian.org/madison.php were written by Christoph Berg <myon@debian.org>. dak was written by James Troup <james@nocrew.org>, Anthony Towns <ajt@debian.org>, and others.

Debian Utilities                                                                                2016-03-23                                                                                    RMADISON(1)
