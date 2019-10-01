MKTEXPK(1)                                                                                 General Commands Manual                                                                                 MKTEXPK(1)



NAME
       mktexpk - create a PK file for a font

SYNOPSIS
       mktexpk [options] font [redirect]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Kpathsea: A library for path searching.

       mktexpk is used to generate a pk file from the Metafont source files or type1 sources for font, if possible.

       If redirect is given, it must be string of the form >&n where n is the number of the file descriptor which is to receive, instead of standard output, the name of the generated file.

       mktexpk is typically called by other programs, rather than from the command line.

OPTIONS
       mktexpk accepts the following options:

       --bdpi num
              Set the base device resolution.

       --dpi num
              Generate the font at resolution num.

       --help Print help message and exit.

       --mag mag
              The Metafont magnification that corresponds to the combination of bdpi and dpi that has been specified.

       --mfmode mode
              The Metafont mode to use.

       --destdir dir
              A directory name. If the directory is absolute, it is used as-is.  Otherwise, it is appended to the root destination directory set in the script.

       --version
              Print version information and exit.

BUGS
       If the mode is not specified, mktexpk tries to determine it from bdpi.  The manner in which this is done is primitive.  Since bpdi doesn't provide sufficient information to uniquely determine a mode
       it is strongly recommended that it be specified explicitly.

       If the mode and bpdi don't match, the mode is discarded.

       The dpi parameter is redundant, but is not checked for consistency.  Worse, the program will fail if the wrong dpi is specified.

SEE ALSO
       mktexmf(1), mktextfm(1).



Kpathsea 6.1.0                                                                                   1 March 2011                                                                                      MKTEXPK(1)
