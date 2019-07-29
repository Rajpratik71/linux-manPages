GVFS-MOVE(1)                                                       User Commands                                                      GVFS-MOVE(1)

NAME
       gvfs-move - Copy files

SYNOPSIS
       gvfs-move [OPTION...] [SOURCE] [DEST]

       gvfs-move [OPTION...] [SOURCE...] [DIRECTORY]

DESCRIPTION
       gvfs-move moves a file from SOURCE to DEST, or multiple SOURCEs to DIRECTORY.

       gvfs-move is similar to the traditional mv utility, but using gvfs locations instead of local files: for example you can use something like
       smb://server/resource/file.txt as location.

OPTIONS
       The following options are understood:

       -h, --help
           Prints a short help text and exits.

       --version
           Shows the version number and exits.

       -T, --no-target-directory
           Don't move into DEST even if it is a directory.

       -p, --progress
           Show progress.

       -i, --interactive
           Prompt before overwriting files.

       -b, --backup
           Backup existing destination files.

       -C, --no-copy-fallback
           Don't use copy and delete fallback.

EXIT STATUS
       On success 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       mv(1)

gvfs                                                                                                                                  GVFS-MOVE(1)
