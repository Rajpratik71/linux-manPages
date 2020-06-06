MXTAR(1)                                                                                   Mtools Users Manual                                                                                   MXTAR(1)

NAME
       mxtar - Wrapper for using GNU tar directly from a floppy disk

SYNOPSIS
       mxtar [ - ] [ tar-options ] file

DESCRIPTION
       mxtar  let you use GNU tar(1) on a floppy disk without mounting it using mtools(1).  It is not strictly necessary on Debian GNU/Linux, because the GNU tar(1) program provides the same capability
       after copying the file locally with

       mcopy file destination

       but this utility is provided in the mtools package for other platforms and is retained here for completeness.

AUTHOR
       Luis Bustamante <luferbu@fluidsignal.com> wrote this page for the Debian/GNU mtools package.

SEE ALSO
       mtools(1), tar(1), mcopy(1)

                                                                                       Mon Mar  3 11:58:15 COT 2003                                                                              MXTAR(1)
