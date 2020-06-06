DIRSPLIT(1)                                                                                   User Commands                                                                                   DIRSPLIT(1)

NAME
       dirsplit - splits directory into multiple with equal size

SYNOPSIS
       dirsplit [options] < directory | content-list-file >

DESCRIPTION
       displit  is designed to for a simple purpose: convert a directory with many multiple files (which are all smaller than a certain medium, eg.  DVD) and "splits" it into "volumes", looking for the
       optimal order to get the best space/medium-number efficiency.

       The actual action is either adding the files to mkisofs catalogs or real moving of files into new directories (or creating links/symlinks).  The method is not limited to files, whole directories
       can also be handled this way (see various filesystem exploration modes).

OPTIONS
       Run dirsplit -h to get the basic usage info.

       Run dirsplit -H to get the whole option overview and description.

EXAMPLES
       Run dirsplit -H to see the commented examples.

AUTHOR
       dirsplit is created by Eduard Bloch (blade@debian.org) and is licensed under the GPLv2.

dirsplit 0.3                                                                                    March 2004                                                                                    DIRSPLIT(1)
