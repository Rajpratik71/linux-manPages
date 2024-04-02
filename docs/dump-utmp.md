DUMP-UTMP(8)                                                                               GNU Accounting Utilities                                                                              DUMP-UTMP(8)



NAME
       dump-utmp - print an utmp file in human-readable format.


SYNOPSIS
       dump-utmp [-r|--reverse] [-R|--raw] [-n|--num recs] [-h|--help] [ files]


DESCRIPTION
       dump-utmp filename prints a list of all logins. This list is usually written in /var/log/wtmp.

       All fields are separated by vertical line. Fields are: user name, tty, type, id, pid, hostaddr, host, time.


OPTIONS
       -h, --help
              Prints the usage string and default locations of system files to standard output and exits.

       -n, --num recs
              Number of lines to print.

       -r, --reverse
              Start printing from last records.

       -R, --raw
              Print raw records, not human-readable.


FILES
       wtmp   The system wide login record file. See wtmp(5) for further details.


SEE ALSO
       login(1), wtmp(5), init(8), sa(8).


AUTHOR
       The GNU accounting utilities were written by Noel Cragg <noel@gnu.ai.mit.edu>.

       This manual page was written by Ognyan Kulev <ogi@fmi.uni-sofia.bg> and updated by Daniel Baumann <daniel@debian.org> for the Debian project (but may be used by others).



6.5.1                                                                                             2006-04-22                                                                                     DUMP-UTMP(8)
