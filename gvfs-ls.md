GVFS-LS(1)                                                         User Commands                                                        GVFS-LS(1)

NAME
       gvfs-ls - List files

SYNOPSIS
       gvfs-ls [OPTION...] [LOCATION...]

DESCRIPTION
       gvfs-ls lists information about the given locations. If no location is given, it defaults to the current directory.

       gvfs-ls is similar to the traditional ls utility, but using gvfs locations instead of local files: for example you can use something like
       smb://server/resource/file.txt as location.

       File attributes can be specified with their gvfs name, e.g. standard::icon, or just by namespace, e.g. unix, or by '*' which matches all
       attributes. Several attributes or groups can be specified, separated by comma.

OPTIONS
       The following options are understood:

       -?, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -a, --attributes=ATTRIBUTES
           The attributes to get, specified as a comma-separated list of gvfs file attribute names.

       -h, --hidden
           Show hidden files.

       -l, --long
           Use a long listing format.

       -c, --show-completions=PREFIX
           Show only filenames starting with PREFIX.

       -n, --nofollow-symlinks
           Don't follow symlinks.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       ls(1), gvfs-info(1)

gvfs                                                                                                                                    GVFS-LS(1)
