UXTERM(1)                                   X Window System                                  UXTERM(1)

NAME
       uxterm - X terminal emulator for Unicode (UTF-8) environments

SYNOPSIS
       uxterm [ xterm-options ]

DESCRIPTION
       uxterm  is  a wrapper around the xterm(1) program that invokes the latter program with the “UX‐
       Term” X resource class set.  All arguments to uxterm are passed to  xterm  without  processing;
       the  -class  and -u8 options should not be specified because they are used by the wrapper.  See
       the xterm manual page for more information on xterm-options.

       The environment's locale settings (see “ENVIRONMENT” below) are used to  discern  the  locale's
       character  set.   If  no current locale can be determined, the locale “en_US” (the English lan‐
       guage as used in the territory of the United States) is assumed.  The locale(1) utility is used
       to determine whether the system supports the selected locale.  If it does not, uxterm will exit
       with an error and report the output of locale.

       Note: uxterm may produce unexpected results if the current locale is set to one  in  which  the
       UTF-8  character encoding is not supported, or if fonts using the ISO 10646-1 character set are
       not available.  In the Debian system, the “xfonts-base” package provides the fonts that  uxterm
       uses by default.  To change the fonts uxterm uses, edit the /etc/X11/app-defaults/UXTerm file.

       A similar wrapper, koi8rxterm(1), is available for KOI8-R environments.

ENVIRONMENT
       LC_ALL, LC_CTYPE, LANG
              The values of these variables are checked, in order, to determine the character set used
              by the current locale.

AUTHOR
       Thomas Dickey

SEE ALSO
       locale(1), locale(7), koi8rxterm(1), xterm(1)

Patch #348                                    2019-07-22                                     UXTERM(1)
