check-language-support(1)                                                               General Commands Manual                                                              check-language-support(1)

NAME
       check-language-support - returns the list of missing packages in order to provide a complete language environment

SYNOPSIS
       check-language-support [options]

OPTIONS
       -h, --help
              show this help message and exit

       -l LANGUAGE, --language=LANGUAGE
              target language code - if omitted, check for all languages on the system

       -d DATADIR, --datadir=DATADIR
              use an alternative data directory instead of the default /usr/share/language-selector

       -a, --all
              check all available languages

       --show-installed
              show installed packages as well as missing ones

AUTHOR
       This manpage has been written by Arne Goetje <arne@ubuntu.com>

version 0.1                                                                               September 23, 2009                                                                 check-language-support(1)
