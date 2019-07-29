DEJA-DUP(1)                                                        User Commands                                                       DEJA-DUP(1)

NAME
       deja-dup - manual page for deja-dup 34.2

SYNOPSIS
       deja-dup [OPTION...]
       deja-dup --backup
       deja-dup --restore [FILES?]
       deja-dup --restore-missing DIRECTORY

DESCRIPTION
       D?j?  Dup is a simple backup tool.  It hides the complexity of backing up the Right Way (encrypted, off-site, and regular) and uses duplic‐
       ity as the backend.

OPTIONS
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-gtk
              Show GTK+ Options

       --version
              Show version

       --restore
              Restore given files

       --backup
              Immediately start a backup

       --restore-missing
              Restore deleted files

       --display=DISPLAY
              X display to use

SEE ALSO
       duplicity(1)

deja-dup 34.2                                                      December 2016                                                       DEJA-DUP(1)
