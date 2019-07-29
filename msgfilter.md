MSGFILTER(1)                         GNU                         MSGFILTER(1)

NAME
       msgfilter - edit translations of message catalog

SYNOPSIS
       msgfilter [OPTION] FILTER [FILTER-OPTION]

DESCRIPTION
       Applies a filter to all translations of a translation catalog.

       Mandatory  arguments  to  long options are mandatory for short options
       too.

   Input file location:
       -i, --input=INPUTFILE
              input PO file

       -D, --directory=DIRECTORY
              add DIRECTORY to list for input files search

       If no input file is given or if it is -, standard input is read.

   Output file location:
       -o, --output-file=FILE
              write output to specified file

       The results are written to standard output if no output file is speci‐
       fied or if it is -.

       The  FILTER  can be any program that reads a translation from standard
       input and writes a modified translation to standard output.

   Filter input and output:
       --newline
              add a newline at the end of input and remove a newline from the
              end of output

   Useful FILTER-OPTIONs when the FILTER is 'sed':
       -e, --expression=SCRIPT
              add SCRIPT to the commands to be executed

       -f, --file=SCRIPTFILE
              add the contents of SCRIPTFILE to the commands to be executed

       -n, --quiet, --silent
              suppress automatic printing of pattern space

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

       --no-escape
              do not use C escapes in output (default)

       -E, --escape
              use C escapes in output, no extended chars

       --force-po
              write PO file even if empty

       --indent
              indented output style

       --keep-header
              keep header entry unmodified, don't filter it

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
       The  full  documentation for msgfilter is maintained as a Texinfo man‐
       ual.  If the info and msgfilter programs  are  properly  installed  at
       your site, the command

              info msgfilter

       should give you access to the complete manual.

GNU gettext-tools 0.19.8.1        June 2016                      MSGFILTER(1)
