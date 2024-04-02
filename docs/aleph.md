ALEPH(1)                                                                         General Commands Manual                                                                         ALEPH(1)

NAME
       aleph - extended Unicode TeX

SYNOPSIS
       aleph [options] [&format] [file|\commands]

DESCRIPTION
       Run  the  Aleph  typesetter on file, usually creating file.dvi.  If the file argument has no extension, ".tex" will be appended to it.  Instead of a filename, a set of Aleph com‐
       mands can be given, the first of which must start with a backslash.  With a &format argument Aleph uses a different set of precompiled commands, contained in  format.fmt;  it  is
       usually better to use the -fmt format option instead.

       Aleph is a version of the TeX program modified for multilingual typesetting.  It uses Unicode, and has additional primitives for (among other things) bidirectional typesetting.

       Aleph's command line options are similar to those of TeX.

       Aleph is no longer being actively developed; see LuaTeX for current activity.

OPTIONS
       Run aleph --help to see the complete list of options; this is not exhaustive.

       --fmt format
              Use format as the name of the format to be used, instead of the name by which Aleph was called or a %& line.

       --halt-on-error
              Exit with an error code when an error is encountered during processing.

       --help Print help message and exit.

       --ini  Be `initial' Aleph for dumping formats; this is implicitly true if the program is called as inialeph.

       --interaction mode
              Sets  the  interaction  mode.   The mode can be one of batchmode, nonstopmode, scrollmode, and errorstopmode.  The meaning of these modes is the same as that of the corre‐
              sponding \commands.

       --ipc  Send DVI output to a socket as well as the usual output file.  Whether this option is available is the choice of the installer.

       --ipc-start
              As --ipc, and starts the server at the other end as well.  Whether this option is available is the choice of the installer.

       --kpathsea-debug bitmask
              Sets path searching debugging flags according to the bitmask.  See the Kpathsea manual for details.

       --maketex fmt
              Enable mktexfmt, where fmt must be one of tex or tfm.

       --no-maketex fmt
              Disable mktexfmt, where fmt must be one of tex or tfm.

       --output-comment string
              Use string for the DVI file comment instead of the date.

       --output-directory directory
              Write output files in directory instead of the current directory.  Look up input files in directory first, the along the normal search path.

       --parse-first-line
              If the first line of the main input file begins with %& parse it to look for a dump name.

       --progname name
              Pretend to be program name.  This affects both the format used and the search paths.

       --recorder
              Enable the filename recorder.  This leaves a trace of the files opened for input and output in a file with extension .ofl.  (This option is always on.)

       --shell-escape
              Enable the \write18{command} construct.  The command can be any Bourne shell command.  By default, this construct is enabled in a restricted mode, for security reasons.

       --version
              Print version information and exit.

ENVIRONMENT
       See the Kpathsearch library documentation (the `Path specifications' node) for precise details of how the environment variables are used.  The kpsewhich utility can  be  used  to
       query the values of the variables.

       One  caveat:  In  most Aleph formats, you cannot use ~ in a filename you give directly to Aleph, because ~ is an active character, and hence is expanded, not taken as part of the
       filename.  Other programs, such as Metafont, do not have this problem.

       TEXMFOUTPUT
              Normally, Aleph puts its output files in the current directory.  If any output file cannot be opened there, it tries to open it in the directory specified in the  environ‐
              ment  variable  TEXMFOUTPUT.  There is no default value for that variable.  For example, if you say tex paper and the current directory is not writable, if TEXMFOUTPUT has
              the value /tmp, Aleph attempts to create /tmp/paper.log (and /tmp/paper.dvi, if any output is produced.)  TEXMFOUTPUT is also checked for input files, as TeX often  gener‐
              ates files that need to be subsequently read; for input, no suffixes (such as ``.tex'') are added by default, the input name is simply checked as given.

       TEXINPUTS
              Search  path  for \input and \openin files.  This should start with ``.'', so that user files are found before system files.  An empty path component will be replaced with
              the paths defined in the texmf.cnf file.  For example, set TEXINPUTS to ".:/home/user/tex:" to prepend the current directory and ``/home/user/tex'' to the standard  search
              path.

       TEXEDIT
              Command template for switching to editor.  The default, usually vi, is set when Aleph is compiled.

NOTES
       This  manual  page  is  not  meant  to  be  exhaustive.   The  complete  documentation for this version of Aleph can be found in the info manual Web2C: A TeX implementation.  See
       http://tug/org/web2c.

BUGS
       This version of Aleph implements a number of optional extensions.  In fact, many of these extensions conflict to a greater or lesser extent with the definition  of  Aleph.   When
       such extensions are enabled, the banner printed when Aleph starts is changed to print Alephk instead of Aleph.

       This  version  of Aleph fails to trap arithmetic overflow when dimensions are added or subtracted.  Cases where this occurs are rare, but when it does the generated DVI file will
       be invalid.

SEE ALSO
       tex(1), mf(1)

AUTHORS
       The primary authors of Aleph are John Plaice and Yannis Haralambous.

Web2C 2019/dev                                                                         27 May 2018                                                                               ALEPH(1)
