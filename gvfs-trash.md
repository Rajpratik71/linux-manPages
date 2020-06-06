GVFS-TRASH(1)                                                                                 User Commands                                                                                 GVFS-TRASH(1)

NAME
       gvfs-trash - Move files or directories to the trash

SYNOPSIS
       gvfs-trash [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-trash sends files or directories to the "Trashcan". This can be a different folder depending on where the file is located, and not all file systems support this concept. In the common case
       that the file lives inside a users home directory, the trash folder is $XDG_DATA_HOME/Trash.

       Note that moving files to the trash does not free up space on the file system until the "Trashcan" is emptied. If you are interested in deleting a file irreversibly, see gvfs-rm.

       Inspecting and emptying the "Trashcan" is normally supported by graphical file managers such as nautilus, but you can also see the trash with the command gvfs-ls trash://.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -f, --force
           Ignore nonexistent and non-deletable files.

       --empty
           Empty the trash.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       ls(1), gvfs-rm(1), Desktop Trash Can specification[1]

NOTES
        1. Desktop Trash Can specification
           http://freedesktop.org/wiki/Specifications/trash-spec

gvfs                                                                                                                                                                                        GVFS-TRASH(1)
