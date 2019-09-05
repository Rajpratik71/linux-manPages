MYSQLCHECK(1)                                                  MySQL Database System                                                 MYSQLCHECK(1)

NAME
       mysqlcheck - a table maintenance program

SYNOPSIS
       mysqlcheck [options] [db_name [tbl_name ...]]

DESCRIPTION
       The mysqlcheck client performs table maintenance: It checks, repairs, optimizes, or analyzes tables.

       Each table is locked and therefore unavailable to other sessions while it is being processed, although for check operations, the table is
       locked with a READ lock only (see Section 13.3.5, “LOCK TABLES and UNLOCK TABLES Syntax”, for more information about READ and WRITE locks).
       Table maintenance operations can be time-consuming, particularly for large tables. If you use the --databases or --all-databases option to
       process all tables in one or more databases, an invocation of mysqlcheck might take a long time. (This is also true for the MySQL upgrade
       procedure if it determines that table checking is needed because it processes tables the same way.)

       mysqlcheck must be used when the mysqld server is running, which means that you do not have to stop the server to perform table
       maintenance.

       mysqlcheck uses the SQL statements CHECK TABLE, REPAIR TABLE, ANALYZE TABLE, and OPTIMIZE TABLE in a convenient way for the user. It
       determines which statements to use for the operation you want to perform, and then sends the statements to the server to be executed. For
       details about which storage engines each statement works with, see the descriptions for those statements in Section 13.7.2, “Table
       Maintenance Statements”.

       All storage engines do not necessarily support all four maintenance operations. In such cases, an error message is displayed. For example,
       if test.t is an MEMORY table, an attempt to check it produces this result:

           shell> mysqlcheck test t
           test.t
           note     : The storage engine for the table doesn't support check

       If mysqlcheck is unable to repair a table, see Section 2.11.12, “Rebuilding or Repairing Tables or Indexes” for manual table repair
       strategies. This will be the case, for example, for InnoDB tables, which can be checked with CHECK TABLE, but not repaired with REPAIR
       TABLE.

           Caution
           It is best to make a backup of a table before performing a table repair operation; under some circumstances the operation might cause
           data loss. Possible causes include but are not limited to file system errors.

       There are three general ways to invoke mysqlcheck:

           shell> mysqlcheck [options] db_name [tbl_name ...]
           shell> mysqlcheck [options] --databases db_name ...
           shell> mysqlcheck [options] --all-databases

       If you do not name any tables following db_name or if you use the --databases or --all-databases option, entire databases are checked.

       mysqlcheck has a special feature compared to other client programs. The default behavior of checking tables (--check) can be changed by
       renaming the binary. If you want to have a tool that repairs tables by default, you should just make a copy of mysqlcheck named
       mysqlrepair, or make a symbolic link to mysqlcheck named mysqlrepair. If you invoke mysqlrepair, it repairs tables.

       The names shown in the following table can be used to change mysqlcheck default behavior.

       ┌──────────────┬──────────────────────────────────┐
       │Command       │ Meaning                          │
       ├──────────────┼──────────────────────────────────┤
       │mysqlrepair   │ The default option is --repair   │
       ├──────────────┼──────────────────────────────────┤
       │mysqlanalyze  │ The default option is --analyze  │
       ├──────────────┼──────────────────────────────────┤
       │mysqloptimize │ The default option is --optimize │
       └──────────────┴──────────────────────────────────┘

       mysqlcheck supports the following options, which can be specified on the command line or in the [mysqlcheck] and [client] groups of an
       option file. For information about option files used by MySQL programs, see Section 4.2.2.2, “Using Option Files”.

       ·   --help, -?

           Display a help message and exit.

       ·   --all-databases, -A

           Check all tables in all databases. This is the same as using the --databases option and naming all the databases on the command line,
           except that the INFORMATION_SCHEMA and performance_schema databases are not checked. They can be checked by explicitly naming them with
           the --databases option.

       ·   --all-in-1, -1

           Instead of issuing a statement for each table, execute a single statement for each database that names all the tables from that
           database to be processed.

       ·   --analyze, -a

           Analyze the tables.

       ·   --auto-repair

           If a checked table is corrupted, automatically fix it. Any necessary repairs are done after all tables have been checked.

       ·   --bind-address=ip_address

           On a computer having multiple network interfaces, use this option to select which interface to use for connecting to the MySQL server.

       ·   --character-sets-dir=dir_name

           The directory where character sets are installed. See Section 10.14, “Character Set Configuration”.

       ·   --check, -c

           Check the tables for errors. This is the default operation.

       ·   --check-only-changed, -C

           Check only tables that have changed since the last check or that have not been closed properly.

       ·   --check-upgrade, -g

           Invoke CHECK TABLE with the FOR UPGRADE option to check tables for incompatibilities with the current version of the server. This
           option automatically enables the --fix-db-names and --fix-table-names options.

       ·   --compress

           Compress all information sent between the client and the server if possible. See Section 4.2.5, “Connection Compression Control”.

       ·   --databases, -B

           Process all tables in the named databases. Normally, mysqlcheck treats the first name argument on the command line as a database name
           and any following names as table names. With this option, it treats all name arguments as database names.

       ·   --debug[=debug_options], -# [debug_options]

           Write a debugging log. A typical debug_options string is d:t:o,file_name. The default is d:t:o.

       ·   --debug-check

           Print some debugging information when the program exits.

       ·   --debug-info

           Print debugging information and memory and CPU usage statistics when the program exits.

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

           Read not only the usual option groups, but also groups with the usual names and a suffix of str. For example, mysqlcheck normally reads
           the [client] and [mysqlcheck] groups. If the --defaults-group-suffix=_other option is given, mysqlcheck also reads the [client_other]
           and [mysqlcheck_other] groups.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --extended, -e

           If you are using this option to check tables, it ensures that they are 100% consistent but takes a long time.

           If you are using this option to repair tables, it runs an extended repair that may not only take a long time to execute, but may
           produce a lot of garbage rows also!

       ·   --default-auth=plugin

           A hint about which client-side authentication plugin to use. See Section 6.2.13, “Pluggable Authentication”.

       ·   --enable-cleartext-plugin

           Enable the mysql_clear_password cleartext authentication plugin. (See Section 6.4.1.6, “Client-Side Cleartext Pluggable
           Authentication”.)

           This option was added in MySQL 5.7.10.

       ·   --fast, -F

           Check only tables that have not been closed properly.

       ·   --fix-db-names

           Convert database names to 5.1 format. Only database names that contain special characters are affected.

           This option is deprecated in MySQL 5.7.6 and will be removed in a future version of MySQL. If it is necessary to convert MySQL 5.0
           database or table names, a workaround is to upgrade a MySQL 5.0 installation to MySQL 5.1 before upgrading to a more recent release.

       ·   --fix-table-names

           Convert table names to 5.1 format. Only table names that contain special characters are affected. This option also applies to views.

           This option is deprecated in MySQL 5.7.6 and will be removed in a future version of MySQL. If it is necessary to convert MySQL 5.0
           database or table names, a workaround is to upgrade a MySQL 5.0 installation to MySQL 5.1 before upgrading to a more recent release.

       ·   --force, -f

           Continue even if an SQL error occurs.

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

       ·   --medium-check, -m

           Do a check that is faster than an --extended operation. This finds only 99.99% of all errors, which should be good enough in most
           cases.

       ·   --no-defaults

           Do not read any option files. If program startup fails due to reading unknown options from an option file, --no-defaults can be used to
           prevent them from being read.

           The exception is that the .mylogin.cnf file, if it exists, is read in all cases. This permits passwords to be specified in a safer way
           than on the command line even when --no-defaults is used. (.mylogin.cnf is created by the mysql_config_editor utility. See
           mysql_config_editor(1).)

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --optimize, -o

           Optimize the tables.

       ·   --password[=password], -p[password]

           The password of the MySQL account used for connecting to the server. The password value is optional. If not given, mysqlcheck prompts
           for one. If given, there must be no space between --password= or -p and the password following it. If no password option is specified,
           the default is to send no password.

           Specifying a password on the command line should be considered insecure. To avoid giving the password on the command line, use an
           option file. See Section 6.1.2.1, “End-User Guidelines for Password Security”.

           To explicitly specify that there is no password and that mysqlcheck should not prompt for one, use the --skip-password option.

       ·   --pipe, -W

           On Windows, connect to the server using a named pipe. This option applies only if the server was started with the named_pipe system
           variable enabled to support named-pipe connections. In addition, the user making the connection must be a member of the Windows group
           specified by the named_pipe_full_access_group system variable.

       ·   --plugin-dir=dir_name

           The directory in which to look for plugins. Specify this option if the --default-auth option is used to specify an authentication
           plugin but mysqlcheck does not find it. See Section 6.2.13, “Pluggable Authentication”.

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

       ·   --quick, -q

           If you are using this option to check tables, it prevents the check from scanning the rows to check for incorrect links. This is the
           fastest check method.

           If you are using this option to repair tables, it tries to repair only the index tree. This is the fastest repair method.

       ·   --repair, -r

           Perform a repair that can fix almost anything except unique keys that are not unique.

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

           Silent mode. Print only error messages.

       ·   --skip-database=db_name

           Do not include the named database (case-sensitive) in the operations performed by mysqlcheck.

       ·   --socket=path, -S path

           For connections to localhost, the Unix socket file to use, or, on Windows, the name of the named pipe to use.

           On Windows, this option applies only if the server was started with the named_pipe system variable enabled to support named-pipe
           connections. In addition, the user making the connection must be a member of the Windows group specified by the
           named_pipe_full_access_group system variable.

       ·   --ssl*

           Options that begin with --ssl specify whether to connect to the server using SSL and indicate where to find SSL keys and certificates.
           See the section called “Command Options for Encrypted Connections”.

       ·   --tables

           Override the --databases or -B option. All name arguments following the option are regarded as table names.

       ·   --tls-version=protocol_list

           The permissible TLS protocols for encrypted connections. The value is a list of one or more comma-separated protocol names. The
           protocols that can be named for this option depend on the SSL library used to compile MySQL. For details, see Section 6.3.5, “Encrypted
           Connection Protocols and Ciphers”.

           This option was added in MySQL 5.7.10.

       ·   --use-frm

           For repair operations on MyISAM tables, get the table structure from the .frm file so that the table can be repaired even if the .MYI
           header is corrupted.

       ·   --user=user_name, -u user_name

           The user name of the MySQL account to use for connecting to the server.

       ·   --verbose, -v

           Verbose mode. Print information about the various stages of program operation.

       ·   --version, -V

           Display version information and exit.

       ·   --write-binlog

           This option is enabled by default, so that ANALYZE TABLE, OPTIMIZE TABLE, and REPAIR TABLE statements generated by mysqlcheck are
           written to the binary log. Use --skip-write-binlog to cause NO_WRITE_TO_BINLOG to be added to the statements so that they are not
           logged. Use the --skip-write-binlog when these statements should not be sent to replication slaves or run when using the binary logs
           for recovery from backup.

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

MySQL 5.7                                                           06/08/2019                                                       MYSQLCHECK(1)
