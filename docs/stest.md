STEST(1)                                                      General Commands Manual                                                     STEST(1)

NAME
       stest - filter a list of files by properties

SYNOPSIS
       stest [-abcdefghlpqrsuwx] [-n file] [-o file] [file...]

DESCRIPTION
       stest  takes a list of files and filters by the files' properties, analogous to test(1).  Files which pass all tests are printed to stdout.
       If no files are given, stest reads files from stdin.

OPTIONS
       -a     Test hidden files.

       -b     Test that files are block specials.

       -c     Test that files are character specials.

       -d     Test that files are directories.

       -e     Test that files exist.

       -f     Test that files are regular files.

       -g     Test that files have their set-group-ID flag set.

       -h     Test that files are symbolic links.

       -l     Test the contents of a directory given as an argument.

       -n file
              Test that files are newer than file.

       -o file
              Test that files are older than file.

       -p     Test that files are named pipes.

       -q     No files are printed, only the exit status is returned.

       -r     Test that files are readable.

       -s     Test that files are not empty.

       -u     Test that files have their set-user-ID flag set.

       -v     Invert the sense of tests, only failing files pass.

       -w     Test that files are writable.

       -x     Test that files are executable.

EXIT STATUS
       0      At least one file passed all tests.

       1      No files passed all tests.

       2      An error occurred.

SEE ALSO
       dmenu(1), test(1)

                                                                     dmenu-4.6                                                            STEST(1)
