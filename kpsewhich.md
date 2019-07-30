KPSEWHICH(1)                                                                     General Commands Manual                                                                     KPSEWHICH(1)

NAME
       kpsewhich - standalone path lookup and and expansion for kpathsea

SYNOPSIS
       kpsewhich [options] [filenames]

DESCRIPTION
       This  manual  page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Kpathsea: A library for path search‐
       ing.

       kpsewhich is used as a standalone front-end of the kpathsea library that can be used to examine variables and find files.  When the -format option is not given, the  search  path
       used when looking for a file is inferred from the name given, by looking for a known extension.  If no known extension is found, the search path for TeX source files is used.

OPTIONS
       kpsewhich accepts the following options:

       -debug num
              Set debugging flags.

       -D num Use a base resolution of num; the default, set by the installer, is typically 600.

       -dpi num
              As -D.

       -engine string
              Set $engine in the environment, which is used in some search paths.

       -expand-braces string
              Print variable and brace expansion of string.

       -expand-path string
              Print complete path expansion of string.

       -expand-var string
              Print variable expansion of string.

       -format name
              Use file type name.  See the info manual for a list of valid names, or use the -help option to print the list.

       -help  Print help message and exit.

       -interactive
              Ask for additional filenames to look up.

       -mktex fmt
              enable mktexfmt generation.  (fmt=pk/mf/tex/tfm)

       -mode string
              Set device name for $MAKETEX_MODE to string; no default.

       -must-exist
              Search the disk as well as ls-R if necessary.

       -no-mktex fmt
              disable mktexfmt generation.  (fmt=pk/mf/tex/tfm)

       -path string
              Search in the path string.

       -progname string
              Set program name to string.

       -show-path name
              Output search path for file type name.  See the info manual for a list of valid names, or use the -help option to print the list.

       -var-value variable
              Print the expansion of variable.

       -version
              Print version information and exit.

SEE ALSO
       mktexlsr(1), mktexmf(1), mktexpk(1), mktextfm(1).

Kpathsea 6.3.1/dev                                                                     1 March 2011                                                                          KPSEWHICH(1)
