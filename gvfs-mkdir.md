GVFS-MKDIR(1)                                                      User Commands                                                     GVFS-MKDIR(1)

NAME
       gvfs-mkdir - Create directories

SYNOPSIS
       gvfs-mkdir [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-mkdir creates directories.

       gvfs-mkdir is similar to the traditional mkdir utility, but using gvfs locations instead of local files: for example you can use something
       like smb://server/resource/mydir as location.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -p, --parent
           Create parent directories when necessary.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       mkdir(1)

gvfs                                                                                                                                 GVFS-MKDIR(1)
