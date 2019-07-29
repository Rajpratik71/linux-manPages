byobu-ugraph(1)                                                        byobu                                                       byobu-ugraph(1)

NAME
       byobu-ugraph - helper script for notification history graphs

DESCRIPTION
       byobu-ugraph is a helper script that can be used to create history graphs

USAGE
       byobu-ugraph [options] [command [args...]]

OPTIONS
         -f <file>   : File to read data points from.  (only required if no command specified).
         -h          : Show this help.
         -m <num>    : Minimum value (default=$min_default).
         -n          : Supress output of newline character.
         -p <points> : Specify number of data points in graph (default=$points_default).
         -r           : Do not rotate file <file> (default is to rotate).  Option implies file <file> should not be written to so a command cannot
       follow script options in this case.
         -t <theme>  : 'byobu-ulevel' theme to use (default=$theme_default).
         -x <num>    : Maximum value (default=$max_default).

EXAMPLES
       Using byobu-ugraph to run a command, rotate log and display graph.

       Here we specify a command to display available memory.  Trailing echo adds a required newline Note no filename specified.

           byobu-ugraph "(/usr/lib/byobu/mem_used | sed -e 's/% //g';echo)"

       Using byobu-ugraph just to rotate log and display the graph

           file=/tmp/load.dat
           awk '{ print $1}' /proc/loadavg >> $file
           # Note: we need to specify what we consider to be a "reasonable" maximum load
           byobu-ugraph -m 3.0 -f $file

NOTES
       If you specify 'command', care must be taken with shell quoting to avoid expansion prior to this script running the command.

       If '-r' is not specified, the file <file> will be rotated such that at most <points> lines are retained on each invocation of this script.

SEE ALSO
       byobu(1)

       http://byobu.org

AUTHOR
       This utility was written by James Hunt <james.hunt@canonical.com>, and this manpage was written by Dustin Kirkland <kirkland@byobu.org> for
       Ubuntu  systems  (but  may be used by others).  Permission is granted to copy, distribute and/or modify this document and the utility under
       the terms of the GNU General Public License, Version 3 published by the Free Software Foundation.

       The complete text of the GNU General Public License can  be  found  in  /usr/share/common-licenses/GPL  on  Debian/Ubuntu  systems,  or  in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               16 Dec 2013                                                    byobu-ugraph(1)
