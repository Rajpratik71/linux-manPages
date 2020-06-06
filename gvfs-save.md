GVFS-SAVE(1)                                                                                  User Commands                                                                                  GVFS-SAVE(1)

NAME
       gvfs-save - Save standard input

SYNOPSIS
       gvfs-save [OPTION...] {DEST}

DESCRIPTION
       gvfs-save reads from the standard input and saves the data to the given location.

       This is similar to just redirecting output to a file using traditional shell syntax, but gvfs-save allows using gvfs locations instead of local files: for example you can use something like
       smb://server/resource/file.txt as location.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -b, --backup
           If the destination file already exists, save a backup.

       -c, --create
           Only create the destination file if it does not exist yet.

       -a, --append
           Append to the end of the destination file, if it already exists.

       -p, --private
           When creating a new file, restrict access to the current user only.

       -u, --unlink
           When replacing an existing file, replace the destination as if it does not exist. Think of it as unlinking the destination before writing.

       -v, --print-etag
           Print the new etag at the end.

       -e, --etag=ETAG
           The etag of the file being overwritten.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

gvfs                                                                                                                                                                                         GVFS-SAVE(1)
