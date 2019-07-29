GVFS-INFO(1)                                                       User Commands                                                      GVFS-INFO(1)

NAME
       gvfs-info - Show information about files

SYNOPSIS
       gvfs-info [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-info shows information about the given locations.

       gvfs-info is similar to the traditional ls utility, but using gvfs locations instead of local files: for example you can use something like
       smb://server/resource/file.txt as location.

       File attributes can be specified with their gvfs name, e.g. standard::icon, or just by namespace, e.g. unix, or by '*' which matches all
       attributes. Several attributes or groups can be specified, separated by comma.

       By default, gvfs-info shows all attributes.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -w, --query-writable
           Show writable attributes and their types.

       -f, --filesystem
           Show information about the filesystem on which the files reside.

       -a, --attributes=ATTRIBUTES
           The attributes to get, specified as a comma-separated list of gvfs file attribute names.

       -n, --nofollow-symlinks
           Don't follow symlinks.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       ls(1), gvfs-ls(1), GIO file attributes[1]

NOTES
        1. GIO file attributes
           http://developer.gnome.org/gio/2.32/gio-GFileAttribute.html

gvfs                                                                                                                                  GVFS-INFO(1)
