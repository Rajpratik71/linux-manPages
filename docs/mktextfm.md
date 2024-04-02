MKTEXTFM(1)                                                                      General Commands Manual                                                                      MKTEXTFM(1)

NAME
       mktextfm - create a TFM file for a font

SYNOPSIS
       mktextfm [options] font

DESCRIPTION
       This  manual  page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Kpathsea: A library for path search‐
       ing.

       mktextfm is used to generate a tfm file from the Metafont source files for font, if possible.  If destdir is given, the generated  file  will  be  installed  there,  otherwise  a
       (rather complicated) heuristic is used.

       The name of the generated file is printed on standard output.

       mktextfm is typically called by other programs, rather than from the command line.

OPTIONS
       mktextfm accepts the following options:

       --destdir dir
              A directory name. If the directory is absolute, it is used as-is.  Otherwise, it is appended to the root destination directory set in the script.

       --help Print help message and exit.

       --version
              Print version information and exit.

SEE ALSO
       mktexmf(1), mktexpk(1).

Kpathsea 6.3.1/dev                                                                     1 March 2011                                                                           MKTEXTFM(1)
