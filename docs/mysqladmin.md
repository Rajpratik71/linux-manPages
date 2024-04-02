MYSQLADMIN(1)                                                  MySQL Database System                                                 MYSQLADMIN(1)

NAME
       mysqladmin - client for administering a MySQL server

SYNOPSIS
       mysqladmin [options] command [command-options] [command [command-options]] ...

DESCRIPTION
       mysqladmin is a client for performing administrative operations. You can use it to check the server's configuration and current status, to
       create and drop databases, and more.

       Invoke mysqladmin like this:

           shell> mysqladmin [options] command [command-arg] [command [command-arg]] ...

       mysqladmin supports the following commands. Some of the commands take an argument following the command name.

       ·   create db_name

           Create a new database named db_name.

       ·   debug

           Tell the server to write debug information to the error log. The connected user must have the SUPER privilege. Format and content of
           this information is subject to change.

           This includes information about the Event Scheduler. See Section 23.4.5, “Event Scheduler Status”.

       ·   drop db_name

           Delete the database named db_name and all its tables.

       ·   extended-status

           Display the server status variables and their values.

       ·   flush-hosts

           Flush all information in the host cache. See Section 8.12.5.2, “DNS Lookup Optimization and the Host Cache”.

       ·   flush-logs [log_type ...]

           Flush all logs.

           The mysqladmin flush-logs command permits optional log types to be given, to specify which logs to flush. Following the flush-logs
           command, you can provide a space-separated list of one or more of the following log types: binary, engine, error, general, relay, slow.
           These correspond to the log types that can be specified for the FLUSH LOGS SQL statement.

       ·   flush-privileges

           Reload the grant tables (same as reload).

       ·   flush-status

           Clear status variables.

       ·   flush-tables

           Flush all tables.

       ·   flush-threads

           Flush the thread cache.

       ·   kill id,id,...

           Kill server threads. If multiple thread ID values are given, there must be no spaces in the list.

           To kill threads belonging to other users, the connected user must have the SUPER privilege.

       ·   old-password new_password

           This is like the password command but stores the password using the old (pre-4.1) password-hashing format. (See Section 6.1.2.4,
           “Password Hashing in MySQL”.)

           This command was removed in MySQL 5.7.5.

       ·   password new_password

           Set a new password. This changes the password to new_password for the account that you use with mysqladmin for connecting to the
           server. Thus, the next time you invoke mysqladmin (or any other client program) using the same account, you will need to specify the
           new password.

               Warning
               Setting a password using mysqladmin should be considered insecure. On some systems, your password becomes visible to system status
               programs such as ps that may be invoked by other users to display command lines. MySQL clients typically overwrite the command-line
               password argument with zeros during their initialization sequence. However, there is still a brief interval during which the value
               is visible. Also, on some systems this overwriting strategy is ineffective and the password remains visible to ps. (SystemV Unix
               systems and perhaps others are subject to this problem.)
           If the new_password value contains spaces or other characters that are special to your command interpreter, you need to enclose it
           within quotation marks. On Windows, be sure to use double quotation marks rather than single quotation marks; single quotation marks
           are not stripped from the password, but rather are interpreted as part of the password. For example:

               shell> mysqladmin password "my new password"

           The new password can be omitted following the password command. In this case, mysqladmin prompts for the password value, which enables
           you to avoid specifying the password on the command line. Omitting the password value should be done only if password is the final
           command on the mysqladmin command line. Otherwise, the next argument is taken as the password.

               Caution
               Do not use this command used if the server was started with the --skip-grant-tables option. No password change will be applied.
               This is true even if you precede the password command with flush-privileges on the same command line to re-enable the grant tables
               because the flush operation occurs after you connect. However, you can use mysqladmin flush-privileges to re-enable the grant table
               and then use a separate mysqladmin password command to change the password.

       ·   ping

           Check whether the server is available. The return status from mysqladmin is 0 if the server is running, 1 if it is not. This is 0 even
           in case of an error such as Access denied, because this means that the server is running but refused the connection, which is different
           from the server not running.

       ·   processlist

           Show a list of active server threads. This is like the output of the SHOW PROCESSLIST statement. If the --verbose option is given, the
           output is like that of SHOW FULL PROCESSLIST. (See Section 13.7.5.29, “SHOW PROCESSLIST Syntax”.)

       ·   reload

           Reload the grant tables.

       ·   refresh

           Flush all tables and close and open log files.

       ·   shutdown

           Stop the server.

       ·   start-slave

           Start replication on a slave server.

       ·   status

           Display a short server status message.

       ·   stop-slave

           Stop replication on a slave server.

       ·   variables

           Display the server system variables and their values.

       ·   version

           Display version information from the server.

       All commands can be shortened to any unique prefix. For example:

           shell> mysqladmin proc stat
           +----+-------+-----------+----+---------+------+-------+------------------+
           | Id | User  | Host      | db | Command | Time | State | Info             |
           +----+-------+-----------+----+---------+------+-------+------------------+
           | 51 | monty | localhost |    | Query   | 0    |       | show processlist |
           +----+-------+-----------+----+---------+------+-------+------------------+
           Uptime: 1473624  Threads: 1  Questions: 39487
           Slow queries: 0  Opens: 541  Flush tables: 1
           Open tables: 19  Queries per second avg: 0.0268

       The mysqladmin status command result displays the following values:

       ·   Uptime

           The number of seconds the MySQL server has been running.

       ·   Threads

           The number of active threads (clients).

       ·   Questions

           The number of questions (queries) from clients since the server was started.

       ·   Slow queries

           The number of queries that have taken more than long_query_time seconds. See Section 5.4.5, “The Slow Query Log”.

       ·   Opens

           The number of tables the server has opened.

       ·   Flush tables

           The number of flush-*, refresh, and reload commands the server has executed.

       ·   Open tables

           The number of tables that currently are open.

       If you execute mysqladmin shutdown when connecting to a local server using a Unix socket file, mysqladmin waits until the server's process
       ID file has been removed, to ensure that the server has stopped properly.

       mysqladmin supports the following options, which can be specified on the command line or in the [mysqladmin] and [client] groups of an
       option file. For information about option files used by MySQL programs, see Section 4.2.2.2, “Using Option Files”.

       ·   --help, -?

           Display a help message and exit.

       ·   --bind-address=ip_address

           On a computer having multiple network interfaces, use this option to select which interface to use for connecting to the MySQL server.

       ·   --character-sets-dir=dir_name

           The directory where character sets are installed. See Section 10.14, “Character Set Configuration”.

       ·   --compress, -C

           Compress all information sent between the client and the server if possible. See Section 4.2.5, “Connection Compression Control”.

       ·   --count=N, -c N

           The number of iterations to make for repeated command execution if the --sleep option is given.

       ·   --debug[=debug_options], -# [debug_options]

           Write a debugging log. A typical debug_options string is d:t:o,file_name. The default is d:t:o,/tmp/mysqladmin.trace.

       ·   --debug-check

           Print some debugging information when the program exits.

       ·   --debug-info

           Print debugging information and memory and CPU usage statistics when the program exits.

       ·   --default-auth=plugin

           A hint about which client-side authentication plugin to use. See Section 6.2.13, “Pluggable Authentication”.

       ·   --default-character-set=charset_name

           Use charset_name as the default character set. See Section 10.14, “Character Set Configuration”.

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

           Read not only the usual option groups, but also groups with the usual names and a suffix of str. For example, mysqladmin normally reads
           the [client] and [mysqladmin] groups. If the --defaults-group-suffix=_other option is given, mysqladmin also reads the [client_other]
           and [mysqladmin_other] groups.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --enable-cleartext-plugin

           Enable the mysql_clear_password cleartext authentication plugin. (See Section 6.4.1.6, “Client-Side Cleartext Pluggable
           Authentication”.)

       ·   --force, -f

           Do not ask for confirmation for the drop db_name command. With multiple commands, continue even if an error occurs.

       ·   --get-server-public-key

           Request from the server the public key required for RSA key pair-based password exchange. This option applies to clients that
           authenticate with the caching_sha2_password authentication plugin. For that plugin, the server does not send the public key unless
           requested. This option is ignored for accounts that do not authenticate with that plugin. It is also ignored if RSA-based password
           exchange is not used, as is the case when the client connects to the server using a secure connection.

           If --server-public-key-path=file_name is given and specifies a valid public key file, it takes precedence over --get-server-public-key.

           For information about the caching_sha2_password plugin, see Section 6.4.1.5, “Caching SHA-2 Pluggable Authentication”.

           The --get-server-public-key option was added in MySQL 5.7.23.

       ·   --host=host_name, -h host_name

           Connect to the MySQL server on the given host.

       ·   --login-path=name

           Read options from the named login path in the .mylogin.cnf login path file. A “login path” is an option group containing options that
           specify which MySQL server to connect to and which account to authenticate as. To create or modify a login path file, use the
           mysql_config_editor utility. See mysql_config_editor(1).

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --no-beep, -b

           Suppress the warning beep that is emitted by default for errors such as a failure to connect to the server.

       ·   --no-defaults

           Do not read any option files. If program startup fails due to reading unknown options from an option file, --no-defaults can be used to
           prevent them from being read.

           The exception is that the .mylogin.cnf file, if it exists, is read in all cases. This permits passwords to be specified in a safer way
           than on the command line even when --no-defaults is used. (.mylogin.cnf is created by the mysql_config_editor utility. See
           mysql_config_editor(1).)

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --password[=password], -p[password]

           The password of the MySQL account used for connecting to the server. The password value is optional. If not given, mysqladmin prompts
           for one. If given, there must be no space between --password= or -p and the password following it. If no password option is specified,
           the default is to send no password.

           Specifying a password on the command line should be considered insecure. To avoid giving the password on the command line, use an
           option file. See Section 6.1.2.1, “End-User Guidelines for Password Security”.

           To explicitly specify that there is no password and that mysqladmin should not prompt for one, use the --skip-password option.

       ·   --pipe, -W

           On Windows, connect to the server using a named pipe. This option applies only if the server was started with the named_pipe system
           variable enabled to support named-pipe connections. In addition, the user making the connection must be a member of the Windows group
           specified by the named_pipe_full_access_group system variable.

       ·   --plugin-dir=dir_name

           The directory in which to look for plugins. Specify this option if the --default-auth option is used to specify an authentication
           plugin but mysqladmin does not find it. See Section 6.2.13, “Pluggable Authentication”.

       ·   --port=port_num, -P port_num

           For TCP/IP connections, the port number to use.

       ·   --print-defaults

           Print the program name and all options that it gets from option files.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --protocol={TCP|SOCKET|PIPE|MEMORY}

           The connection protocol to use for connecting to the server. It is useful when the other connection parameters normally result in use
           of a protocol other than the one you want. For details on the permissible values, see Section 4.2.4, “Connecting to the MySQL Server
           Using Command Options”.

       ·   --relative, -r

           Show the difference between the current and previous values when used with the --sleep option. This option works only with the
           extended-status command.

       ·   --show-warnings

           Show warnings resulting from execution of statements sent to the server.

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

           Exit silently if a connection to the server cannot be established.

       ·   --sleep=delay, -i delay

           Execute commands repeatedly, sleeping for delay seconds in between. The --count option determines the number of iterations. If --count
           is not given, mysqladmin executes commands indefinitely until interrupted.

       ·   --socket=path, -S path

           For connections to localhost, the Unix socket file to use, or, on Windows, the name of the named pipe to use.

           On Windows, this option applies only if the server was started with the named_pipe system variable enabled to support named-pipe
           connections. In addition, the user making the connection must be a member of the Windows group specified by the
           named_pipe_full_access_group system variable.

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

           Verbose mode. Print more information about what the program does.

       ·   --version, -V

           Display version information and exit.

       ·   --vertical, -E

           Print output vertically. This is similar to --relative, but prints output vertically.

       ·   --wait[=count], -w[count]

           If the connection cannot be established, wait and retry instead of aborting. If a count value is given, it indicates the number of
           times to retry. The default is one time.

       You can also set the following variables by using --var_name=value.

       ·   connect_timeout

           The maximum number of seconds before connection timeout. The default value is 43200 (12 hours).

       ·   shutdown_timeout

           The maximum number of seconds to wait for server shutdown. The default value is 3600 (1 hour).

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

MySQL 5.7                                                           06/08/2019                                                       MYSQLADMIN(1)
