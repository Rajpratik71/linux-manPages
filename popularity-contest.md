POPULARITY-CONTEST(8)                                                                                                                                                            POPULARITY-CONTEST(8)

NAME
       popularity-contest - list the most popular Debian packages

SYNOPSIS
       popularity-contest

DESCRIPTION
       The  popularity-contest  command gathers information about Debian packages installed on the system, and prints the name of the most recently used executable program in that package as well as
       its last-accessed time (atime) and last-attribute-changed time (ctime) to stdout.

       When aggregated with the output of popularity-contest from many other systems, this information is valuable because it can be used to determine which Debian packages are  commonly  installed,
       used, or installed and never used.  This helps Debian maintainers make decisions such as  which packages should be installed by default on new systems.

       The resulting statistic is available from the project home page https://popcon.debian.org/.

       Normally,  popularity-contest is run from a cron(8) job, /etc/cron.daily/popularity-contest, which automatically submits the results to Debian package maintainers (only once a week) according
       to the settings in /etc/popularity-contest.conf and /usr/share/popularity-contest/default.conf.

SEE ALSO
       The popularity-contest FAQ at /usr/share/doc/popularity-contest/FAQ popcon-largest-unused(8), cron(8)

       Additional documentation is in /usr/share/doc/popularity-contest/.

AUTHOR
       Avery Pennarun <apenwarr@debian.org>.

Debian/GNU Linux                                                                             November 2001                                                                       POPULARITY-CONTEST(8)
