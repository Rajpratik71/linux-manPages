GVFS-SET-ATTRIBUTE(1)                                              User Commands                                             GVFS-SET-ATTRIBUTE(1)

NAME
       gvfs-set-attribute - Set file attributes

SYNOPSIS
       gvfs-set-attribute [OPTION...] {LOCATION} {ATTRIBUTE} {VALUE...}

DESCRIPTION
       gvfs-set-attribute allows to set a file attribute on a file.

       File attributes can be specified with their gvfs name, e.g. standard::icon. Note that not all file attributes that are supported by gvfs
       are writable.  gvfs-info --query-writable lists writable file attributes.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -t, --type=TYPE
           Specifies the type of the attribute. Supported types are string, stringv, bytestring, boolean, uint32, int32, uint64, int64, object and
           unset.

       -n, --nofollow-symlinks
           Don't follow symlinks.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       gvfs-info(1), GIO file attributes[1]

NOTES
        1. GIO file attributes
           http://developer.gnome.org/gio/2.32/gio-GFileAttribute.html

gvfs                                                                                                                         GVFS-SET-ATTRIBUTE(1)
