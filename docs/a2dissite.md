A2ENSITE(8)                                                   System Manager's Manual                                                  A2ENSITE(8)

NAME
       a2ensite, a2dissite - enable or disable an apache2 site / virtual host

SYNOPSIS
       a2ensite [ [-q|--quiet] site]

       a2dissite [ [-q|--quiet] site]

DESCRIPTION
       This manual page documents briefly the a2ensite and a2dissite commands.

       a2ensite is a script that enables the specified site (which contains a <VirtualHost> block) within the apache2 configuration.  It does this
       by creating symlinks within /etc/apache2/sites-enabled.  Likewise, a2dissite disables a site by removing those  symlinks.   It  is  not  an
       error to enable a site which is already enabled, or to disable one which is already disabled.

       Apache  treats  the very first virtual host enabled specially as every request not matching any actual directive is being redirected there.
       Thus it should be called 000-default in order to sort before the remaining hosts to be loaded first.

OPTIONS
       -q, --quiet
              Don't show informative messages.

       -m, --maintmode
              Enables the maintainer mode, that is the program invocation is effectuated automatically by a maintainer script. This switch  should
              not be used by end users.

       -p, --purge
              When disabling a module, purge all traces of the module in the internal state data base.

EXIT STATUS
       a2ensite and a2dissite exit with status 0 if all sites are processed successfully, 1 if errors occur, 2 if an invalid option was used.

EXAMPLES
              a2dissite 000-default

       Disables the default site.

FILES
       /etc/apache2/sites-available
              Directory with files giving information on available sites.

       /etc/apache2/sites-enabled
              Directory with links to the files in sites-available for enabled sites.

SEE ALSO
       apache2ctl(8).

AUTHOR
       This  manual  page  was written by Stefan Fritsch <sf@debian.org> (based on the a2enmod manual page by Daniel Stone <daniel@sfarc.net>) for
       the Debian GNU/Linux distribution.

                                                                    8 June 2007                                                        A2ENSITE(8)
