GVFS-COPY(1)                                                       User Commands                                                      GVFS-COPY(1)

NAME
       gvfs-copy - Copy files

SYNOPSIS
       gvfs-copy [OPTION...] [SOURCE] [DEST]

       gvfs-copy [OPTION...] [SOURCE...] [DIRECTORY]

DESCRIPTION
       gvfs-copy copies a file from SOURCE to DEST, or multiple SOURCEs to DIRECTORY.

       gvfs-copy is similar to the traditional cp utility, but using gvfs locations instead of local files: for example you can use something like
       smb://server/resource/file.txt as location.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -T, --no-target-directory
           Don't copy into DEST even if it is a directory.

       -p, --progress
           Show progress.

       -i, --interactive
           Prompt before overwriting files.

       --preserve
           Preserve all attributes.

       -b, --backup
           Backup existing destination files.

       -P, --no-dereference
           Never follow symlinks.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       cp(1)

gvfs                                                                                                                                  GVFS-COPY(1)
