odbcinst(1)                                                     UnixODBC Reference                                                     odbcinst(1)

NAME
       odbcinst - command line tool for batch ODBC configuration

SYNOPSIS
       odbcinst action object options

       action is one of

              -i     install a driver or data source

              -u     uninstall a driver or data source

              -q     query a list of drivers or data sources present on the system

              -j     print config info

              -c     call SQLCreateDataSource

              -m     call SQLManageDataSources

              --version
                     shows the version number of the program

       object is one of

              -d     an ODBC driver in /etc/odbcinst.ini

              -s     an ODBC Data Source Name (DSN) in an odbc.ini file.

       options are zero or more of

              -f template file
                     Used with -i, this option specifies a template file containing the driver or DSN to be installed.

              -r     Read the template from standard input.

              -n Driver/Data Source Name
                     Used with -u to specify a driver or DSN to remove.

              -v     Contrary to standard practice, this turns off verbose output; there is no output, even for errors.

              -l     The specified Data Source object is a System DSN, in /etc/odbc.ini.

              -h     The specified Data Source object is a User DSN, in the current user's $HOME/.odbc.ini.  This is the default with -s.

DESCRIPTION
       odbcinst  updates  the  configuration  files  that  control  ODBC  access  to  database  servers on the current host.  It also maintains in
       /etc/odbcinst.ini a count of the number of references to a particular driver, which can be used to determine whether it should  be  removed
       from the file (only when the reference count drops to 0).

   Installing
       Drivers and DSNs are installed using the -i option.

       If the object to be installed is a driver (-d), the specified driver is added to /etc/odbcinst.ini or its reference count is incremented if
       it is already there.

       If the object is a data source (-s), the data source is added either to /etc/odbc.ini (if -l is used) or to $HOME/.odbc.ini  (the  default,
       which can also be specified with -h).

   Uninstalling
       Uninstalling  a driver is done with the command odbcinst -u -d -n  driver name.  Uninstalling a DSN is done with the command odbcinst -u -s
       -n  data source name.  Uninstalling causes the reference count on the object to be decremented.  If nothing else has requested this  driver
       or DSN (i.e., the reference count drops to zero), it is removed from the config file.

       The options -l and -h are used with -s to specify which odbc.ini file to configure.

   Queries
       The  command  odbcinst  -q -d returns a list of all drivers present in /etc/odbcinst.ini.  The command odbcinst -q -s returns a list of all
       system and user DSNs available.

EXIT STATUS
       0      Success

       non-zero
              Failure

TEMPLATE FILES
       A typical driver template looks like this:
               [MySQL]
               Description     = MySQL driver
               Driver          = /usr/lib/odbc/libmyodbc.so
               Setup           = /usr/lib/odbc/libodbcmyS.so

       A DSN template looks like this:
               [Sample DSN]
               Description         = Test MySQL connection
               Driver              = MySQL
               Trace               = Yes
               TraceFile           = /tmp/odbc.log
               Database            = junk
               Server              = localhost
               Port                = 3306
               Socket              =

       The Description and Driver fields should be present in all DSN configurations.   Other  options  are  driver-specific;  consult  your  ODBC
       driver's  documentation for a list of allowed options, or see ODBCConfig(1) for a graphical tool that can be used to interactively set up a
       DSN or driver the first time.

FILES
       /etc/odbcinst.ini, /etc/odbc.ini, $HOME/.odbc.ini

AUTHOR
       This manual page was written by Oliver Elphick <olly@lfix.co.uk> and Steve Langasek <vorlon@debian.org> for the Debian package of unixODBC.

SEE ALSO
       ODBCConfig(1), gODBCConfig(1)

UnixODBC                                                           2nd Mar 2002                                                        odbcinst(1)
