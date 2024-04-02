EXMENEN(1)                                                    General Commands Manual                                                   EXMENEN(1)

NAME
       exmenen, exmendis - enable or disable extra menus for GNOME, KDE and other XDG menu-spec compliant desktops

SYNOPSIS
       exmenen (--system | --local) [ module ]

       exmendis (--system | --local) [ module ]

DESCRIPTION
       This manual page documents briefly the exmenen and exmendis commands.

       exmenen  is  a  script  that enables the specified extra applications menu on either a system, or per-user basis.  It does this by creating
       symlinks within /etc/xdg/menus/applications-merged/ (system wide),  or  ${XDG_CONFIG_HOME}/menus/applications-merged/  (per-user).  If  the
       XDG_CONFIG_HOME environment variable is unset, its default is taken to be ${HOME}/.config .

       Likewise,  exmendis  disables  an extra applications menu by removing those symlinks.  It is not an error to enable a menu which is already
       enabled, or to disable one which is already disabled.

EXAMPLES
              exmendis --system electronics
              exmenen --system electronics

       Disables the system wide extra electronics menu, enables it for the current user.

FILES
       /usr/share/extra-xdg-menus
              Directory with .menu files defining the available extra modules.

       /etc/xdg/menus/applications-merged
              Directory with links to the files in extra-xdg-menus for system-wide enabled extra menus.

       ${XDG_CONFIG_HOME}/menus/applications-merged
              Directory with links to the files in extra-xdg-menus for per-user enabled extra menus. If XDG_CONFIG_HOME is  unset,  the  directory
              used will be ${HOME}/.config/menus/applications-merged

AUTHOR
       This  manual  page  was written by Peter Clifton <pcjc2@cam.ac.uk> for the Debian GNU/Linux distribution, as it is a Debian-specific script
       with the package.

       exmenen, exmendis and this manpage were derived from scripts and documentation written by Daniel Stone for the apache2 Debian package.

                                                                  13 January 2008                                                       EXMENEN(1)
