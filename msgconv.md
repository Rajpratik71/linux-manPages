MSGCONV(1)                           GNU                           MSGCONV(1)

NAME
       msgconv - character set conversion for message catalog

SYNOPSIS
       msgconv [OPTION] [INPUTFILE]

DESCRIPTION
       Converts a translation catalog to a different character encoding.

       Mandatory  arguments  to  long options are mandatory for short options
       too.

   Input file location:
       INPUTFILE
              input PO file

       -D, --directory=DIRECTORY
              add DIRECTORY to list for input files search

       If no input file is given or if it is -, standard input is read.

   Output file location:
       -o, --output-file=FILE
              write output to specified file

       The results are written to standard output if no output file is speci‐
       fied or if it is -.

   Conversion target:
       -t, --to-code=NAME
              encoding for output

       The default encoding is the current locale's encoding.

   Input file syntax:
       -P, --properties-input
              input file is in Java .properties syntax

       --stringtable-input
              input file is in NeXTstep/GNUstep .strings syntax

   Output details:
       --color
              use colors and other text attributes always

       --color=WHEN
              use  colors  and  other  text  attributes if WHEN.  WHEN may be
              'always', 'never', 'auto', or 'html'.

       --style=STYLEFILE
              specify CSS style rule file for --color

       -e, --no-escape
              do not use C escapes in output (default)

       -E, --escape
              use C escapes in output, no extended chars

       --force-po
              write PO file even if empty

       -i, --indent
              indented output style

       --no-location
              suppress '#: filename:line' lines

       -n, --add-location
              preserve '#: filename:line' lines (default)

       --strict
              strict Uniforum output style

       -p, --properties-output
              write out a Java .properties file

       --stringtable-output
              write out a NeXTstep/GNUstep .strings file

       -w, --width=NUMBER
              set output page width

       --no-wrap
              do not break long message lines, longer than  the  output  page
              width, into several lines

       -s, --sort-output
              generate sorted output

       -F, --sort-by-file
              sort output by file location

   Informative output:
       -h, --help
              display this help and exit

       -V, --version
              output version information and exit

AUTHOR
       Written by Bruno Haible.

REPORTING BUGS
       Report bugs to <bug-gnu-gettext@gnu.org>.

COPYRIGHT
       Copyright  © 2001-2016 Free Software Foundation, Inc.  License GPLv3+:
       GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The  full documentation for msgconv is maintained as a Texinfo manual.
       If the info and msgconv programs are properly installed at your  site,
       the command

              info msgconv

       should give you access to the complete manual.

GNU gettext-tools 0.19.8.1        June 2016                        MSGCONV(1)
