byobu-select-session(1)                                                byobu                                               byobu-select-session(1)

NAME
       byobu-select-session - select and connect to a byobu session

DESCRIPTION
       byobu-select-session  is an application that lists the available screen sessions running on the system, and prompts the user to select one.
       The user also has the option to create a new Byobu session, or launch the default shell without Byobu.

       If an invalid selection is chosen 3 times in a row, the user is connected to the youngest session.

       By default, if only one session exists, the user is connected to that session, and if no sessions exist, a new session is created  --  such
       that  there  is  no  interactive prompt in the normal behavior.  However, some users may choose to always be prompted, by touching the file
       $BYOBU_CONFIG_DIR/.always-select.

       Note that BYOBU_CONFIG_DIR=$HOME/.byobu.

       Named sessions that begin with a "." are "hidden" from byobu-select-session(1).  This is useful, for instance, if you do not want a session
       to be automatically selected at login.  Example:
         byobu -S .hidden

FILES
       $BYOBU_CONFIG_DIR/.always-select

SEE ALSO
       byobu(1), screen(1)

       http://byobu.org

AUTHOR
       This  manpage and the utility were written by Dustin Kirkland <kirkland@byobu.org> for Ubuntu systems (but may be used by others).  Permis‐
       sion is granted to copy, distribute and/or modify this document and the utility under the terms of the GNU General Public License,  Version
       3 published by the Free Software Foundation.

       The  complete  text  of  the  GNU  General  Public  License  can be found in /usr/share/common-licenses/GPL on Debian/Ubuntu systems, or in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               12 Jan 2010                                            byobu-select-session(1)
