byobu-enable(1)                                                        byobu                                                       byobu-enable(1)

NAME
       byobu-enable, byobu-disable - wrapper script for enabling/disabling automatic startup of byobu after login into text console

SYNOPSIS
       byobu-enable

       byobu-disable

DESCRIPTION
       byobu-enable will run byobu-launcher-install(1) to configure byobu(1) to launch automatically on login

       byobu-disable will simply run byobu-launcher-uninstall(1).

BUGS
       None found, yet.

SEE ALSO
       screen(1), byobu-config(1), byobu-export(1), byobu-status(1), byobu-status-detail(1)
       http://byobu.org

AUTHOR
       This  manpage  was  written by Jan Klepek <jan.klepek at gmail.com> and the utility was written by Dustin Kirkland <kirkland@byobu.org> for
       Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this document under the terms  of  the
       GNU General Public License, Version 3 published by the Free Software Foundation.

       The  complete  text  of  the  GNU  General  Public  License  can be found in /usr/share/common-licenses/GPL on Debian/Ubuntu systems, or in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                             6 January 2011                                                   byobu-enable(1)
