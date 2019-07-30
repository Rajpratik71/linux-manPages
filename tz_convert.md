TZ_CONVERT(1)                                                                                                                                                               TZ_CONVERT(1)

NAME
       tz_convert - Timezone converter from operating system tz format into libical format used by Orage and several other calander tools.

SYNOPSIS
       tz_convert [OPTION...] [INFILE]

DESCRIPTION
       tz_convert is a command line tool, which can be used to convert timezone data from so called tz binary format, usually used in operating systems, to libical format, used by
       several calenders like Orage.

       There are several options available to only convert certain files or files in certain directory. Or only convert part of the file and ignore for example old data. It is also
       possible to add new timezone files, which are based on old timezone data.

       There are tools, which generate ical timezones data from tz source database, but those are often not available for normal users and are difficult to use. So often libical
       timezones are not upto date.  tz_convert reads directly the binary tz data and makes it possible to keep libical timezones up to date. The tool is mainly meant to be used by
       distro maintainers, but it should be easy and clear enough for all users.

FILES
       tz timezone files often can be found in directory /usr/share/zoneinfo. For example Europe/Helsinki. libical timezone files needs to be where you calendar can find them. For Xfce
       and Orage systems they are located under your Xfce directory in share/orage/libical/zoneinfo. For example Europe/Helsinki.ics. (use locate to find them.)

OPTIONS
       -V, --version
           Print version information and exit.

       -?, --help
           Show this help message and exit.

       --usage
           Show short usage summary.

       -i, --infile
           tz file name from operating system to convert from. If this is directory, all files in it are processed. Default is /usr/share/zoneinfo

       -o, --outfile
           ical timezone file name to be written. This can not be directory. It is meant to be used together with timezone parameter. This is very seldom used. Default is
           timezone/infile.ics

       -m, --message
           debug message level. How much exra information is shown. 0 is least and 10 is highest (1=default). May give usefull information when things do not work as expected.

       -l, --limit
           limit processing to newer than this year. Often there is a lot of old data available, which is not needed in normal day to day work and skipping unused years helps to improve
           performance. Default is to ignore older than year 1970 time changes.

       -t, --timezone
           timezone name to be used in the actual file. Normally file name is the same as timezone name, but if you want to create your own timezone, you need new file name, which
           contains some known timezone name. This is used together with outfile parameter.

       -r, --norecursive
           process only main directory, instead of all subdirectories. 0 = recursive 1 = only main directory (0=default).

       -c, --exclude count
           number of excluded directories. 5 = default (You only need this if you have more than 5 excluded directories). This is used together with exclude parameter.

       -x, --exclude
           do not process this directory, skip it. You can give several directories with separate parameters. By default directories right and posix are excluded, but if you use this
           parameter, you have to specify those also. You need to use exclude count if you have more than 5 exclude directories.

       -u, --norrule
           do not use RRULE ical repeating rule, but use RDATE instead. Not all calendars are able to understand RRULE correctly with timezones. (Orage should work fine with RRULE). 0 =
           use RRULE 1 = do not use RRULE (0=default).

BUGS
       Please report any bugs and enhancement requests to http://bugzilla.xfce.org/. Note that tz_convert is part of orage so bugs are reported against orage and component tz_convert.
       Usage related questions can be sent to xfce@xfce.org email list.

HOMEPAGE
       http://www.xfce.org/projects/orage/

AUTHOR
       tz_convert was written by Juha Kautto <juha@xfce.org>.

       This manual page was written by Juha Kautto <juha@xfce.org>.

                                                                                        05/28/2009                                                                          TZ_CONVERT(1)
