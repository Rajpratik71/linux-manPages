KOI8RXTERM(1)                                                                                X Window System                                                                                KOI8RXTERM(1)

NAME
       koi8rxterm - X terminal emulator for KOI8-R environments

SYNOPSIS
       koi8rxterm [ xterm-options ]

DESCRIPTION
       koi8rxterm  is a wrapper around the xterm(1) program that invokes the latter program with the “KOI8RXTerm” X resource class set.  All arguments to koi8rxterm are passed to xterm without process‐
       ing; the -class and -k8 options should not be specified because they are used by the wrapper.  See the xterm manual page for more information on xterm-options.

       The environment's locale settings (see “ENVIRONMENT” below) are used to discern the locale's character set.  If no current locale can be determined, the locale “ru_RU.KOI8-R” (the  Russian  lan‐
       guage as used in the territory of Russia, with the KOI8-R character set) is assumed.  The locale(1) utility is used to determine whether the system supports the selected locale.  If it does not,
       koi8rxterm will exit with an error and report the output of locale.

       Note: koi8rxterm may produce unexpected results if the current locale is set to one in which the KOI8-R character encoding is not supported, or if fonts using that encoding  are  not  available.
       In the Debian system, the “xfonts-cyrillic” package provides the fonts that koi8rxterm uses by default.  To change the fonts koi8rxterm uses, edit the /etc/X11/app-defaults/KOI8RXTerm file.

       A similar wrapper, uxterm(1), is available for Unicode UTF-8 environments.

ENVIRONMENT
       LC_ALL, LC_CTYPE, LANG
              The values of these variables are checked, in order, to determine the character set used by the current locale.

AUTHOR
       koi8rxterm was written by Branden Robinson and is very heavily based on uxterm, by Thomas Dickey.  The assistance of Jurij Smakov was invaluable in sanity-checking its operation.

SEE ALSO
       locale(1), locale(7), uxterm(1), xterm(1)

Patch #322                                                                                      2016-01-02                                                                                  KOI8RXTERM(1)
