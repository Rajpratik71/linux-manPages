hardlink(1)                                                                                General Commands Manual                                                                                hardlink(1)



NAME
       hardlink - Consolidate duplicate files via hardlinks

SYNOPSIS
       hardlink [-c] [-n] [-v] [-vv] [-h] directory1 [ directory2 ... ]

DESCRIPTION
       This manual page documents hardlink, a program which consolidates duplicate files in one or more directories using hardlinks.

       hardlink  traverses  one  or  more  directories  searching  for duplicate files.  When it finds duplicate files, it uses one of them as the master.  It then removes all other duplicates and places a
       hardlink for each one pointing to the master file.  This allows for conservation of disk space where multiple directories on a single filesystem contain many duplicate files.

       Since hard links can only span a single filesystem, hardlink is only useful when all directories specified are on the same filesystem.

OPTIONS
       -c        Compare only the contents of the files being considered for consolidation.  Disregards permission, ownership and other differences.

       -f        Force hardlinking across file systems.

       -n        Do not perform the consolidation; only print what would be changed.

       -v        Print summary after hardlinking.

       -vv       Print every hardlinked file and bytes saved. Also print summary after hardlinking.

       -h        Show help.

AUTHOR
       hardlink was written by Jakub Jelinek <jakub@redhat.com>.

       Man page written by Brian Long.

       Man page updated by Jindrich Novy <jnovy@redhat.com>

BUGS
       hardlink assumes that its target directory trees do not change from under it.  If a directory tree does change, this may result in hardlink accessing files and/or directories outside of the intended
       directory tree.  Thus, you must avoid running hardlink on potentially changing directory trees, and especially on directory trees under control of another user.



                                                                                                                                                                                                  hardlink(1)
