file-roller(1)                          General Commands Manual                         file-roller(1)

NAME
       file-roller - archive manager for GNOME

SYNOPSIS
       file-roller [OPTIONS...]  [FILE...]

DESCRIPTION
       File Roller is a graphical interface to archiving utilities such as tar and zip.

       It  supports most common operations such as creating, modifing and extracting files from an ar‐
       chive. You can also view the contents of an archive and open files contained in the archive.

OPTIONS
       -a, --add-to=ARCHIVE
              Add files to the specified archive and quit the program

       -d, --add FILE
              Add files asking the name of the archive and quit the program

       -e, --extract-to=FOLDER
              Extract archives to the specified folder and quit the program

       -f, --extract
              Extract archives asking the destination folder and quit the program

       -h, --extract-here
              Extract archives using the archive name as destination folder and quit the program

       --default-dir=FOLDER
              Default folder to use for the '--add' and '--extract' commands

       --force
              Create destination folder without asking confirmation

       This program also accepts the standard GNOME and GTK options.

AUTHORS
       file-roller is written by Paolo Bacchilega <paolo.bacch@tin.it>.

       This manual page was written by Sven Arvidsson <sa@whiz.se>, for the Debian project (but may be
       used by others).

SEE ALSO
       gtk-options(7), gnome-options(7)

       The online documentation available through the program's Help menu.

GNOME                                         2007-09-27                                file-roller(1)
