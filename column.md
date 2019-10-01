COLUMN(1)                                                                                       User Commands                                                                                       COLUMN(1)



NAME
       column - columnate lists

SYNOPSIS
       column [options] file...

DESCRIPTION
       The column utility formats its input into multiple columns.  Rows are filled before columns.  Input is taken from file or, by default, from standard input.  Empty lines are ignored.

OPTIONS
       -c, --columns width
              Output is formatted to a width specified as number of characters.

       -t, --table
              Determine the number of columns the input contains and create a table.  Columns are delimited with whitespace, by default, or with the characters supplied using the separator. Table output is
              useful for pretty-printing.

       -s, --separator separators
              Specify possible table delimiters (default is whitespace).

       -o, --output-separator separators
              Specify table output delimiter (default is two whitespaces).

       -x, --fillrows
              Fill columns before filling rows.

       -h, --help
              Print help and exit.

ENVIRONMENT
       The environment variable COLUMNS is used to determine the size of the screen if no other information is available.

EXAMPLES
       sed 's/#.*//' /etc/fstab | column -t

BUGS
       The util-linux version 2.23 changed -s option to be non-greedy, for example:

       $ printf "a:b:c\n1::3\n" | column  -t -s ':'

       old output:
       a  b  c
       1  3

       new output (since util-linux 2.23)
       a  b  c
       1     3

SEE ALSO
       colrm(1), ls(1), paste(1), sort(1)

HISTORY
       The column command appeared in 4.3BSD-Reno.

AVAILABILITY
       The column command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                       October 2010                                                                                       COLUMN(1)
