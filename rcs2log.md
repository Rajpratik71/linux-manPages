RCS2LOG(1)                                                                               BSD General Commands Manual                                                                               RCS2LOG(1)

NAME
     rcs2log — RCS to ChangeLog generator

SYNOPSIS
     rcs2log [-c changelog] [-h hostname] [-i indent] [-l length] [-R] [-r option] [-t tabwidth] [-u login<TAB>fullname<TAB>mailaddr] [-v] [--help] [--version] [file ...]

DESCRIPTION
     The rcs2log utility generates a change log prefix from RCS files (perhaps in the CVS repository) and the ChangeLog (if any).

     The options are as follows:

     -c changelog
             Output a change log prefix to changelog (default ChangeLog).

     -h hostname
             Use hostname in change log entries (default current host).

     -i indent
             Indent change log lines by indent spaces (default 8).

     -l length
             Try to limit log lines to length characters (default 79).

     -R      If no file(s) are given and RCS is used, recurse through working directory.

     -r option
             Pass option to subsidiary log command.

     -t tabwidth
             Tab stops are every tabwidth characters (default 8).

     -u login<TAB>fullname<TAB>mailaddr
             Assume login has fullname and mailaddr.

     -v      Append RCS revision to file names in log lines.

     --help  Output help.

     --version
             Output version number.

SEE ALSO
     rcs(1), rcsintro(1), rlog(1), rcsfile(5)

AUTHORS
     Paul Eggert <eggert@twinsun.com>

BUGS
     Report bugs to <bug-gnu-emacs@gnu.org>.

BSD                                                                                           February 15, 2003                                                                                           BSD
