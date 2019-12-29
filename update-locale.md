UPDATE-LOCALE(8)                        System Manager's Manual                       UPDATE-LOCALE(8)

NAME
       update-locale - Modify global locale settings

SYNTAX
       update-locale [OPTIONS] [var=locale | var] [...]

DESCRIPTION
       This program can be called by maintainer scripts when Debian packages are installed or removed,
       it updates the /etc/default/locale file to reflect changes in system configuration  related  to
       global  locale  settings.  When variables have no value assigned, they are removed from the lo‐
       cale file.  Some basic checks are performed to ensure that requested settings are valid.

OPTIONS
       --help Display an help message and exit.

       --reset
              Variables which are not set on command-line are cleared out.

       --locale-file FILE
              Define file containing locale variables.  (Default: /etc/default/locale)

       --no-checks
              Do not perform sanity checks on locale variables.

EXAMPLE
       The command
               update-locale LANG=en_CA.UTF-8 LANGUAGE
       sets LANG to en_CA.UTF-8 and removes definitions for LANGUAGE.

FILES
       /etc/default/locale
              File where global locale settings are stored.

AUTHOR
       Denis Barbier <barbier@linuxfr.org>

SEE ALSO
       locale-gen(8), locale(1)

Debian GNU/Linux                              April 2006                              UPDATE-LOCALE(8)
