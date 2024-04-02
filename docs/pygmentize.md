PYGMENTIZE(1)                                                 General Commands Manual                                                PYGMENTIZE(1)

NAME
       pygmentize - highlights the input file

SYNOPSIS
       pygmentize [-l <lexer>] [-F <filter>[:<options>]] [-f <formatter>] [-O <options>] [-P <option=value>] [-o <outfile>] [<infile>]
       pygmentize -S <style> -f <formatter> [-a <arg>] [-O <options>] [-P <option=value>]
       pygmentize -L [<which> ...]
       pygmentize -H <type> <name>
       pygmentize -h | -V

DESCRIPTION
       Pygments  is  a generic syntax highlighter for general use in all kinds of software such as forum systems, wikis or other applications that
       need to prettify source code.

       Its highlights are:
         * a wide range of common languages and markup formats is supported
         * special attention is paid to details, increasing quality by a fair amount
         * support for new languages and formats are added easily
         * a number of output formats, presently HTML, LaTeX and ANSI sequences
         * it is usable as a command-line tool and as a library
         * ... and it highlights even Brainfuck!

       pygmentize is a command that uses Pygments to highlight the input file and write the result to <outfile>. If no <infile> is given, stdin is
       used.

OPTIONS
       A summary of options is included below.

       -l <lexer>
              Set the lexer name. If not given, the lexer is guessed from the extension of the input file name (this obviously doesn't work if the
              input is stdin).

       -F <filter>[:<options>]
              Add a filter to the token stream. You can give options in the same way as for -O after a colon  (note:  there  must  not  be  spaces
              around the colon).  This option can be given multiple times.

       -f <formatter>
              Set the formatter name. If not given, it will be guessed from the extension of the output file name. If no output file is given, the
              terminal formatter will be used by default.

       -o <outfile>
              Set output file. If not given, stdout is used.

       -O <options>
              With this option, you can give the lexer and formatter a comma-separated list of  options,  e.g.  "-O  bg=light,python=cool".  Which
              options are valid for which lexers and formatters can be found in the documentation.  This option can be given multiple times.

       -P <option=value>
              This option adds lexer and formatter options like the -O option, but you can only give one option per -P. That way, the option value
              may contain commas and equals signs, which it can't with -O.

       -S <style>
              Print out style definitions for style <style> and for formatter <formatter>.  The meaning of the argument given by -a <arg> is  for‐
              matter dependent and can be found in the documentation.

       -L [<which> ...]
              List  lexers,  formatters,  styles  or filters. Set <which> to the thing you want to list (e.g. "styles"), or omit it to list every‐
              thing.

       -H <type> <name>
              Print detailed help for the object <name> of type <type>, where <type> is one of "lexer", "formatter" or "filter".

       -h     Show help screen.

       -V     Show version of the Pygments package.

SEE ALSO
       /usr/share/doc/python-pygments/index.html

AUTHOR
       pygmentize was written by Georg Brandl <g.brandl@gmx.net>.

       This manual page was written by Piotr Ozarowski <ozarow@gmail.com>, for the Debian project (but may be used by others).

                                                                 February 15, 2007                                                   PYGMENTIZE(1)
