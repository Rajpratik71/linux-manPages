GVFS-TREE(1)                                                                                  User Commands                                                                                  GVFS-TREE(1)

NAME
       gvfs-tree - List contents of directories in a tree-like format

SYNOPSIS
       gvfs-tree [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-tree lists the contents of the given directories recursively, in a tree-like format. If no location is given, it defaults to the current directory.

       gvfs-tree is similar to the traditional tree utility, but using gvfs locations instead of local files: for example you can use something like smb://server/resource/mydir as location.

OPTIONS
       The following options are understood:

       -?, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -h, --hidden
           Show hidden files.

       -l, --follow-symlinks
           Follow symbolic links, mounts and shortcuts.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       tree(1), gvfs-ls(1)

gvfs                                                                                                                                                                                         GVFS-TREE(1)
