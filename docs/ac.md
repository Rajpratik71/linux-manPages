AC(1)                                                                                      General Commands Manual                                                                                      AC(1)



NAME
       ac -  print statistics about users' connect time

SYNOPSIS
       ac     [ -d | --daily-totals ] [ -y | --print-year ]
              [ -p | --individual-totals ] [ people ]
              [ -f | --file filename ] [ -a | --all-days ]
              [ --complain ] [ --reboots ] [ --supplants ]
              [ --timewarps ] [ --compatibility ]
              [ --tw-leniency num ] [ --tw-suspicious num ]
              [ -z | --print-zeros ] [ --debug ]
              [ -V | --version ] [ -h | --help ]

DESCRIPTION
       ac prints out a report of connect time (in hours) based on the logins/logouts in the current wtmp file.  A total is also printed out.

       The accounting file wtmp is maintained by init(8) and login(1).  Neither ac nor login creates the wtmp if it doesn't exist, no accounting is done.  To begin accounting, create the file with a length
       of zero.

       NOTE:  The wtmp file can get really big, really fast.  You might want to trim it every once and a while.

       GNU ac works nearly the same u*x ac, though it's a little smarter in several ways.  You should therefore expect differences in the output of GNU ac and the output of ac's on other systems.  Use  the
       command info accounting to get additional information.

OPTIONS
       -d, --daily-totals
              Print totals for each day rather than just one big total at the end.  The output looks like this:
                      Jul  3  total     1.17
                      Jul  4  total     2.10
                      Jul  5  total     8.23
                      Jul  6  total     2.10
                      Jul  7  total     0.30
       -p, --individual-totals
              Print time totals for each user in addition to the usual everything-lumped-into-one value.  It looks like:
                      bob       8.06
                      goff      0.60
                      maley     7.37
                      root      0.12
                      total    16.15
       people Print out the sum total of the connect time used by all of the users included in people.  Note that people is a space separated list of valid user names; wildcards are not allowed.
       -f, --file filename
              Read from the file filename instead of the system's wtmp file.
       --complain
              When the wtmp file has a problem (a time-warp, missing record, or whatever), print out an appropriate error.
       --reboots
              Reboot  records  are  NOT written at the time of a reboot, but when the system restarts; therefore, it is impossible to know exactly when the reboot occurred.  Users may have been logged into
              the system at the time of the reboot, and many ac's automatically count the time between the login and the reboot record against the user (even though all of that time shouldn't be,  perhaps,
              if the system is down for a long time, for instance).  If you want to count this time, include the flag.  *For vanilla ac compatibility, include this flag.*
       --supplants
              Sometimes,  a  logout record is not written for a specific terminal, so the time that the last user accrued cannot be calculated.  If you want to include the time from the user's login to the
              next login on the terminal (though probably incorrect), include this you want to include the time from the user's login to the next login on the terminal (though probably incorrect),  include
              this flag.  *For vanilla ac compatibility, include this flag.*
       --timewarps
              Sometimes,  entries in a wtmp file will suddenly jump back into the past without a clock change record occurring.  It is impossible to know how long a user was logged in when this occurs.  If
              you want to count the time between the login and the time warp against the user, include this flag.  *For vanilla ac compatibility, include this flag.*
       --compatibility
              This is shorthand for typing out the three above options.
       -a, --all-days
              If we're printing daily totals, print a record for every day instead of skipping intervening days where there is no login activity.  Without this flag, time accrued during  those  intervening
              days gets listed under the next day where there is login activity.
       --tw-leniency num
              Set  the  time warp leniency to num seconds.  Records in wtmp files might be slightly out of order (most notably when two logins occur within a one-second period - the second one gets written
              first).  By default, this value is set to 60.  If the program notices this problem, time is not assigned to users unless the --timewarps flag is used.
       --tw-suspicious num
              Set the time warp suspicious value to num seconds.  If two records in the wtmp file are farther than this number of seconds apart, there is a problem with  the  wtmp  file  (or  your  machine
              hasn't been used in a year).  If the program notices this problem, time is not assigned to users unless the --timewarps flag is used.
       -y, --print-year
              Print year when displaying dates.
       -z, --print-zeros
              If a total for any category (save the grand total) is zero, print it.  The default is to suppress printing.
       --debug
              Print verbose internal information.
       -V, --version
              Print the version number of ac to standard output and quit.
       -h, --help
              Prints the usage string and default locations of system files to standard output and exits.
FILES
       wtmp
              The system wide login record file. See wtmp(5) for further details.
AUTHOR
       The GNU accounting utilities were written by Noel Cragg <noel@gnu.ai.mit.edu>. The man page was adapted from the accounting texinfo page by Susan Kleinmann <sgk@sgk.tiac.net>.
SEE ALSO
       login(1), wtmp(5), init(8), sa(8)



                                                                                                2010 August 16                                                                                          AC(1)
