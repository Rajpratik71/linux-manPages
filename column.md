COLUMN(1)                                                                                       User Commands                                                                                       COLUMN(1)



NAME
       column - columnate lists

SYNOPSIS
       column [options] [file...]

DESCRIPTION
       The column utility formats its input into multiple columns.  By default, rows are filled before columns.  Input is taken from file, or otherwise from standard input.  Empty lines are ignored.

OPTIONS
       -c, --columns width
              Output is formatted to a width specified as number of characters.

       -o, --output-separator string
              Specify the columns delimiter for table output (default is two spaces).

       -s, --separator separators
              Specify the possible input item delimiters (default is whitespace).

       -t, --table
              Determine the number of columns the input contains and create a table.  Columns are delimited with whitespace, by default, or with the characters supplied using the --output-separator option.
              Table output is useful for pretty-printing.

       -x, --fillrows
              Fill columns before filling rows.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

ENVIRONMENT
       The environment variable COLUMNS is used to determine the size of the screen if no other information is available.

EXAMPLES
       sed 's/#.*//' /etc/fstab | column -t

BUGS
       Version 2.23 changed the -s option to be non-greedy, for example:

       printf "a:b:c\n1::3\n" | column  -t -s ':'

       Old output:
       a  b  c
       1  3

       New output (since util-linux 2.23):
       a  b  c
       1     3

SEE ALSO
       colrm(1), ls(1), paste(1), sort(1)

HISTORY
       The column command appeared in 4.3BSD-Reno.

AVAILABILITY
       The column command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        July 2014                                                                                         COLUMN(1)
