MCOMP(1)                                                                                   Mtools Users Manual                                                                                   MCOMP(1)

NAME
       mcomp - Compares two files using mtools

SYNOPSIS
       mcomp file-on-floppy local-file

DESCRIPTION
       mcomp compares two files, the first one must be on a floppy disk so it can be accesed via mtools.  It is not strictly necessary on Debian GNU/Linux, because the diffutils cmp(1) program provides
       the same capability after copying the file locally with

       mcopy file destination

       but this utility is provided in the mtools package for other platforms and is retained here for completeness.

AUTHOR
       Luis Bustamante <luferbu@fluidsignal.com> wrote this page for the Debian/GNU mtools package.

SEE ALSO
       mtools(1), cmp(1), mcopy(1)

                                                                                       Mon Mar  3 11:58:15 COT 2003                                                                              MCOMP(1)
