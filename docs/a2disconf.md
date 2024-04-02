A2ENCONF(8)                                                   System Manager's Manual                                                  A2ENCONF(8)

NAME
       a2enconf, a2disconf - enable or disable an apache2 configuration file

SYNOPSIS
       a2enconf [ [-q|--quiet] configuration]

       a2disconf [ [-q|--quiet] configuration]

DESCRIPTION
       This manual page documents briefly the a2enconf and a2disconf commands.

       a2enconf  is  a  script  that enables the specified configuration file within the apache2 configuration.  It does this by creating symlinks
       within /etc/apache2/conf-enabled.  Likewise, a2disconf disables a specific configuration part by removing those symlinks.   It  is  not  an
       error to enable a configuration which is already enabled, or to disable one which is already disabled.

       Note  that many configuration file may have a dependency to specific modules.  Unlike module dependencies, these are not resolved automati‐
       cally. Configuration fragments stored in the conf-available directory are considered non-essential or being installed and manged by reverse
       dependencies (e.g. web scripts).

OPTIONS
       -q, --quiet
              Don't show informative messages.

       -m, --maintmode
              Enables  the maintainer mode, that is the program invocation is effectuated automatically by a maintainer script. This switch should
              not be used by end users.

       -p, --purge
              When disabling a module, purge all traces of the module in the internal state data base.

EXIT STATUS
       a2enconf and a2disconf exit with status 0 if all configurations are processed successfully, 1 if errors occur, 2 if an invalid  option  was
       used.

EXAMPLES
              a2enconf security
              a2disconf charset

       Enables Apache security directives stored in the security configuration files, and disables the charset configuration.

FILES
       /etc/apache2/conf-available
              Directory with files giving information on available configuration files.

       /etc/apache2/conf-enabled
              Directory with links to the files in conf-available for enabled configuration files.

SEE ALSO
       apache2ctl(8), a2enmod(8), a2dismod(8).

AUTHOR
       This manual page was written by Arno Toell <debian@toell.net> for the Debian GNU/Linux distribution, as it is a Debian-specific script with
       the package.

                                                                 14 February 2012                                                      A2ENCONF(8)
