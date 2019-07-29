NL(1)                           User Commands                           NL(1)

NAME
       nl - number lines of files

SYNOPSIS
       nl [OPTION]... [FILE]...

DESCRIPTION
       Write each FILE to standard output, with line numbers added.

       With no FILE, or when FILE is -, read standard input.

       Mandatory  arguments  to  long options are mandatory for short options
       too.

       -b, --body-numbering=STYLE
              use STYLE for numbering body lines

       -d, --section-delimiter=CC
              use CC for logical page delimiters

       -f, --footer-numbering=STYLE
              use STYLE for numbering footer lines

       -h, --header-numbering=STYLE
              use STYLE for numbering header lines

       -i, --line-increment=NUMBER
              line number increment at each line

       -l, --join-blank-lines=NUMBER
              group of NUMBER empty lines counted as one

       -n, --number-format=FORMAT
              insert line numbers according to FORMAT

       -p, --no-renumber
              do not reset line numbers for each section

       -s, --number-separator=STRING
              add STRING after (possible) line number

       -v, --starting-line-number=NUMBER
              first line number for each section

       -w, --number-width=NUMBER
              use NUMBER columns for line numbers

       --help display this help and exit

       --version
              output version information and exit

       By default, selects -v1 -i1 -l1 -sTAB -w6 -nrn -hn -bt  -fn.   CC  are
       two  delimiter characters used to construct logical page delimiters, a
       missing second character implies :.  Type \\ for \.  STYLE is one of:

       a      number all lines

       t      number only nonempty lines

       n      number no lines

       pBRE   number only lines that contain a match for  the  basic  regular
              expression, BRE

       FORMAT is one of:

       ln     left justified, no leading zeros

       rn     right justified, no leading zeros

       rz     right justified, leading zeros

AUTHOR
       Written by Scott Bartram and David MacKenzie.

REPORTING BUGS
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>
       Report nl translation bugs to <http://translationproject.org/team/>

COPYRIGHT
       Copyright  ©  2017 Free Software Foundation, Inc.  License GPLv3+: GNU
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       Full documentation at: <http://www.gnu.org/software/coreutils/nl>
       or available locally via: info '(coreutils) nl invocation'

GNU coreutils 8.28               January 2018                           NL(1)
