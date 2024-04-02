A2ENMOD(8)                                                    System Manager's Manual                                                   A2ENMOD(8)

NAME
       a2enmod, a2dismod - enable or disable an apache2 module

SYNOPSIS
       a2enmod [ [-q|--quiet] module]

       a2dismod [ [-q|--quiet] module]

DESCRIPTION
       This manual page documents briefly the a2enmod and a2dismod commands.

       a2enmod  is  a  script  that  enables  the  specified  module  within  the apache2 configuration.  It does this by creating symlinks within
       /etc/apache2/mods-enabled.  Likewise, a2dismod disables a module by removing those symlinks.  It is not an error to enable a  module  which
       is already enabled, or to disable one which is already disabled.

       Note  that many modules have, in addition to a .load file, an associated .conf file.  Enabling the module puts the configuration directives
       in the .conf file as directives into the main server context of apache2.

OPTIONS
       -q, --quiet
              Don't show informative messages.

       -m, --maintmode
              Enables the maintainer mode, that is the program invocation is effectuated automatically by a maintainer script. This switch  should
              not be used by end users.

       -p, --purge
              When disabling a module, purge all traces of the module in the internal state data base.

EXIT STATUS
       a2enmod and a2dismod exit with status 0 if all modules are processed successfully, 1 if errors occur, 2 if an invalid option was used.

EXAMPLES
              a2enmod imagemap
              a2dismod mime_magic

       Enables the mod_imagemap module, and disables the mod_mime_magic module.

FILES
       /etc/apache2/mods-available
              Directory with files giving information on available modules.

       /etc/apache2/mods-enabled
              Directory with links to the files in mods-available for enabled modules.

SEE ALSO
       apache2ctl(8), a2enconf(8), a2disconf(8).

AUTHOR
       This  manual  page  was written by Daniel Stone <daniel@sfarc.net> for the Debian GNU/Linux distribution, as it is a Debian-specific script
       with the package.

                                                                  12 October 2006                                                       A2ENMOD(8)
