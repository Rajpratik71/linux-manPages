bterm(1)                                                      General Commands Manual                                                     bterm(1)

NAME
       bterm - framebuffer terminal emulator

SYNOPSIS
       bterm -f font.bgf [-l locale] [program]

DESCRIPTION
       bterm  is  a terminal emulator for the Linux framebuffer.  It supports multibyte locales and wide characters, in addition to basic terminal
       features such as cursor positioning.

OPTIONS
       -f font.bgf
              Specify the font.  BGF fonts are produced by bdftobogl(1) from standard BDF font files.

       -l locale
              Specify a locale for bterm and processes run within it.  The locale may also be specified normally in the environment.  If a locale,
              especially  one  with a different character set than the current locale, will be used inside of bterm, it should be specified on the
              command line.

EXIT STATUS
       The following exit values are returned:

       0      Successful completion.

       1-125  Exit code from executed program

       127    Failed to exec program

       >=128  Program terminated by signal.

NOTES
       On Debian systems, one appropriate BDF font can be found in the bf-utf-source package.

SEE ALSO
       bdftobogl(1)

AUTHOR
       This manual page was written by Daniel Jacobowitz <dan@debian.org>.

BOGL                                                               31 March 2002                                                          bterm(1)
