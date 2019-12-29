COLUMN(1)                             BSD General Commands Manual                            COLUMN(1)

NAME
     column — columnate lists

SYNOPSIS
     column [-entx] [-c columns] [-s sep] [file ...]

DESCRIPTION
     The column utility formats its input into multiple columns.  Rows are filled before columns.  In‐
     put is taken from file operands, or, by default, from the standard input.  Empty lines are ig‐
     nored unless the -e option is used.

     The options are as follows:

     -c      Output is formatted for a display columns wide.

     -s      Specify a set of characters to be used to delimit columns for the -t option.

     -t      Determine the number of columns the input contains and create a table.  Columns are de‐
             limited with whitespace, by default, or with the characters supplied using the -s option.
             Useful for pretty-printing displays.

     -x      Fill columns before filling rows.

     -n      By default, the column command will merge multiple adjacent delimiters into a single de‐
             limiter when using the -t option; this option disables that behavior. This option is a
             Debian GNU/Linux extension.

     -e      Do not ignore empty lines.

ENVIRONMENT
     The COLUMNS, LANG, LC_ALL and LC_CTYPE environment variables affect the execution of column as
     described in environ(7).

EXIT STATUS
     The column utility exits 0 on success, and >0 if an error occurs.

EXAMPLES
           (printf "PERM LINKS OWNER GROUP SIZE MONTH DAY " ; \
           printf "HH:MM/YEAR NAME\n" ; \
           ls -l | sed 1d) | column -t

SEE ALSO
     colrm(1), ls(1), paste(1), sort(1)

HISTORY
     The column command appeared in 4.3BSD-Reno.

BUGS
     Input lines are limited to 512 times LINE_MAX (1M) wide characters in length.

BSD                                          July 29, 2004                                         BSD
