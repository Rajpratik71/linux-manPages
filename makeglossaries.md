MAKEGLOSSARIES(1)                                                               makeglossaries Perl Script                                                              MAKEGLOSSARIES(1)

NAME
       makeglossaries  - Calls makeindex/xindy for LaTeX documents using glossaries package

SYNOPSIS
       makeglossaries [-o file] [-q] [-Q] [-k] [-n] [-s file] [-t file] [-L language] [-c] [-g] [-l] [-p num] [-r] [-d aux dir] [-m file] [-x file] [--version] [--help] basename

DESCRIPTION
       makeglossaries is designed for use with LaTeX documents that use the glossaries package. The mandatory argument basename should be the name of the LaTeX document without the .tex
       extension.  makeglossaries will read the auxiliary file to determine whether makeindex or xindy should be called. All the information required to be passed to the relevant
       indexing application should also be contained in the auxiliary file, but may be overridden by the option arguments to makeglossaries.

OPTIONS
       -q  Quiet mode. Reduces chatter to standard output.

       -Q  Silences warning about being unable to fork.

       -k  Don't try forking with piped redirection. (Lessens the effect of -q)

       -n  Print the commands that would normally be executed but don't run them.

       -o file
           Use file as the output file. (Only suitable for documents containing a single glossary, otherwise each glossary will be overridden.)

       -s file
           Use file as the style file. Note that if you use this option, you need to know whether makeindex or xindy will be called, as they have different style files.

       -t file
           Use file as the transcript file.

       -l  Letter ordering.

       -L language
           This option only has an effect if xindy is called. Sets the language. See xindy documentation for further details.

       -c  Compress intermediate blanks (makeindex only).

       -g  Employ German word ordering (makeindex only).

       -p num
           Sets the starting page number to be num (makeindex only).

       -r  Disable implicit page range formation (makeindex only).

       -d aux dir
           Specify the directory the .aux, .glo etc files are located.  Defaults to the parent directory of the base file filename.

       -m file
           Specify the full path name for makeindex to file in the event that makeindex isn't on the operating system's path.

       -x file
           Specify the full path name for xindy to file in the event that xindy isn't on the operating system's path.

       --version
           Prints version number and exits.

       --help
           Prints help message and exits.

REQUIRES
       Perl, Getopt::Std, and makeindex or xindy (depending on glossaries package options).

LICENSE
       This is free software distributed under the LaTeX Project Public License. There is NO WARRANTY.  See <http://www.latex-project.org/lppl.txt> for details.

AUTHOR
       Nicola L. C. Talbot, <http://www.dickimaw-books.com/>

RECOMMENDED READING
       The glossaries manual:

               texdoc glossaries

perl v5.26.2                                                                            2018-07-23                                                                      MAKEGLOSSARIES(1)
