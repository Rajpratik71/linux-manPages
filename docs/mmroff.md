MMROFF(1)                                                                                  General Commands Manual                                                                                  MMROFF(1)



NAME
       mmroff - cross reference preprocessor

SYNOPSIS
       mmroff [ -x ] groff_arguments

DESCRIPTION
       mmroff  is  a simple preprocessor for groff, it is used for expanding cross references in mm, see groff_mm(7).  groff is executed twice, first with -z and -rRef=1 to collect all cross references and
       then to do the real processing when the cross reference file is up to date.

       -x     Just create the cross reference file.  This can be used to refresh the cross reference file, it isn't always needed to have accurate cross references and by using this option groff will  only
              be run once.

AUTHOR
       Jörgen Hägg, Lund, Sweden <jh@axis.se>.

FILES
       /usr/share/groff/1.22.2/tmac/m.tmac

       /usr/share/groff/1.22.2/tmac/mm/*.cov

       /usr/share/groff/1.22.2/tmac/mm/*.MT

       /usr/share/groff/1.22.2/tmac/mm/locale

SEE ALSO
       groff_mm(7), groff_mmse(7), groff(1), troff(1), tbl(1), pic(1), eqn(1)



Groff Version 1.22.2                                                                           07 February 2013                                                                                     MMROFF(1)
