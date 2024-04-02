byobu-prompt(1)                                                        byobu                                                       byobu-prompt(1)

NAME
       byobu-prompt, byobu-enable-prompt, byobu-disable-prompt - add and remove a nice color prompt to your shell configuration

SYNOPSIS
       byobu-prompt

       byobu-enable-prompt

       byobu-disable-prompt

DESCRIPTION
       Byobu  provides  a  special PS1 prompt command, compatible with Bash shells.  It will display the previous command's exit code, if it's not
       zero.  It will use 3 separate colors for the local username, hostname, and the current working directory.

       byobu-enable-prompt will add one line to your ~/.bashrc.

       You can safely remove the line from your ~/.bashrc, which ends in #byobu-prompt.

       byobu-disable-prompt will remove its color configuration from ~/.bashrc.

       byobu-prompt is an interactive wrapper of the previous two tools.

BUGS
       This is currently only compatible with bash(1).

SEE ALSO
       bash(1)
       http://byobu.org

AUTHOR
       This manpage and the utility were written by Dustin Kirkland <kirkland@byobu.org> for Ubuntu systems (but may be used by others).   Permis‐
       sion  is  granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 published by
       the Free Software Foundation.

       The complete text of the GNU General Public License can  be  found  in  /usr/share/common-licenses/GPL  on  Debian/Ubuntu  systems,  or  in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                              26 July 2013                                                    byobu-prompt(1)
