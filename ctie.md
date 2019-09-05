CTIE(1)                                                                          General Commands Manual                                                                          CTIE(1)

NAME
       ctie - merge or apply CWEB change files

SYNOPSIS
       ctie -c|-m outputfile masterfile changefile...

DESCRIPTION
       The  ctie program is used to process multiple change files used with the CWEB system for literate programming.  The CWEB programs allow one to apply patches to a source file (the
       masterfile) by means of a single change file.  ctie can be used to either merge up to 32 change files into a single one or to apply the changes to the masterfile in order to cre‐
       ate  a  new master file.  Output of either the new change file or the patched master file goes into outputfile.  Any include files (indicated using the CWEB @i command) are fully
       expanded during ctie processing, which means that the change files are able to modify the contents of any included files.

OPTIONS
       -c     Create a single change file from the given changefiles.

       -m     Create a new master file by applying the given changefiles.

ENVIRONMENT
       The environment variable CWEBINPUTS is used to search for the input files, or the system default if CWEBINPUTS is not set.  See tex(1) for the details of the searching.

SEE ALSO
       cweb(1), ctiedoc.tex, tie(1), web(1).

AUTHOR
       Julian Gilbey, jdg@debian.org.  The original TIE program was by Klaus Guntermann, TH Darmstadt, Institut f. Theoretische Informatik.  The TIE man page was by  Joachim  Schnitter,
       TH Darmstadt, Phys. Chemie I, and was modified for CTIE by Julian Gilbey.

Web2C 2019/dev                                                                         7 April 2010                                                                               CTIE(1)
