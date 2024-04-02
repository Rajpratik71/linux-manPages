byobu-launcher-install(1)                                              byobu                                             byobu-launcher-install(1)

NAME
       byobu-launcher-install - Byobu Launcher installation utility

SYNOPSIS
       byobu-launcher-install [-n|--no-logout]

DESCRIPTION
       byobu-launcher-install(1)  is  a  simple utilty that will add a line to your $HOME/.profile file which launches byobu(1) any time you login
       through ssh(1) or on a console(4).

       By default, when users detach from  the  byobu(1)  session  they  will  also  logout.   Users  can  change  this  behavior  by  adding  the
       [-n|--no-logout] option when they run byobu-launcher-install(1).

       You can disable this behavior entirely at any time with the byobu-launcher-uninstall(1) utility.

SEE ALSO
       screen(1), byobu(1), ssh(1), console(4), byobu-launcher-uninstall(1)

       http://byobu.org

AUTHOR
       This  manpage and the utility were written by Dustin Kirkland <kirkland@byobu.org> for Ubuntu systems (but may be used by others).  Permis‐
       sion is granted to copy, distribute and/or modify this document and the utility under the terms of the GNU General Public License,  Version
       3 published by the Free Software Foundation.

       The  complete  text  of  the  GNU  General  Public  License  can be found in /usr/share/common-licenses/GPL on Debian/Ubuntu systems, or in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               3 Jan 2010                                           byobu-launcher-install(1)
