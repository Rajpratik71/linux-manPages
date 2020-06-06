validlocale(8)                                                                                                                                                                             validlocale(8)

NAME
       validlocale - Test if a given locale is available

SYNTAX
       validlocale <locale>

DESCRIPTION
       Test if the locale given as argument is a valid locale.  If it isn't, print on stdout the string to add to /etc/locale.gen to make locale-gen generate the locale (if it exists at all).

FILES
       /usr/sbin/validlocale
       /usr/share/i18n/SUPPORTED

ENVIRONMENT VARIABLES
       DEFAULTCHARSET
              Which charset to assume if the given locale is missing from the list of supported locales.

EXAMPLES
       If you give a valid locale as parameter, it outputs a string specifying this on stderr:

              % validlocale C
              locale 'C' valid and available

       When  given  a invalid (not generated or just nonexistent), it outputs a string on stderr telling that this is an invalid locale, and a string to stdout with the string to add to /etc/locale.gen
       to have this locale generated:

              % validlocale de_AU@euro
              locale 'de_AU@euro' not available
              de_AU@euro ISO-8859-15

AUTHORS
       Petter Reinholdtsen <pere@hungry.com>

SEE ALSO
       locale-gen(8), localedef(1), locale(1)

Petter Reinholdtsen                                                                                0.1                                                                                     validlocale(8)
