GVFS-OPEN(1)                                                                                  User Commands                                                                                  GVFS-OPEN(1)

NAME
       gvfs-open - Open files with the default handler

SYNOPSIS
       gvfs-open [OPTION...] [FILE...]

DESCRIPTION
       gvfs-open opens files with the default application that is registered to handle files of this type.

       Gvfs obtains this information from the shared-mime-info database. The default handler is stored per-user, in the file $XDG_DATA_HOME/applications/mimeapps.list.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       gvfs-mime(1)

gvfs                                                                                                                                                                                         GVFS-OPEN(1)
