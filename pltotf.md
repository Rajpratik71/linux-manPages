PLTOTF(1)                                                                        General Commands Manual                                                                        PLTOTF(1)

NAME
       pltotf - convert property list files to TeX font metric (tfm) format

SYNOPSIS
       pltotf [-verbose] pl_file_name[.pl] [tfm_file_name[.tfm]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  pltotf  program  translates a (human-oriented) property list file to a (program-oriented) TeX font metric file. Thus, after editing the property list file, a TFM file can be
       generated for use with, for example, tex(1).

       The pl_file_name is extended with .pl if it lacks a suffix. No path searching is done.

       If no tfm_file_name is given, the basename of pl_file_name with suffix .tfm is used; otherwise tfm_file_name is extended with .tfm if it lacks a suffix.

OPTIONS
       Without the -verbose option, pltotf operates silently.  With it, a banner and progress report are printed on stdout.

SEE ALSO
       tftopl(1).
       Donald E. Knuth, TeXware.
       Donald E. Knuth, The Metafontbook, (Volume C of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13445-4.

AUTHORS
       Donald E. Knuth wrote the program. It was published as part of the TeXware technical report, available from the TeX Users Group.  Howard Trickey, Pavel Curtis, and Richard Furuta
       originally ported it to Unix.

Web2C 2019/dev                                                                         16 June 2015                                                                             PLTOTF(1)
