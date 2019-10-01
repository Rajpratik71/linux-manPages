CAL(1)                                                                                          User Commands                                                                                          CAL(1)



NAME
       cal - display a calendar

SYNOPSIS
       cal [options] [[[day] month] year]

DESCRIPTION
       cal displays a simple calendar.  If no arguments are specified, the current month is displayed.

OPTIONS
       -1, --one
              Display single month output.  (This is the default.)

       -3, --three
              Display prev/current/next month output.

       -s, --sunday
              Display Sunday as the first day of the week.

       -m, --monday
              Display Monday as the first day of the week.

       -j, --julian
              Display Julian dates (days one-based, numbered from January 1).

       -y, --year
              Display a calendar for the current year.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help screen and exit.

PARAMETERS
       A single parameter specifies the year (1 - 9999) to be displayed; note the year must be fully specified: cal 89 will not display a calendar for 1989.

       Two parameters denote the month (1 - 12) and year.

       Three  parameters  denote  the day (1-31), month and year, and the day will be highlighted if the calendar is displayed on a terminal. If no parameters are specified, the current month's calendar is
       displayed.

       A year starts on Jan 1. The first day of the week is determined by the locale.

       The Gregorian Reformation is assumed to have occurred in 1752 on the 3rd of September. By this time, most countries had recognized the reformation (although a few did  not  recognize  it  until  the
       early 1900's). Ten days following that date were eliminated by the reformation, so the calendar for that month is a bit unusual.

HISTORY
       A cal command appeared in Version 6 AT&T UNIX.

AVAILABILITY
       The cal command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        June 2011                                                                                            CAL(1)
