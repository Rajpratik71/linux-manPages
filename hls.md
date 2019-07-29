HLS(1)                                                        General Commands Manual                                                       HLS(1)

NAME
       hls - list files in an HFS directory

SYNOPSIS
       hls [options] [hfs-path ...]

DESCRIPTION
       hls  lists files and directories contained in an HFS volume. If one or more arguments are given, each specified file or directory is shown;
       otherwise, the contents of the current working directory are shown.

OPTIONS
       -1     Output is formatted such that each entry appears on a single line. This is the default when stdout is not a terminal.

       -a     All files and directories are shown, including "invisible" files, as would be perceived by the Macintosh Finder. Normally  invisible
              files are omitted from directory listings.

       -b     Special  characters  are  displayed  in an escaped backslash notation. Normally special or non-printable characters in filenames are
              replaced by a question mark (?).

       -c     Sort and display entries by their creation date, rather than their modification date.

       -d     List directory entries themselves rather than their contents. Normally the contents are shown for named directories on the  command-
              line.

       -f     Do  not  sort directory contents; list them in the order they appear in the directory. This option effectively enables -a and -U and
              disables -l, -s, and -t.

       -i     Show the catalog IDs for each entry. Every file and directory on an HFS volume has a unique catalog ID.

       -l     Display entries in long format. This format shows the entry type ("d" for directory or "f" for file),  flags  ("i"  for  invisible),
              file  type  and  creator  (four-character  strings for files only), size (number of directory sub-contents or file resource and data
              bytes, respectively), date of last modification (or creation, with -c flag), and pathname. Macintosh "locked" files are indicated by
              "F" in place of "f".

       -m     Display entries in a continuous format separated by commas.

       -q     Replace special and non-printable characters in displayed filenames with question marks (?). This is the default when stdout is con‐
              nected to a terminal.

       -r     Sort entries in reverse order before displaying.

       -s     Show the file size for each entry in 1K block units. The size includes blocks used for both data and resource forks.

       -t     Sort and display entries by time. Normally files will be sorted by name. This option uses the last modification date to sort  unless
              -c is also specified.

       -x     Display entries in column format like -C, but sorted horizontally into rows rather than columns.

       -w width
              Format  output  lines  suitable  for display in the given width.  Normally the width will be determined from your terminal, from the
              environment variable COLUMNS, or from a default value of 80.

       -C     Display entries in column format with entries sorted vertically. This is the default output format when stdout  is  connected  to  a
              terminal.

       -F     Cause  certain  output  filenames to be followed by a single-character flag indicating the nature of the entry; directories are fol‐
              lowed by a colon (:) and executable Macintosh applications are followed by an asterisk (*).

       -N     Cause all filenames to be output verbatim without any escaping or question-mark substitution.

       -Q     Cause all filenames to be enclosed within double-quotes (") and special/non-printable characters to be properly escaped.

       -R     For each directory that is encountered in a listing, recursively descend into and display its contents.

       -S     Sort and display entries by size. For files, the combined resource and data lengths are used to compute a file's size.

       -U     Do not sort directory contents; list them in the order they appear in the directory. On HFS volumes, this is usually an alphabetical
              case-insensitive  ordering, although there are some idiosyncrasies to the Macintosh implementation of ordering. This option does not
              affect -a, -l, or -s.

SEE ALSO
       hfsutils(1), hcd(1), hpwd(1), hdir(1), hcopy(1)

FILES
       $HOME/.hcwd

AUTHOR
       Robert Leslie <rob@mars.org>

HFSUTILS                                                            14-Jan-1997                                                             HLS(1)
