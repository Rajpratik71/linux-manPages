smart(8)                                                                                                                                  smart(8)

NAME
       smart - The Smart Package Manager

SYNOPSIS
       smart command [options] [arguments]

DESCRIPTION
       The  Smart Package Manager project has the ambitious objective of creating smart and portable algorithms for solving adequately the problem
       of managing software upgrading and installation. This tool works in all major distributions, and will bring notable advantages over  native
       tools currently in use (APT, APT-RPM, YUM, URPMI, etc).

Action commands
       update
       install
       reinstall
       upgrade
       remove
       check
       fix
       download
       clean

Setup commands
       channel
       priority
       mirror
       flag

Query commands
       search
       query
       info
       stats

       Run "smart command --help" for more information.

Options
       --version
              Show program's version number and exit

       --config-file=FILE
              Configuration file (default is <data-dir>/config)

       --data-dir=DIR
              Specifies the config file location - can take http, ftp urls and local file Data directory (default is /var/lib/smart/)

       --log-level=LEVEL
              Set the log level to level (debug, info, warning, error)

       --gui  Use the default graphic interface

       --shell
              Use the default shell interface

       --interface=NAME
              Use the given interface

       --ignore-locks
              Don't respect locking

       -o OPT, --option=OPT
              Set the option given by a name=value pair

Examples
       smart install --help
       smart install pkgname
       smart --gui
       smart --gui install pkgname
       smart --shell

FILES
       /etc/smart/
       /var/lib/smart/
       /usr/lib/smart/
       /usr/lib/smart/plugins/

SEE ALSO
       http://labix.org/smart

AUTHOR
       Gustavo Niemeyer <gustavo@niemeyer.net>

Christoph Thiel                                                     2006 Jun 16                                                           smart(8)
