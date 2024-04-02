PCRE-CONFIG(1)                          General Commands Manual                         PCRE-CONFIG(1)

NAME
       pcre-config - program to return PCRE configuration

SYNOPSIS
       pcre-config   [--prefix]   [--exec-prefix]   [--version]   [--libs]  [--libs-posix]  [--cflags]
       [--cflags-posix]

DESCRIPTION
       pcre-config returns the configuration of the installed PCRE libraries: the options required  to
       compile a program to use them.

OPTIONS
       --prefix  Writes  the  directory prefix used in the PCRE installation for architecture indepen‐
                 dent files (e.g. /usr) to standard output.

       --exec-prefix
                 Writes the directory prefix used in the PCRE installation for architecture  dependent
                 files (normally the same as --prefix) to standard output.

       --version Writes the version of PCRE installed to standard output.

       --libs    Writes  to  standard output the command line options required to link with PCRE (e.g.
                 -lpcre).

       --libs-posix
                 Writes to standard output the command line options required to  link  with  the  PCRE
                 POSIX emulation library (e.g. -lpcreposix -lpcre).

       --cflags  Writes to standard output the command line options required to compile files that use
                 PCRE (this often includes some -I options, but is blank on debian systems).

       --cflags-posix
                 Writes to standard output the command line options required to compile files that use
                 the  PCRE  POSIX emulation library (this often includes some -I options, but is blank
                 on debian systems). Suppress printing of filenames when searching multiple files.

       AUTHOR
              This manual page was written by Mark Baker <mark@mnb.org.uk>, for the  Debian  GNU/Linux
              system (but may be used by others).

SEE ALSO
       pcre(3)

                                                                                        PCRE-CONFIG(1)
