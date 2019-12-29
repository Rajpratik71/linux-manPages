FILE2BRL(1)                                  User Commands                                 FILE2BRL(1)

NAME
       file2brl - manual page for file2brl (liblouisutdml) 2.7.1

SYNOPSIS
       file2brl [OPTION] [inputFile] [outputFile]

DESCRIPTION
       Translate an xml or a text file into an embosser-ready braille file.  This includes translation
       into grade two, if desired, mathematical codes, etc. It also includes formatting according to a
       built-in style sheet which can be modified by the user.

       If  inputFile is not specified or '-' input is taken from stdin. If outputFile is not specified
       the output is sent to stdout.

       -h, --help
              display this help and exit

       -v, --version
              display version information and exit

       -f, --config-file
              name a configuration file that specifies how to do the translation

       -b, --backward
              backward translation

       -r, --reformat
              reformat a braille file

       -T, --text
              Treat as text even if xml

       -t, --html
              html document, not xhtml

       -p, --poorly-formatted
              translate a poorly formatted file

       -P, --paragraph-line
              treat each block of text ending in a newline as a paragraph. If there  are  two  newline
              characters a blank line will be inserted before the next paragraph

       -C, --config-setting
              specify  particular configuration settings They override any settings that are specified
              in a config file

       -w  --writeable-path
              path for temp files and log file

       -l, --log-file
              write errors to file2brl.log instead of stderr

AUTHOR
       Written by John J. Boyer.

REPORTING BUGS
       Report bugs to <liblouis-liblouisxml@freelists.org>.

COPYRIGHT
       Copyright © 2013 ViewPlus Technologies, Inc. and JJB Software, Inc.  License  GPLv3+:  GNU  GPL
       version 3 or later <http://gnu.org/licenses/gpl.html>.
       This  is  free  software: you are free to change and redistribute it.  There is NO WARRANTY, to
       the extent permitted by law.

SEE ALSO
       The full documentation for file2brl is maintained  as  a  Texinfo  manual.   If  the  info  and
       file2brl programs are properly installed at your site, the command

              info liblouisutdml

       should give you access to the complete manual.

file2brl (liblouisutdml) 2.7.1                August 2019                                  FILE2BRL(1)
