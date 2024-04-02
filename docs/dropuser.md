DROPUSER(1)                                                PostgreSQL 11.4 Documentation                                               DROPUSER(1)

NAME
       dropuser - remove a PostgreSQL user account

SYNOPSIS
       dropuser [connection-option...] [option...] [username]

DESCRIPTION
       dropuser removes an existing PostgreSQL user. Only superusers and users with the CREATEROLE privilege can remove PostgreSQL users. (To
       remove a superuser, you must yourself be a superuser.)

       dropuser is a wrapper around the SQL command DROP ROLE (DROP_ROLE(7)). There is no effective difference between dropping users via this
       utility and via other methods for accessing the server.

OPTIONS
       dropuser accepts the following command-line arguments:

       username
           Specifies the name of the PostgreSQL user to be removed. You will be prompted for a name if none is specified on the command line and
           the -i/--interactive option is used.

       -e
       --echo
           Echo the commands that dropuser generates and sends to the server.

       -i
       --interactive
           Prompt for confirmation before actually removing the user, and prompt for the user name if none is specified on the command line.

       -V
       --version
           Print the dropuser version and exit.

       --if-exists
           Do not throw an error if the user does not exist. A notice is issued in this case.

       -?
       --help
           Show help about dropuser command line arguments, and exit.

       dropuser also accepts the following command-line arguments for connection parameters:

       -h host
       --host=host
           Specifies the host name of the machine on which the server is running. If the value begins with a slash, it is used as the directory
           for the Unix domain socket.

       -p port
       --port=port
           Specifies the TCP port or local Unix domain socket file extension on which the server is listening for connections.

       -U username
       --username=username
           User name to connect as (not the user name to drop).

       -w
       --no-password
           Never issue a password prompt. If the server requires password authentication and a password is not available by other means such as a
           .pgpass file, the connection attempt will fail. This option can be useful in batch jobs and scripts where no user is present to enter a
           password.

       -W
       --password
           Force dropuser to prompt for a password before connecting to a database.

           This option is never essential, since dropuser will automatically prompt for a password if the server demands password authentication.
           However, dropuser will waste a connection attempt finding out that the server wants a password. In some cases it is worth typing -W to
           avoid the extra connection attempt.

ENVIRONMENT
       PGHOST
       PGPORT
       PGUSER
           Default connection parameters

       This utility, like most other PostgreSQL utilities, also uses the environment variables supported by libpq (see Section 34.14).

DIAGNOSTICS
       In case of difficulty, see DROP ROLE (DROP_ROLE(7)) and psql(1) for discussions of potential problems and error messages. The database
       server must be running at the targeted host. Also, any default connection settings and environment variables used by the libpq front-end
       library will apply.

EXAMPLES
       To remove user joe from the default database server:

           $ dropuser joe

       To remove user joe using the server on host eden, port 5000, with verification and a peek at the underlying command:

           $ dropuser -p 5000 -h eden -i -e joe
           Role "joe" will be permanently removed.
           Are you sure? (y/n) y
           DROP ROLE joe;

SEE ALSO
       createuser(1), DROP ROLE (DROP_ROLE(7))

PostgreSQL 11.4                                                        2019                                                            DROPUSER(1)
