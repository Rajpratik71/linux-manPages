HRENAME(1)                                                    General Commands Manual                                                   HRENAME(1)

NAME
       hrename - rename or move an HFS file or directory

SYNOPSIS
       hrename hfs-src-path [...]  hfs-target-path

DESCRIPTION
       hrename  changes  the name and/or location of one or more files or directories. If only one source path is specified and the target path is
       in the same directory as the source, only the name is changed. Otherwise the source object is moved as well as possibly being renamed.

       If multiple source paths are specified, the target must be a directory, and all of the source objects will be moved into  it  (keeping  the
       same names.)

       If the source path refers to the root directory of a volume, the volume name will be changed. The root directory cannot be moved. Note that
       volume names can only have 1-27 characters, while all other names may have 1-31 characters.

SEE ALSO
       hfsutils(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            04-Jun-1996                                                         HRENAME(1)
