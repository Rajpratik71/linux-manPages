byobu-reconnect-sockets(1)                                             byobu                                            byobu-reconnect-sockets(1)

NAME
       byobu-reconnect-sockets - Sourcable script that updates GPG_AGENT_INFO and DBUS_SESSION_BUS_ADDRESS in the environment

DESCRIPTION
       byobu-reconnect-sockets is a sourcable bit of shell code that will update the GPG_AGENT_INFO and DBUS_SESSION_BUS_ADDRESS environment vari‐
       ables in the current shell, such that you may restablish connection to gpg-agent(1) and dbus-daemon(1).

       This is often useful when reattaching to a detached Byobu session.

       http://byobu.org

AUTHOR
       This manpage and the utility were written by Dustin Kirkland <kirkland@byobu.org> for Ubuntu systems (but may be used by others).   Permis‐
       sion  is granted to copy, distribute and/or modify this document and the utility under the terms of the GNU General Public License, Version
       3 published by the Free Software Foundation.

       The complete text of the GNU General Public License can  be  found  in  /usr/share/common-licenses/GPL  on  Debian/Ubuntu  systems,  or  in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               7 Dec 2009                                          byobu-reconnect-sockets(1)
