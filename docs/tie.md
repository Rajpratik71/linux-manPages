TIE(1)                                                                           General Commands Manual                                                                           TIE(1)

NAME
       tie - merge or apply WEB change files

SYNOPSIS
       tie -c|-m outputfile masterfile changefile...

DESCRIPTION
       The tie program is used to process multiple change files used with the WEB system for literate programming.  The WEB programs allow to apply patches to a source file (the master‐
       file) by means of a number of change files (often only a single change file is allowed).  Tie can be used to either merge up to 32 change files into a single one or to apply  the
       changes to the masterfile in order to create a new one.  Output of either the new change file or the patched master file goes into outputfile.

OPTIONS
       -c     Create a single change file from the given changefiles.

       -m     Create a new master file by applying the given changefiles.

ENVIRONMENT
       The environment variable WEBINPUTS is used to search for the input files, or the system default if WEBINPUTS is not set.  See tex(1) for the details of the searching.

SEE ALSO
       web(1), ctie(1), cweb(1).

AUTHOR
       Klaus Guntermann, TH Darmstadt, Institut f. Theoretische Informatik.  Man page by Joachim Schnitter, TH Darmstadt, Phys. Chemie I.

Web2C 2019/dev                                                                         7 April 2010                                                                                TIE(1)
