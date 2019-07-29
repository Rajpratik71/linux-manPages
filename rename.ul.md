RENAME(1)                                                                                    User Commands                                                                                   RENAME(1)

NAME
       rename - rename files

SYNOPSIS
       rename [options] expression replacement file...

DESCRIPTION
       rename will rename the specified files by replacing the first occurrence of expression in their name by replacement.

OPTIONS
       -s, --symlink
              Do not rename a symlink but its target.

       -v, --verbose
              Show which files where renamed, if any.

       -n, --no-act
              Do not make any changes.

       -o, --no-overwrite
              Do not overwrite existing files.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXAMPLES
       Given the files foo1, ..., foo9, foo10, ..., foo278, the commands

              rename foo foo00 foo?
              rename foo foo0 foo??

       will turn them into foo001, ..., foo009, foo010, ..., foo278.  And

              rename .htm .html *.htm

       will fix the extension of your html files.  Provide an empty string for shortening:

              rename '_with_long_name' '' file_with_long_name.*

       will remove the substring in the filenames.

WARNING
       The  renaming  has  no  safeguards  except the --no-act option.  If the user has permission to rewrite file names, the command will perform the action without any questions.  For example, the
       result can be quite drastic when the command is run as root in the /lib directory.  Always make a backup before running the command, unless you truly know what you are doing.

EXIT STATUS
              0      all requested rename operations were successful
              1      all rename operations failed
              2      some rename operations failed
              4      nothing was renamed
              64     unanticipated error occurred

SEE ALSO
       mv(1)

AVAILABILITY
       The rename command is part of the util-linux package and is available from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                                                                                     June 2011                                                                                     RENAME(1)
