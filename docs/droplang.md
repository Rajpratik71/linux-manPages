DROPLANG(1)                                                                            PostgreSQL 9.2.24 Documentation                                                                            DROPLANG(1)



NAME
       droplang - remove a PostgreSQL procedural language

SYNOPSIS
       droplang [connection-option...] langname [dbname]

       droplang [connection-option...] --list | -l  [dbname]

DESCRIPTION
       droplang is a utility for removing an existing procedural language from a PostgreSQL database.

       droplang is just a wrapper around the DROP EXTENSION (DROP_EXTENSION(7)) SQL command.

           Caution
           droplang is deprecated and may be removed in a future PostgreSQL release. Direct use of the DROP EXTENSION command is recommended instead.

OPTIONS
       droplang accepts the following command line arguments:

       langname
           Specifies the name of the procedural language to be removed. (This name is lower-cased.)

       [-d] dbname, [--dbname=]dbname
           Specifies from which database the language should be removed. The default is to use the database with the same name as the current system user.

       -e, --echo
           Display SQL commands as they are executed.

       -l, --list
           Show a list of already installed languages in the target database.

       -V, --version
           Print the droplang version and exit.

       -?, --help
           Show help about droplang command line arguments, and exit.

       droplang also accepts the following command line arguments for connection parameters:

       -h host, --host=host
           Specifies the host name of the machine on which the server is running. If host begins with a slash, it is used as the directory for the Unix domain socket.

       -p port, --port=port
           Specifies the Internet TCP/IP port or local Unix domain socket file extension on which the server is listening for connections.

       -U username, --username=username
           User name to connect as.

       -w, --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a .pgpass file, the connection attempt will fail. This option
           can be useful in batch jobs and scripts where no user is present to enter a password.

       -W, --password
           Force droplang to prompt for a password before connecting to a database.

           This option is never essential, since droplang will automatically prompt for a password if the server demands password authentication. However, droplang will waste a connection attempt finding
           out that the server wants a password. In some cases it is worth typing -W to avoid the extra connection attempt.

ENVIRONMENT
       PGDATABASE, PGHOST, PGPORT, PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 31.14, “Environment Variables”, in the documentation).

DIAGNOSTICS
       Most error messages are self-explanatory. If not, run droplang with the --echo option and see under the respective SQL command for details. Also, any default connection settings and environment
       variables used by the libpq front-end library will apply.

NOTES
       Use createlang(1) to add a language.

EXAMPLES
       To remove the language pltcl:

           $ droplang pltcl dbname

SEE ALSO
       createlang(1), DROP EXTENSION (DROP_EXTENSION(7)), DROP LANGUAGE (DROP_LANGUAGE(7))



PostgreSQL 9.2.24                                                                                 2017-11-06                                                                                      DROPLANG(1)
