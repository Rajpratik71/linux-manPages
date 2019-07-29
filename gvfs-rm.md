GVFS-RM(1)                                                         User Commands                                                        GVFS-RM(1)

NAME
       gvfs-rm - Delete files

SYNOPSIS
       gvfs-rm [OPTION...] [FILE...]

DESCRIPTION
       gvfs-rm deletes each given file.

       The files can be specified as paths or as URIs with a scheme that is understood by gvfs. Note that not all URI schemes may allow deletion
       of files.

       gvfs-rm deletes files irreversibly. If you want a reversible way to trash files, see gvfs-trash.

OPTIONS
       The following options are understood:

       -?, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -f, --force
           Ignore nonexistent and non-deletable files.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       rm(1), gvfs-trash(1)

gvfs                                                                                                                                    GVFS-RM(1)
