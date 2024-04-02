MYSQLSLAP(1)                                                   MySQL Database System                                                  MYSQLSLAP(1)

NAME
       mysqlslap - load emulation client

SYNOPSIS
       mysqlslap [options]

DESCRIPTION
       mysqlslap is a diagnostic program designed to emulate client load for a MySQL server and to report the timing of each stage. It works as if
       multiple clients are accessing the server.

       Invoke mysqlslap like this:

           shell> mysqlslap [options]

       Some options such as --create or --query enable you to specify a string containing an SQL statement or a file containing statements. If you
       specify a file, by default it must contain one statement per line. (That is, the implicit statement delimiter is the newline character.)
       Use the --delimiter option to specify a different delimiter, which enables you to specify statements that span multiple lines or place
       multiple statements on a single line. You cannot include comments in a file; mysqlslap does not understand them.

       mysqlslap runs in three stages:

        1. Create schema, table, and optionally any stored programs or data to use for the test. This stage uses a single client connection.

        2. Run the load test. This stage can use many client connections.

        3. Clean up (disconnect, drop table if specified). This stage uses a single client connection.

       Examples:

       Supply your own create and query SQL statements, with 50 clients querying and 200 selects for each (enter the command on a single line):

           mysqlslap --delimiter=";"
             --create="CREATE TABLE a (b int);INSERT INTO a VALUES (23)"
             --query="SELECT * FROM a" --concurrency=50 --iterations=200

       Let mysqlslap build the query SQL statement with a table of two INT columns and three VARCHAR columns. Use five clients querying 20 times
       each. Do not create the table or insert the data (that is, use the previous test's schema and data):

           mysqlslap --concurrency=5 --iterations=20
             --number-int-cols=2 --number-char-cols=3
             --auto-generate-sql

       Tell the program to load the create, insert, and query SQL statements from the specified files, where the create.sql file has multiple
       table creation statements delimited by ';' and multiple insert statements delimited by ';'. The --query file will have multiple queries
       delimited by ';'. Run all the load statements, then run all the queries in the query file with five clients (five times each):

           mysqlslap --concurrency=5
             --iterations=5 --query=query.sql --create=create.sql
             --delimiter=";"

       mysqlslap supports the following options, which can be specified on the command line or in the [mysqlslap] and [client] groups of an option
       file. For information about option files used by MySQL programs, see Section 4.2.2.2, “Using Option Files”.

       ·   --help, -?

           Display a help message and exit.

       ·   --auto-generate-sql, -a

           Generate SQL statements automatically when they are not supplied in files or using command options.

       ·   --auto-generate-sql-add-autoincrement

           Add an AUTO_INCREMENT column to automatically generated tables.

       ·   --auto-generate-sql-execute-number=N

           Specify how many queries to generate automatically.

       ·   --auto-generate-sql-guid-primary

           Add a GUID-based primary key to automatically generated tables.

       ·   --auto-generate-sql-load-type=type

           Specify the test load type. The permissible values are read (scan tables), write (insert into tables), key (read primary keys), update
           (update primary keys), or mixed (half inserts, half scanning selects). The default is mixed.

       ·   --auto-generate-sql-secondary-indexes=N

           Specify how many secondary indexes to add to automatically generated tables. By default, none are added.

       ·   --auto-generate-sql-unique-query-number=N

           How many different queries to generate for automatic tests. For example, if you run a key test that performs 1000 selects, you can use
           this option with a value of 1000 to run 1000 unique queries, or with a value of 50 to perform 50 different selects. The default is 10.

       ·   --auto-generate-sql-unique-write-number=N

           How many different queries to generate for --auto-generate-sql-write-number. The default is 10.

       ·   --auto-generate-sql-write-number=N

           How many row inserts to perform. The default is 100.

       ·   --commit=N

           How many statements to execute before committing. The default is 0 (no commits are done).

       ·   --compress, -C

           Compress all information sent between the client and the server if possible. See Section 4.2.5, “Connection Compression Control”.

       ·   --concurrency=N, -c N

           The number of parallel clients to simulate.

       ·   --create=value

           The file or string containing the statement to use for creating the table.

       ·   --create-schema=value

           The schema in which to run the tests.

               Note
               If the --auto-generate-sql option is also given, mysqlslap drops the schema at the end of the test run. To avoid this, use the
               --no-drop option as well.

       ·   --csv[=file_name]

           Generate output in comma-separated values format. The output goes to the named file, or to the standard output if no file is given.

       ·   --debug[=debug_options], -# [debug_options]

           Write a debugging log. A typical debug_options string is d:t:o,file_name. The default is d:t:o,/tmp/mysqlslap.trace.

       ·   --debug-check

           Print some debugging information when the program exits.

       ·   --debug-info, -T

           Print debugging information and memory and CPU usage statistics when the program exits.

       ·   --default-auth=plugin

           A hint about which client-side authentication plugin to use. See Section 6.2.13, “Pluggable Authentication”.

       ·   --defaults-extra-file=file_name

           Read this option file after the global option file but (on Unix) before the user option file. If the file does not exist or is
           otherwise inaccessible, an error occurs.  file_name is interpreted relative to the current directory if given as a relative path name
           rather than a full path name.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --defaults-file=file_name

           Use only the given option file. If the file does not exist or is otherwise inaccessible, an error occurs.  file_name is interpreted
           relative to the current directory if given as a relative path name rather than a full path name.

           Exception: Even with --defaults-file, client programs read .mylogin.cnf.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --defaults-group-suffix=str

           Read not only the usual option groups, but also groups with the usual names and a suffix of str. For example, mysqlslap normally reads
           the [client] and [mysqlslap] groups. If the --defaults-group-suffix=_other option is given, mysqlslap also reads the [client_other] and
           [mysqlslap_other] groups.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --delimiter=str, -F str

           The delimiter to use in SQL statements supplied in files or using command options.

       ·   --detach=N

           Detach (close and reopen) each connection after each N statements. The default is 0 (connections are not detached).

       ·   --enable-cleartext-plugin

           Enable the mysql_clear_password cleartext authentication plugin. (See Section 6.4.1.6, “Client-Side Cleartext Pluggable
           Authentication”.)

       ·   --engine=engine_name, -e engine_name

           The storage engine to use for creating tables.

       ·   --get-server-public-key

           Request from the server the RSA public key that it uses for key pair-based password exchange. This option applies to clients that
           connect to the server using an account that authenticates with the caching_sha2_password authentication plugin. For connections by such
           accounts, the server does not send the public key to the client unless requested. The option is ignored for accounts that do not
           authenticate with that plugin. It is also ignored if RSA-based password exchange is not needed, as is the case when the client connects
           to the server using a secure connection.

           If --server-public-key-path=file_name is given and specifies a valid public key file, it takes precedence over --get-server-public-key.

           For information about the caching_sha2_password plugin, see Section 6.4.1.5, “Caching SHA-2 Pluggable Authentication”.

           The --get-server-public-key option was added in MySQL 5.7.23.

       ·   --host=host_name, -h host_name

           Connect to the MySQL server on the given host.

       ·   --iterations=N, -i N

           The number of times to run the tests.

       ·   --login-path=name

           Read options from the named login path in the .mylogin.cnf login path file. A “login path” is an option group containing options that
           specify which MySQL server to connect to and which account to authenticate as. To create or modify a login path file, use the
           mysql_config_editor utility. See mysql_config_editor(1).

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --no-drop

           Prevent mysqlslap from dropping any schema it creates during the test run.

       ·   --no-defaults

           Do not read any option files. If program startup fails due to reading unknown options from an option file, --no-defaults can be used to
           prevent them from being read.

           The exception is that the .mylogin.cnf file, if it exists, is read in all cases. This permits passwords to be specified in a safer way
           than on the command line even when --no-defaults is used. (.mylogin.cnf is created by the mysql_config_editor utility. See
           mysql_config_editor(1).)

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --number-char-cols=N, -x N

           The number of VARCHAR columns to use if --auto-generate-sql is specified.

       ·   --number-int-cols=N, -y N

           The number of INT columns to use if --auto-generate-sql is specified.

       ·   --number-of-queries=N

           Limit each client to approximately this many queries. Query counting takes into account the statement delimiter. For example, if you
           invoke mysqlslap as follows, the ; delimiter is recognized so that each instance of the query string counts as two queries. As a
           result, 5 rows (not 10) are inserted.

               shell> mysqlslap --delimiter=";" --number-of-queries=10
                        --query="use test;insert into t values(null)"

       ·   --only-print

           Do not connect to databases.  mysqlslap only prints what it would have done.

       ·   --password[=password], -p[password]

           The password of the MySQL account used for connecting to the server. The password value is optional. If not given, mysqlslap prompts
           for one. If given, there must be no space between --password= or -p and the password following it. If no password option is specified,
           the default is to send no password.

           Specifying a password on the command line should be considered insecure. To avoid giving the password on the command line, use an
           option file. See Section 6.1.2.1, “End-User Guidelines for Password Security”.

           To explicitly specify that there is no password and that mysqlslap should not prompt for one, use the --skip-password option.

       ·   --pipe, -W

           On Windows, connect to the server using a named pipe. This option applies only if the server was started with the named_pipe system
           variable enabled to support named-pipe connections. In addition, the user making the connection must be a member of the Windows group
           specified by the named_pipe_full_access_group system variable.

       ·   --plugin-dir=dir_name

           The directory in which to look for plugins. Specify this option if the --default-auth option is used to specify an authentication
           plugin but mysqlslap does not find it. See Section 6.2.13, “Pluggable Authentication”.

       ·   --port=port_num, -P port_num

           For TCP/IP connections, the port number to use.

       ·   --post-query=value

           The file or string containing the statement to execute after the tests have completed. This execution is not counted for timing
           purposes.

       ·   --post-system=str

           The string to execute using system() after the tests have completed. This execution is not counted for timing purposes.

       ·   --pre-query=value

           The file or string containing the statement to execute before running the tests. This execution is not counted for timing purposes.

       ·   --pre-system=str

           The string to execute using system() before running the tests. This execution is not counted for timing purposes.

       ·   --print-defaults

           Print the program name and all options that it gets from option files.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --protocol={TCP|SOCKET|PIPE|MEMORY}

           The connection protocol to use for connecting to the server. It is useful when the other connection parameters normally result in use
           of a protocol other than the one you want. For details on the permissible values, see Section 4.2.4, “Connecting to the MySQL Server
           Using Command Options”.

       ·   --query=value, -q value

           The file or string containing the SELECT statement to use for retrieving data.

       ·   --secure-auth

           Do not send passwords to the server in old (pre-4.1) format. This prevents connections except for servers that use the newer password
           format.

           As of MySQL 5.7.5, this option is deprecated and will be removed in a future MySQL release. It is always enabled and attempting to
           disable it (--skip-secure-auth, --secure-auth=0) produces an error. Before MySQL 5.7.5, this option is enabled by default but can be
           disabled.

               Note
               Passwords that use the pre-4.1 hashing method are less secure than passwords that use the native password hashing method and should
               be avoided. Pre-4.1 passwords are deprecated and support for them was removed in MySQL 5.7.5. For account upgrade instructions, see
               Section 6.4.1.3, “Migrating Away from Pre-4.1 Password Hashing and the mysql_old_password Plugin”.

       ·   --server-public-key-path=file_name

           The path name to a file containing a client-side copy of the public key required by the server for RSA key pair-based password
           exchange. The file must be in PEM format. This option applies to clients that authenticate with the sha256_password or
           caching_sha2_password authentication plugin. This option is ignored for accounts that do not authenticate with one of those plugins. It
           is also ignored if RSA-based password exchange is not used, as is the case when the client connects to the server using a secure
           connection.

           If --server-public-key-path=file_name is given and specifies a valid public key file, it takes precedence over --get-server-public-key.

           For sha256_password, this option applies only if MySQL was built using OpenSSL.

           For information about the sha256_password and caching_sha2_password plugins, see Section 6.4.1.4, “SHA-256 Pluggable Authentication”,
           and Section 6.4.1.5, “Caching SHA-2 Pluggable Authentication”.

           The --server-public-key-path option was added in MySQL 5.7.23.

       ·   --shared-memory-base-name=name

           On Windows, the shared-memory name to use, for connections made using shared memory to a local server. The default value is MYSQL. The
           shared-memory name is case-sensitive.

           This option applies only if the server was started with the shared_memory system variable enabled to support shared-memory connections.

       ·   --silent, -s

           Silent mode. No output.

       ·   --socket=path, -S path

           For connections to localhost, the Unix socket file to use, or, on Windows, the name of the named pipe to use.

           On Windows, this option applies only if the server was started with the named_pipe system variable enabled to support named-pipe
           connections. In addition, the user making the connection must be a member of the Windows group specified by the
           named_pipe_full_access_group system variable.

       ·   --sql-mode=mode

           Set the SQL mode for the client session.

       ·   --ssl*

           Options that begin with --ssl specify whether to connect to the server using SSL and indicate where to find SSL keys and certificates.
           See the section called “Command Options for Encrypted Connections”.

       ·   --tls-version=protocol_list

           The permissible TLS protocols for encrypted connections. The value is a list of one or more comma-separated protocol names. The
           protocols that can be named for this option depend on the SSL library used to compile MySQL. For details, see Section 6.3.5, “Encrypted
           Connection Protocols and Ciphers”.

           This option was added in MySQL 5.7.10.

       ·   --user=user_name, -u user_name

           The user name of the MySQL account to use for connecting to the server.

       ·   --verbose, -v

           Verbose mode. Print more information about what the program does. This option can be used multiple times to increase the amount of
           information.

       ·   --version, -V

           Display version information and exit.

COPYRIGHT
       Copyright © 1997, 2019, Oracle and/or its affiliates. All rights reserved.

       This documentation is free software; you can redistribute it and/or modify it only under the terms of the GNU General Public License as
       published by the Free Software Foundation; version 2 of the License.

       This documentation is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with the program; if not, write to the Free Software Foundation,
       Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA or see http://www.gnu.org/licenses/.

SEE ALSO
       For more information, please refer to the MySQL Reference Manual, which may already be installed locally and which is also available online
       at http://dev.mysql.com/doc/.

AUTHOR
       Oracle Corporation (http://dev.mysql.com/).

MySQL 5.7                                                           06/08/2019                                                        MYSQLSLAP(1)
