MYSQLIMPORT(1)                                                 MySQL Database System                                                MYSQLIMPORT(1)

NAME
       mysqlimport - a data import program

SYNOPSIS
       mysqlimport [options] db_name textfile1 ...

DESCRIPTION
       The mysqlimport client provides a command-line interface to the LOAD DATA SQL statement. Most options to mysqlimport correspond directly to
       clauses of LOAD DATA syntax. See Section 13.2.6, “LOAD DATA Syntax”.

       Invoke mysqlimport like this:

           shell> mysqlimport [options] db_name textfile1 [textfile2 ...]

       For each text file named on the command line, mysqlimport strips any extension from the file name and uses the result to determine the name
       of the table into which to import the file's contents. For example, files named patient.txt, patient.text, and patient all would be
       imported into a table named patient.

       mysqlimport supports the following options, which can be specified on the command line or in the [mysqlimport] and [client] groups of an
       option file. For information about option files used by MySQL programs, see Section 4.2.2.2, “Using Option Files”.

       ·   --help, -?

           Display a help message and exit.

       ·   --bind-address=ip_address

           On a computer having multiple network interfaces, use this option to select which interface to use for connecting to the MySQL server.

       ·   --character-sets-dir=dir_name

           The directory where character sets are installed. See Section 10.14, “Character Set Configuration”.

       ·   --columns=column_list, -c column_list

           This option takes a list of comma-separated column names as its value. The order of the column names indicates how to match data file
           columns with table columns.

       ·   --compress, -C

           Compress all information sent between the client and the server if possible. See Section 4.2.5, “Connection Compression Control”.

       ·   --debug[=debug_options], -# [debug_options]

           Write a debugging log. A typical debug_options string is d:t:o,file_name. The default is d:t:o.

       ·   --debug-check

           Print some debugging information when the program exits.

       ·   --debug-info

           Print debugging information and memory and CPU usage statistics when the program exits.

       ·   --default-character-set=charset_name

           Use charset_name as the default character set. See Section 10.14, “Character Set Configuration”.

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

           Read not only the usual option groups, but also groups with the usual names and a suffix of str. For example, mysqlimport normally
           reads the [client] and [mysqlimport] groups. If the --defaults-group-suffix=_other option is given, mysqlimport also reads the
           [client_other] and [mysqlimport_other] groups.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --delete, -D

           Empty the table before importing the text file.

       ·   --enable-cleartext-plugin

           Enable the mysql_clear_password cleartext authentication plugin. (See Section 6.4.1.6, “Client-Side Cleartext Pluggable
           Authentication”.)

           This option was added in MySQL 5.7.10.

       ·   --fields-terminated-by=..., --fields-enclosed-by=..., --fields-optionally-enclosed-by=..., --fields-escaped-by=...

           These options have the same meaning as the corresponding clauses for LOAD DATA. See Section 13.2.6, “LOAD DATA Syntax”.

       ·   --force, -f

           Ignore errors. For example, if a table for a text file does not exist, continue processing any remaining files. Without --force,
           mysqlimport exits if a table does not exist.

       ·   --get-server-public-key

           Request from the server the public key required for RSA key pair-based password exchange. This option applies to clients that
           authenticate with the caching_sha2_password authentication plugin. For that plugin, the server does not send the public key unless
           requested. This option is ignored for accounts that do not authenticate with that plugin. It is also ignored if RSA-based password
           exchange is not used, as is the case when the client connects to the server using a secure connection.

           If --server-public-key-path=file_name is given and specifies a valid public key file, it takes precedence over --get-server-public-key.

           For information about the caching_sha2_password plugin, see Section 6.4.1.5, “Caching SHA-2 Pluggable Authentication”.

           The --get-server-public-key option was added in MySQL 5.7.23.

       ·   --host=host_name, -h host_name

           Import data to the MySQL server on the given host. The default host is localhost.

       ·   --ignore, -i

           See the description for the --replace option.

       ·   --ignore-lines=N

           Ignore the first N lines of the data file.

       ·   --lines-terminated-by=...

           This option has the same meaning as the corresponding clause for LOAD DATA. For example, to import Windows files that have lines
           terminated with carriage return/linefeed pairs, use --lines-terminated-by="\r\n". (You might have to double the backslashes, depending
           on the escaping conventions of your command interpreter.) See Section 13.2.6, “LOAD DATA Syntax”.

       ·   --local, -L

           By default, files are read by the server on the server host. With this option, mysqlimport reads input files locally on the client
           host. Enabling local data loading also requires that the server permits it; see Section 6.1.6, “Security Issues with LOAD DATA LOCAL”

       ·   --lock-tables, -l

           Lock all tables for writing before processing any text files. This ensures that all tables are synchronized on the server.

       ·   --login-path=name

           Read options from the named login path in the .mylogin.cnf login path file. A “login path” is an option group containing options that
           specify which MySQL server to connect to and which account to authenticate as. To create or modify a login path file, use the
           mysql_config_editor utility. See mysql_config_editor(1).

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --low-priority

           Use LOW_PRIORITY when loading the table. This affects only storage engines that use only table-level locking (such as MyISAM, MEMORY,
           and MERGE).

       ·   --no-defaults

           Do not read any option files. If program startup fails due to reading unknown options from an option file, --no-defaults can be used to
           prevent them from being read.

           The exception is that the .mylogin.cnf file, if it exists, is read in all cases. This permits passwords to be specified in a safer way
           than on the command line even when --no-defaults is used. (.mylogin.cnf is created by the mysql_config_editor utility. See
           mysql_config_editor(1).)

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --password[=password], -p[password]

           The password of the MySQL account used for connecting to the server. The password value is optional. If not given, mysqlimport prompts
           for one. If given, there must be no space between --password= or -p and the password following it. If no password option is specified,
           the default is to send no password.

           Specifying a password on the command line should be considered insecure. To avoid giving the password on the command line, use an
           option file. See Section 6.1.2.1, “End-User Guidelines for Password Security”.

           To explicitly specify that there is no password and that mysqlimport should not prompt for one, use the --skip-password option.

       ·   --pipe, -W

           On Windows, connect to the server using a named pipe. This option applies only if the server was started with the named_pipe system
           variable enabled to support named-pipe connections. In addition, the user making the connection must be a member of the Windows group
           specified by the named_pipe_full_access_group system variable.

       ·   --plugin-dir=dir_name

           The directory in which to look for plugins. Specify this option if the --default-auth option is used to specify an authentication
           plugin but mysqlimport does not find it. See Section 6.2.13, “Pluggable Authentication”.

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

       ·   --replace, -r

           The --replace and --ignore options control handling of input rows that duplicate existing rows on unique key values. If you specify
           --replace, new rows replace existing rows that have the same unique key value. If you specify --ignore, input rows that duplicate an
           existing row on a unique key value are skipped. If you do not specify either option, an error occurs when a duplicate key value is
           found, and the rest of the text file is ignored.

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

           Silent mode. Produce output only when errors occur.

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

       ·   --use-threads=N

           Load files in parallel using N threads.

       ·   --verbose, -v

           Verbose mode. Print more information about what the program does.

       ·   --version, -V

           Display version information and exit.

       Here is a sample session that demonstrates use of mysqlimport:

           shell> mysql -e 'CREATE TABLE imptest(id INT, n VARCHAR(30))' test
           shell> ed
           a
           100     Max Sydow
           101     Count Dracula
           .
           w imptest.txt
           32
           q
           shell> od -c imptest.txt
           0000000   1   0   0  \t   M   a   x       S   y   d   o   w  \n   1   0
           0000020   1  \t   C   o   u   n   t       D   r   a   c   u   l   a  \n
           0000040
           shell> mysqlimport --local test imptest.txt
           test.imptest: Records: 2  Deleted: 0  Skipped: 0  Warnings: 0
           shell> mysql -e 'SELECT * FROM imptest' test
           +------+---------------+
           | id   | n             |
           +------+---------------+
           |  100 | Max Sydow     |
           |  101 | Count Dracula |
           +------+---------------+

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

MySQL 5.7                                                           06/08/2019                                                      MYSQLIMPORT(1)
