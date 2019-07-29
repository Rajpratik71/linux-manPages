CAL(1)                                                                                          User Commands                                                                                          CAL(1)



NAME
       cal - display a calendar

SYNOPSIS
       cal [options] [[[day] month] year]
       cal [options] <timestamp|monthname>

DESCRIPTION
       cal displays a simple calendar.  If no arguments are specified, the current month is displayed.

       The month may be specified as a number (1-12), as a month name or as an abbreviated month name according to the current locales.

OPTIONS
       -1, --one
              Display single month output.  (This is the default.)

       -3, --three
              Display three months spanning the date.

       -n , --months number
              Display number of months, starting from the month containing the date.

       -S, --span
              Display months spanning the date.

       -s, --sunday
              Display Sunday as the first day of the week.

       -m, --monday
              Display Monday as the first day of the week.

       -j, --julian
              Display Julian dates (days one-based, numbered from January 1).

       -y, --year
              Display a calendar for the whole year.

       -Y, --twelve
              Display a calendar for the next twelve months.

       -w, --week[=number]
              Display week numbers in the calendar (US or ISO-8601).

       --color[=when]
              Colorize  the  output.   The  optional argument when can be auto, never or always.  If the when argument is omitted, it defaults to auto.  The colors can be disabled; for the current built-in
              default see the --help output.  See also the COLORS section.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

PARAMETERS
       Single digits-only parameter (e.g. 'cal 2020')
              Specifies the year to be displayed; note the year must be fully specified: cal 89 will not display a calendar for 1989.

       Single string parameter (e.g. 'cal tomorrow' or 'cal August')
              Specifies timestamp or a month name (or abbreviated name) according to the current locales.

              The special placeholders are accepted when parsing timestamp, "now" may be used to refer to the current time, "today", "yesterday", "tomorrow" refer to of the current day, the day  before  or
              the next day, respectively.

              The  relative  date specifications are also accepted, in this case "+" is evaluated to the current time plus the specified time span. Correspondingly, a time span that is prefixed with "-" is
              evaluated to the current time minus the specified time span, for example '+2days'. Instead of prefixing the time span with "+" or "-", it may also be suffixed with a space and the word "left"
              or "ago" (for example '1 week ago').

       Two parameters (e.g. 'cal 11 2020')
              Denote the month (1 - 12) and year.

       Three parameters (e.g. 'cal 25 11 2020')
              Denote the day (1-31), month and year, and the day will be highlighted if the calendar is displayed on a terminal.  If no parameters are specified, the current month's calendar is displayed.

NOTES
       A year starts on January 1.  The first day of the week is determined by the locale.

       The  week numbering depends on the choice of the first day of the week.  If Sunday (the default) is used for the first day of the week, then the customary North American numbering will be used, i.e.
       the first Sunday of the year starts the first week.  If Monday is selected, then the ISO-8601 standard week numbering is used, where the first Thursday of the year is in week number 1.

COLORS
       Implicit coloring can be disabled as follows:

              touch /etc/terminal-colors.d/cal.disable

       See terminal-colors.d(5) for more details about colorization configuration.

BUGS
       The cal program uses the 3rd of September 1752 as the date of the Gregorian calendar reformation -- that is when it happened in Great Britain and its  colonies  (including  what  is  now  the  USA).
       Starting  at  that  date, eleven days were eliminated by this reformation, so the calendar for that month is rather unusual.  The actual historical dates at which the calendar reform happened in all
       the different countries (locales) are ignored.

       Alternative calendars, such as the Umm al-Qura, the Solar Hijri, the Ge'ez, or the lunisolar Hindu, are not supported.

HISTORY
       A cal command appeared in Version 6 AT&T UNIX.

AVAILABILITY
       The cal command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        June 2015                                                                                            CAL(1)
