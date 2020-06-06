GVFS-RENAME(1)                                                                                User Commands                                                                                GVFS-RENAME(1)

NAME
       gvfs-rename - Rename a file

SYNOPSIS
       gvfs-rename [OPTION...] {LOCATION} {NEW-NAME}

DESCRIPTION
       gvfs-rename renames a file.

       gvfs-rename is similar to the traditional rename utility, but using gvfs locations instead of local files: for example you can use something like smb://server/resource/file.txt as location.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       rename(1), gvfs-move(1)

gvfs                                                                                                                                                                                       GVFS-RENAME(1)
