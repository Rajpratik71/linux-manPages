CREATELANG(1)                                                                          PostgreSQL 9.2.24 Documentation                                                                          CREATELANG(1)



NAME
       createlang - install a PostgreSQL procedural language

SYNOPSIS
       createlang [connection-option...] langname [dbname]

       createlang [connection-option...] --list | -l  [dbname]

DESCRIPTION
       createlang is a utility for adding a procedural language to a PostgreSQL database.

       createlang is just a wrapper around the CREATE EXTENSION (CREATE_EXTENSION(7)) SQL command.

           Caution
           createlang is deprecated and may be removed in a future PostgreSQL release. Direct use of the CREATE EXTENSION command is recommended instead.

OPTIONS
       createlang accepts the following command-line arguments:

       langname
           Specifies the name of the procedural language to be installed. (This name is lower-cased.)

       [-d] dbname, [--dbname=]dbname
           Specifies the database to which the language should be added. The default is to use the database with the same name as the current system user.

       -e, --echo
           Display SQL commands as they are executed.

       -l, --list
           Show a list of already installed languages in the target database.

       -V, --version
           Print the createlang version and exit.

       -?, --help
           Show help about createlang command line arguments, and exit.

       createlang also accepts the following command-line arguments for connection parameters:

       -h host, --host=host
           Specifies the host name of the machine on which the server is running. If the value begins with a slash, it is used as the directory for the Unix domain socket.

       -p port, --port=port
           Specifies the TCP port or local Unix domain socket file extension on which the server is listening for connections.

       -U username, --username=username
           User name to connect as.

       -w, --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a .pgpass file, the connection attempt will fail. This option
           can be useful in batch jobs and scripts where no user is present to enter a password.

       -W, --password
           Force createlang to prompt for a password before connecting to a database.

           This option is never essential, since createlang will automatically prompt for a password if the server demands password authentication. However, createlang will waste a connection attempt
           finding out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

ENVIRONMENT
       PGDATABASE, PGHOST, PGPORT, PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation).

DIAGNOSTICS
       Most error messages are self-explanatory. If not, run createlang with the --echo option and see the respective SQL command for details. Also, any default connection settings and environment
       variables used by the libpq front-end library will apply.

NOTES
       Use droplang(1) to remove a language.

EXAMPLES
       To install the language pltcl into the database template1:

           $ createlang pltcl template1

       Note that installing the language into template1 will cause it to be automatically installed into subsequently-created databases as well.

SEE ALSO
       droplang(1), CREATE EXTENSION (CREATE_EXTENSION(7)), CREATE LANGUAGE (CREATE_LANGUAGE(7))



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                    CREATELANG(1)
