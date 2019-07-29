GVFS-CAT(1)                                                        User Commands                                                       GVFS-CAT(1)

NAME
       gvfs-cat - Concatenate files

SYNOPSIS
       gvfs-cat [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-cat concatenates the given files and prints them to the standard output.

       gvfs-cat works just like the traditional cat utility, but using gvfs locations instead of local files: for example you can use something
       like smb://server/resource/file.txt as location.

       Note: just pipe through cat if you need its formatting options like -n, -T or other.

OPTIONS
       The following options are understood:

       -?, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       cat(1)

gvfs                                                                                                                                   GVFS-CAT(1)
