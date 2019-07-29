UPDATE-LANGUAGE(8)                                        System Administration Utilities                                       UPDATE-LANGUAGE(8)

NAME
       update-language - generate hyphenation configuration for TeX engines

SYNOPSIS
       update-language(-dat,-def,-lua) [OPTIONS ...]

DESCRIPTION
       Generate hyphenation configuration files language.dat, .def, .dat.lua

       When called as update-language, all three configurations files are generated. Otherwise only the selected one.

OPTIONS
       -c, --conf-file=FILE
              file giving additional hyphen specifications

       -o, --output-file=FILE file to write the output to

       -d, --output-dir=DIR
              directory where files are written

       --checks
              perform sanity checks on the generated config file

       -q, --quiet
              don't write anything to the standard output during normal operation

       -h, -?, --help
              display this help message and exit

       --version
              output version information and exit

FILES
       The default output directory is

              /var/lib/texmf/tex/generic/config

       The default output files are

       for update-language-dat
              language.dat

       for update-language-def
              language.def

       for update-language-lua
              language.dat.lua

       If -o/--output-file is given, it overrides all defaults.

Debian                                                            September 2017                                                UPDATE-LANGUAGE(8)
