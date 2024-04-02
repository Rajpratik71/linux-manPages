FIDENTIFY(8)                                                   Administration Tools                                                   FIDENTIFY(8)

NAME
       fidentify - Determine file type using PhotoRec database

SYNOPSIS
       fidentify [--check] [directory|file]

       fidentify --version

DESCRIPTION
          fidentify identify the file type, the "extension", by using the same database than PhotoRec.
          When a file or directory is specified, fidentify will output the type of file, or files under the specified directory.
          If given no arguments, fidentify will output type of files under current directory.
          fidentify is similar to file(1).

OPTIONS
       --check
              check the file format like PhotoRec does by default

SEE ALSO
       photorec(8),testdisk(8),file(1)

AUTHOR
       PhotoRec 7.0, Data Recovery Utility, April 2015
       Christophe GRENIER <grenier@cgsecurity.org>
       http://www.cgsecurity.org

2015                                                                   April                                                          FIDENTIFY(8)
