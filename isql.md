isql(1)                                                                                     UnixODBC manual pages                                                                                     isql(1)



NAME
       isql, iusql - unixODBC command-line interactive SQL tool


SYNOPSIS
       isql DSN [USER [PASSWORD]] [options]


DESCRIPTION
       isql is a command line tool which allows the user to execute SQL in batch or interactively. It has some interesting options such as an option to generate output wrapped in an HTML table.

       iusql is the same tool with built-in Unicode support.


ARGUMENTS
       DSN    The  Data  Source  Name,  which should be used to make connection to the database.  The data source is looked for in the /etc/odbc.ini and $HOME/.odbc.ini files in that order, with the latter
              overwriting the former.


       USER   Specifies the database user/role under which the connection should be made.


       PASSWORD
              Password for the specified USER.


OPTIONS
       -b     Run isql in non-interactive batch mode. In this mode, the isql processes its standard input, expecting one SQL command per line.


       -dDELIMITER
              Delimits columns with delimiter.


       -xHEX  Delimits columns with HEX, which is a hexadecimal code of the delimiting character in the format 0xNN - i.e. 0x09 for the TAB character.


       -w     Format the result as HTML table.


       -c     Output the names of the columns on the first row. Has any effect only with the -d or -x options.


       -mNUM  Limit the column display width to NUM characters.


       -lLOCALE
              Sets locale to LOCALE.


       -q     Wrap the character fields in double quotes.


       -3     Use the ODBC 3 calls.


       -n     Use the newline processing.


       -e     Use the SQLExecDirect instead of Prepare.


       -k     Use SQLDriverConnect.


       -v     Turn on the verbose mode, where the errors are fully described. Useful for debugging.


       --version
              Prints the program version and exits.


COMMANDS
       This section briefly describes some isql runtime commands.

       help
              List all tables in the database.

       help table
              List all columns in the table.

       help help
              List all help options.


EXAMPLES
       $ isql WebDB MyID MyPWD -w -b < My.sql

       Connects to the WebDB as user MyID with password MyPWD, then execute the commands in the My.sql file and returns the results wrapped in HTML table.  Each line in My.sql must contain  exactly  1  SQL
       command, except for the last line, which must be blank (unless the -n option is specified).


FILES
       /etc/odbc.ini
              System-wide DSN definitions. See odbc.ini(5) for details.

       $HOME/.odbc.ini
              User-specific DSN definitions. See odbc.ini(5) for details.


SEE ALSO
       odbcinst(1), odbc.ini(5)


AUTHORS
       The authors of unixODBC are Peter Harvey <pharvey@codebydesign.com> and Nick Gorham <nick@easysoft.com>. For the full list of contributors see the AUTHORS file.


COPYRIGHT
       unixODBC is licensed under the GNU Lesser General Public License. For details about the license, see the COPYING file.



version 2.3.1                                                                                  Tue 25 Jun 2013                                                                                        isql(1)
