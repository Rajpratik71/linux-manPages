SLN(8)                                                                                    Linux Programmer's Manual                                                                                    SLN(8)



NAME
       sln - create symbolic links

SYNOPSIS
       sln source dest
       sln filelist

DESCRIPTION
       The  sln  program  creates symbolic links.  Unlike the ln(1) program, it is statically linked.  This means that if for some reason the dynamic linker is not working, sln can be used to make symbolic
       links to dynamic libraries.

       The command line has two forms.  In the first form, it creates dest as a new symbolic link to source.

       In the second form, filelist is a list of space-separated pathname pairs, and the effect is as if sln was executed once for each line of the file, with the two pathnames as the arguments.

       The sln program supports no command-line options.

SEE ALSO
       ln(1), ldconfig(8), ld.so(8)

COLOPHON
       This page is part of release 3.53 of the Linux man-pages project.  A description of the project, and information about reporting bugs, can be found at http://www.kernel.org/doc/man-pages/.



GNU                                                                                               2013-02-10                                                                                           SLN(8)
