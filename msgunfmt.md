MSGUNFMT(1)                          GNU                          MSGUNFMT(1)

NAME
       msgunfmt - uncompile message catalog from binary format

SYNOPSIS
       msgunfmt [OPTION] [FILE]...

DESCRIPTION
       Convert binary message catalog to Uniforum style .po file.

       Mandatory  arguments  to  long options are mandatory for short options
       too.

   Operation mode:
       -j, --java
              Java mode: input is a Java ResourceBundle class

       --csharp
              C# mode: input is a .NET .dll file

       --csharp-resources
              C# resources mode: input is a .NET .resources file

       --tcl  Tcl mode: input is a tcl/msgcat .msg file

   Input file location:
       FILE ...
              input .mo files

       If no input file is given or if it is -, standard input is read.

   Input file location in Java mode:
       -r, --resource=RESOURCE
              resource name

       -l, --locale=LOCALE
              locale name, either language or language_COUNTRY

       The class name is determined by  appending  the  locale  name  to  the
       resource  name,  separated  with  an underscore.  The class is located
       using the CLASSPATH.

   Input file location in C# mode:
       -r, --resource=RESOURCE
              resource name

       -l, --locale=LOCALE
              locale name, either language or language_COUNTRY

       -d DIRECTORY
              base directory for locale dependent .dll files

       The -l and -d options are mandatory.  The .dll file is  located  in  a
       subdirectory  of  the  specified  directory  whose name depends on the
       locale.

   Input file location in Tcl mode:
       -l, --locale=LOCALE
              locale name, either language or language_COUNTRY

       -d DIRECTORY
              base directory of .msg message catalogs

       The -l and -d options are mandatory.  The .msg file is located in  the
       specified directory.

   Output file location:
       -o, --output-file=FILE
              write output to specified file

       The results are written to standard output if no output file is speci‐
       fied or if it is -.

   Output details:
       --color
              use colors and other text attributes always

       --color=WHEN
              use colors and other text attributes  if  WHEN.   WHEN  may  be
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
              write indented output style

       --strict
              write strict uniforum style

       -p, --properties-output
              write out a Java .properties file

       --stringtable-output
              write out a NeXTstep/GNUstep .strings file

       -w, --width=NUMBER
              set output page width

       --no-wrap
              do  not  break  long message lines, longer than the output page
              width, into several lines

       -s, --sort-output
              generate sorted output

   Informative output:
       -h, --help
              display this help and exit

       -V, --version
              output version information and exit

       -v, --verbose
              increase verbosity level

AUTHOR
       Written by Ulrich Drepper.

REPORTING BUGS
       Report bugs to <bug-gnu-gettext@gnu.org>.

COPYRIGHT
       Copyright  ©  1995-1998,  2000-2016  Free  Software  Foundation,  Inc.
       License     GPLv3+:     GNU     GPL     version     3     or     later
       <http://gnu.org/licenses/gpl.html>
       This is free software: you are free to  change  and  redistribute  it.
       There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for msgunfmt is maintained as a Texinfo manual.
       If the info and msgunfmt programs are properly installed at your site,
       the command

              info msgunfmt

       should give you access to the complete manual.

GNU gettext-tools 0.19.8.1        June 2016                       MSGUNFMT(1)
