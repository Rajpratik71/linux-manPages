TARTEST(1)                                                                                  Schily´s USER COMMANDS                                                                                 TARTEST(1)



NAME
       tartest - test tar archive for POSIX.1-1990 compliance

SYNOPSIS
       tartest [ options ] < file

DESCRIPTION
       Tartest reads a tar archive from stdin and checks this archive for compliance with POSIX.1-1990.


OPTIONS
       All options can be abbreviated by their first letter.

       -help  Print a short help message.

       -v     print all filenames during verification.


ENVIRONMENT
       none


FILES
       none


NOTES
       As  tartest  is  limited  to tests the data that is delivered by the tar archiver that is going to be checked, it cannot tests if the tar archiver in question will produce correct archives under all
       circumstances. There may be borderline cases that trigger bugs in the tar archiver.

       If you like to to a more complete test, you should have a look at the file READE.quicktest in the directory testscripts of either the star distribution or the ftp server.


BUGS
Joerg Schilling                                                                                    02/06/23                                                                                        TARTEST(1)
