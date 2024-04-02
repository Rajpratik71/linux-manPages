PYBABEL(1)                              General Commands Manual                             PYBABEL(1)

NAME
       pybabel - command line tool for working with message catalogs

SYNOPSIS
       pybabel command [options] [args]

OPTIONS
       --version
              show program's version number and exit

       -h, --help
              show this help message and exit

       --list-locales
              print all known locales and exit

       -v, --verbose
              print as much as possible

       -q, --quiet
              print as little as possible

   commands:
       compile
              compile message catalogs to MO files

       extract
              extract messages from source files and generate a POT file

       init   create new message catalogs from a POT file

       update update existing message catalogs from a POT file

       To learn more about the commands run e.g. pybabel compile --help.

AUTHORS
       The  original  program  was  written  by  Edgewall  Software.  This manual page was provided by
       Christoph Haas <haas@debian.org> for the Debian GNU/Linux system but may freely be used by any‐
       one.

                                             January 2008                                   PYBABEL(1)
