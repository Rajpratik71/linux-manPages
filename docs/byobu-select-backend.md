byobu-select-backend(1)                                                byobu                                               byobu-select-backend(1)

NAME
       byobu-select-backend - select your default Byobu backend window manager

SYNOPSIS
       byobu-select-backend [screen|tmux]

DESCRIPTION
       byobu-select-backend is an application that lists the available Byobu backends and allows you to select your default.

       You  can select one of either screen(1) or tmux(1) on the command line, or giving no command line parameters, the utility will run interac‐
       tively.

       This utility will only affect which backend is used by default when simply running, byobu(1).  Note that at any time,  you  can  force  the
       backend of a particular session by running the helpers, byobu-screen(1) or byobu-tmux(1).

FILES
       ~/.byobu/backend

SEE ALSO
       byobu(1), byobu-screen(1), byobu-tmux(1), screen(1), tmux(1)

       http://byobu.org

AUTHOR
       This  manpage and the utility were written by Dustin Kirkland <kirkland@byobu.org> for Ubuntu systems (but may be used by others).  Permis‐
       sion is granted to copy, distribute and/or modify this document and the utility under the terms of the GNU General Public License,  Version
       3 published by the Free Software Foundation.

       The  complete  text  of  the  GNU  General  Public  License  can be found in /usr/share/common-licenses/GPL on Debian/Ubuntu systems, or in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               30 Oct 2011                                            byobu-select-backend(1)
