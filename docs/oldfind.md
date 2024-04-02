OLDFIND(1)                                                                                 General Commands Manual                                                                                 OLDFIND(1)



NAME
       oldfind - search for files in a directory hierarchy

SYNOPSIS
       oldfind [-H] [-L] [-P] [-D debugopts] [-Olevel] [path...] [expression]

DESCRIPTION
       The  oldfind  and  find  programs are functionally identical.  The only difference between them is the implementation internals of how the filesystem is searched.  The oldfind binary has a recursive
       implementation while find uses fts(3).  The fts-based implementation will replace the recursive implementation but for the moment both implementations are installed.

       The implementation which is installed as find on this system is the fts-based implementation, since the --without-fts option was not passed to the configure script when findutils was built.

SEE ALSO
       find(1), fts(3), Finding Files (on-line in Info, or printed).



                                                                                                                                                                                                   OLDFIND(1)
