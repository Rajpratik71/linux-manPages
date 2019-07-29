isql(1)                                                         UnixODBC Reference                                                         isql(1)

NAME
       isql - utility to submit SQL queries to a data source.
       iusql - Unicode version of isql.

SYNOPSIS
       isql DSN [UID [PWD]] [options]

DESCRIPTION
       isql can be used to submit SQL to a data source and to format/output results.  It can be used in batch or interactive mode.

OPTIONS
       DSN    Name of the data source you want to connect to.

       UID    Your login to connect the DSN.

       PWD    Your password needed to login to the DSN.

       -b     Batch mode.  It will not do any prompting.

       -dx    Delimit columns with x.

       -x0xXX Delimit columns with XX, where XX is in hex.  For example -x0x09 will use a tab.

       -w     Wrap results in an HTML table

       -c     Print column names on first row.  This options only has effect in combination with the -d option.

       -mn    Limit column display width to n

       -v     Verbose output.

       --version
              This prints the version.

EXAMPLES
       cat My.sql | isql WebDB MyID MyPWD -w
              Each line in My.sql must contain exactly 1 SQL command except for the last line which must be blank.

AUTHOR
       This manual page was written by Kurt Roeckx <kurt@roeckx.be> for the Debian package of unixODBC.

UnixODBC                                                             Dec 2004                                                              isql(1)
