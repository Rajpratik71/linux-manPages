iodbctest(1)                                                                                 iODBC Driver Manager                                                                                iodbctest(1)



NAME
       iodbctest, iodbctestw - iODBC Demonstration programs


SYNOPSIS
       iodbctest ["DSN=xxxx[;UID=xxxx][;PWD=xxxx][;OPT=value]"]
       iodbctestw ["DSN=xxxx[;UID=xxxx][;PWD=xxxx][;OPT=value]"]


DESCRIPTION
       The  iodbctest program and iodbtestw programs are simple ODBC sample programs, showing the strength of the ODBC API to connect to any ODBC enabled database, issue SQL commands and retrieve the query
       results.

       The iodbctest program uses the standard ODBC API calls to connect using any DSN, but retrieves all results in ASCII mode.

       The iodbctestw program uses the ODBC Unicode API calls to connect using any DSN, and retrieves all results in Unicode mode.


OPTIONS
       The iodbctest program uses the SQLDriverConnect function to make a connection using any available ODBC compliant driver. This allows the user to override  any  ODBC  connect  attribute  in  the  DSN
       string.

       Connect strings should start with either a DSN=xxx or a DRIVER=xxxx attribute optionally followed by other DSN attributes separated by a semicolon e.g:

            DSN=ora9;UID=scott;PWD=tiger;DATABASE=ora9u

       Any attributes required for a proper connection that are not entered in the DSN connect string, must be present in the odbc.ini file.

       If  the connect string is passed as an argument to the iodbctest program, the string should be quoted as most shells use the semicolon as their command separator. If the connect string is entered on
       the interactive prompt, no quotes should be used.

       After a successful connection has been established, the user is prompted for a SQL command to be send to the database. A SQL command cannot span multiple lines.

       If the SQL command returns one or more result sets, each result set is fetched using character buffers and displayed in a table.

       Additionally, the iodbctest program understands a few special commands:


       qualifiers
               Show a list of qualifiers using the SQLTables catalog call.


       owners
               Show a list of owners using the SQLTables catalog call.


       tables
               Show a list of tables using the SQLTables catalog call.


       types
               Show a list of tables types using the SQLTables catalog call.


       datatypes
               Show a list of data types using the SQLGetTypeInfo catalog call.


       reconnect
               Perform a disconnect/reconnect with the information saved during the first SQLDriverConnect.


       quit (or exit)
               Exit the program and return to the shell.


EXAMPLES
       Start the iodbctest program and get a list of DSNs before making a connection:

           $ iodbctest
           OpenLink ODBC Demonstration program
           This program shows an interactive SQL processor

           Enter ODBC connect string (? shows list): ?

           DSN                              | Driver
           -----------------------------------------------------------------
           ora9                             | OpenLink Generic ODBC Driver
           mysql                            | OpenLink Generic ODBC Driver
           mysqllite                        | OpenLink Lite for MySQL
           myodbc                           | MyODBC Driver
           pgsql                            | OpenLink Generic ODBC Driver
           tds                              | OpenLink Generic ODBC Driver

           Enter ODBC connect string (? shows list): DSN=ora9;PWD=tiger
           Driver: 05.20.0316 OpenLink Generic ODBC Driver (oplodbc.so)

           SQL>

       Connect to an Oracle 9 instance which has been previously setup in the odbc.ini file:

           $ iodbctest "DSN=ora9;UID=scott;PWD=tiger"
           iODBC Demonstration program
           This program shows an interactive SQL processor
           Driver: 05.20.0316 OpenLink Generic ODBC Driver (oplodbc.so)

           SQL>select * from emp

           ID               |NAME
           -----------------+-------------------------------------------
           1                |Record 1
           2                |Record 2
           2                |Record 3

            result set 1 returned 3 rows.

           SQL> quit


COPYRIGHT
       Copyright © 1996-2009 by OpenLink Software


AUTHOR
       iODBC Administrator <iodbc@openlinksw.com>



3.52.7                                                                                          3 August 2005                                                                                    iodbctest(1)
