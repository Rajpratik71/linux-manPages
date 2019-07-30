DVICONCAT(1)                                                                     General Commands Manual                                                                     DVICONCAT(1)

NAME
       dviconcat - concatenate DVI files

SYNOPSIS
       dviconcat [ -m magnification ] [ -o outfile ] list of files

DESCRIPTION
       Dviconcat concatenates the named files (or standard input, if no file names are given) onto the standard output or the given outfile, creating a new DVI file usable by any of the
       TeX conversion programs, or even by dviconcat itself.

       The magnification of the output file is the same as that of the first input file unless the -m option is given.  When dviconcat changes the magnification of any  input  file,  it
       prints a warning to this effect.

AUTHOR
       Chris Torek, University of Maryland

SEE ALSO
       dviselect(1), latex(1), tex(1)
       MC-TeX User's Guide

BUGS
       The program should be called dvicat, but that name was taken (for the driver for the C/A/T typesetter).

                                                                                                                                                                             DVICONCAT(1)
