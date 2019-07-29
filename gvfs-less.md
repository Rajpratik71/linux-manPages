GVFS-LESS(1)                    User Commands                    GVFS-LESS(1)

NAME
       gvfs-less - Execute less on the output of gvfs-cat

SYNOPSIS
       gvfs-less [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-less executes less on the output of gvfs-cat.

       gvfs-less works just like the traditional less utility, but using gvfs
       locations instead of local files: for example you can use something
       like smb://server/resource/file.txt as location.

OPTIONS
       See less(1) for the options.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       less(1), gvfs-cat(1)

gvfs                                                             GVFS-LESS(1)
