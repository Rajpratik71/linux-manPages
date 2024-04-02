MKTEXMF(1)                                                                       General Commands Manual                                                                       MKTEXMF(1)

NAME
       mktexmf - create a Metafont source file

SYNOPSIS
       mktexmf font

DESCRIPTION
       This  manual  page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Kpathsea: A library for path search‐
       ing.

       mktexmf is used to generate the Metafont source file for font, if possible.  For example, ecrm1200 or cmr11.

       The name of the generated file is printed on standard output.

       mktexmf is typically called by other programs, rather than from the command line.

OPTIONS
       mktexmf accepts the following options:

       --help Print help message and exit.

       --version
              Print version information and exit.

SEE ALSO
       mktexpk(1), mktextfm(1).

Kpathsea 6.3.1/dev                                                                     1 March 2011                                                                            MKTEXMF(1)
