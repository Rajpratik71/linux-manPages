GVFS-MIME(1)                                                                                  User Commands                                                                                  GVFS-MIME(1)

NAME
       gvfs-mime - Get or set mime handlers

SYNOPSIS
       gvfs-mime --query {MIMETYPE}

       gvfs-mime --set {MIMETYPE} {HANDLER}

DESCRIPTION
       gvfs-mime can query information about applications that are registered to handle a mime-type, or set the default handler for a mime-type.

       Gvfs obtains this information from the shared-mime-info database. The default handler is stored per-user, in the file $XDG_DATA_HOME/applications/mimeapps.list.

       MIMETYPE should be a mime-type such as text/plain or application/mbox. HANDLER should be the name of an existing desktop file such as gedit.desktop.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       --query
           Query the handler for MIMETYPE.

       --set
           Set the default handler for MIMETYPE to HANDLER.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       gvfs-open(1), Shared MIME-Info specification[1]

NOTES
        1. Shared MIME-Info specification
           http://freedesktop.org/wiki/Specifications/shared-mime-info-spec

gvfs                                                                                                                                                                                         GVFS-MIME(1)
