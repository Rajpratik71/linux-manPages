hpls(1)                                                                                  General Commands Manual                                                                                  hpls(1)

NAME
       hpls — list the contents of a directory on an HFS+ volume

SYNOPSIS
       hpls [options]  [hfs-path ...]

Description
       hpls  is  used to list files and directories on an HFS+ volume.  If one or more arguments are given, each file or directory is shown; otherwise, the contents of the current working directory are
       displayed.

Options
       -1        Each entry appears on a line by itself.  This is the default if standard output is not a terminal.

       -a        All entries are shown, including "invisible" files.  The default is to omit invisible files.

       -c        Sort and display entries by their creation date, rather than their modification date.

       -d        List directory entries themselves rather than their contents. Normally the contents are shown for named directories on the command-line.

       -i        Show the catalogue ID for each entry.  Every file and directory on an HFS+ volume has a unique catalogue ID.

       -l        Display entries in long format.  This format shows the entry type ("d" for directory, "f" for file, "F" for locked file), flags ("i" for invisible), type  and  creator  (four-character
                 strings)  for  files  only,  size  (number of items in a directory or resource and data bytes of a file, respectively), date of last modification (or creation if the -c         flag is
                 given), and name.

       -m        Display entries in a continuous format separated by commas.

       -q        Replace special and non-printable characters in displayed filenames with question marks (?).  This is the default when standard output is a terminal.

       -r        Sort entries in reverse order before displaying.

       -s        Show the file size for each entry in 1K block units.  The size includes blocks used for both data and resource forks.

       -t        Sort and display entries by time.  Normally files will be sorted by name. This option uses the last modification date to sort unless -c is also specified.

       -x        Display entries in column format like -C, but sorted horizontally into rows rather than columns.

       -w width  Format output lines suitable for display in the given width.  Normally the width will be determined from your terminal, from the environment variable COLUMNS, or from a  default  value
                 of 80.

       -C        Display entries in column format with entries sorted vertically.  This is the default output format when standard output is a terminal.

       -F        Cause  certain  output filenames to be followed by a single-character flag indicating the nature of the entry; directories are followed by a slash "/" and executable Macintosh applica‐
                 tions are followed by an asterisk "*".

       -N        Cause all filenames to be output verbatim without question-mark substitution.

       -R        For each directory that is encountered in a listing, recursively descend into and display its contents.

See also
       hfsplus(7), hpmount(1), hpcd(1), hppwd(1), hprm(1), hpmkdir(1), hpcopy(1), hpumount(1), hpfsck(1).

Author
       This manual page was written by Jens Schmalzing <jensen@debian.org> for Debian GNU/Linux using the manual page by Klaus Halfmann <halfmann@libra.de> that comes with the source code and  documen‐
       tation from the Tech Info Library.

                                                                                                                                                                                                  hpls(1)
