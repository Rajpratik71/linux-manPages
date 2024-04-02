MYSQL_UPGRADE(1)                       MariaDB Database System                       MYSQL_UPGRADE(1)

NAME
       mysql_upgrade - check tables for MariaDB upgrade

SYNOPSIS
       mysql_upgrade [options]

DESCRIPTION
       mysql_upgrade examines all tables in all databases for incompatibilities with the current
       version of the MariaDB Server.  mysql_upgrade also upgrades the system tables so that you can
       take advantage of new privileges or capabilities that might have been added.

       mysql_upgrade should be executed each time you upgrade MariaDB.

       If a table is found to have a possible incompatibility, mysql_upgrade performs a table check.
       If any problems are found, a table repair is attempted.

           Note
           On Windows Server 2008 and Windows Vista, you must run mysql_upgrade with administrator
           privileges. You can do this by running a Command Prompt as Administrator and running the
           command. Failure to do so may result in the upgrade failing to execute correctly.

           Caution
           You should always back up your current MariaDB installation before performing an upgrade.

       To use mysql_upgrade, make sure that the server is running, and then invoke it like this:

           shell> mysql_upgrade [options]

       After running mysql_upgrade, stop the server and restart it so that any changes made to the
       system tables take effect.

       mysql_upgrade executes the following commands to check and repair tables and to upgrade the
       system tables:

           mysqlcheck --all-databases --check-upgrade --auto-repair
           mysql < fix_priv_tables
           mysqlcheck --all-databases --check-upgrade --fix-db-names --fix-table-names

       Notes about the preceding commands:

       ·   Because mysql_upgrade invokes mysqlcheck with the --all-databases option, it processes all
           tables in all databases, which might take a long time to complete. Each table is locked
           and therefore unavailable to other sessions while it is being processed. Check and repair
           operations can be time-consuming, particularly for large tables.

       ·   For details about what checks the --check-upgrade option entails, see the description of
           the FOR UPGRADE option of the CHECK TABLE statement.

       ·   fix_priv_tables represents a script generated internally by mysql_upgrade that contains
           SQL statements to upgrade the tables in the mysql database.

       All checked and repaired tables are marked with the current MariaDB version number. This
       ensures that next time you run mysql_upgrade with the same version of the server, it can tell
       whether there is any need to check or repair the table again.

       mysql_upgrade also saves the MariaDB version number in a file named mysql_upgrade_info in the
       data directory. This is used to quickly check whether all tables have been checked for this
       release so that table-checking can be skipped. To ignore this file and perform the check
       regardless, use the --force option.

       If you install MariaDB from RPM packages on Linux, you must install the server and client
       RPMs.  mysql_upgrade is included in the server RPM but requires the client RPM because the
       latter includes mysqlcheck.

       mysql_upgrade supports the following options, which can be specified on the command line or in
       the [mysql_upgrade] and [client] option file groups. Other options are passed to mysqlcheck.
       For example, it might be necessary to specify the --password[=password] option.  mysql_upgrade
       also supports the options for processing option files.

       ·   --help, -?

           Display a short help message and exit.

       ·   --basedir=path

           Old option accepted for backward compatibility but ignored.

       ·   --character-sets-dir=path

           Old option accepted for backward compatibility but ignored.

       ·   --datadir=path

           Old option accepted for backward compatibility but ignored.

       ·   --debug=path, -# path

           For debug builds, output debug log.

       ·   --debug-check

           Print some debugging information when the program exits.

       ·   --debug-info, -T

           Print debugging information and memory and CPU usage statistics when the program exits.

       ·   --default-character-set=name

           Old option accepted for backward compatibility but ignored.

       ·   --force

           Ignore the mysql_upgrade_info file and force execution of mysqlcheck even if mysql_upgrade
           has already been executed for the current version of MariaDB.

       ·   --host

           Connect to MariaDB on the given host.

       ·   --password[=password], -p[password]

           The password to use when connecting to the server. If you use the short option form (-p),
           you cannot have a space between the option and the password. If you omit the password
           value following the --password or -p option on the command line, mysql_upgrade prompts for
           one.

           Specifying a password on the command line should be considered insecure. You can use an
           option file to avoid giving the password on the command line.

       ·   --port=port_num, -P port_num

           The TCP/IP port number to use for the connection.

       ·   --protocol={TCP|SOCKET|PIPE|MEMORY}

           The connection protocol to use for connecting to the server. It is useful when the other
           connection parameters normally would cause a protocol to be used other than the one you
           want.

       ·   --silent

           Print less information.

       ·   --socket=path, -S path

           For connections to localhost, the Unix socket file to use, or, on Windows, the name of the
           named pipe to use.

       ·   --ssl

           Enable SSL for connection (automatically enabled with other flags). Disable with --skip-
           ssl.

       ·   --ssl-ca=name

           CA file in PEM format (check OpenSSL docs, implies --ssl).

       ·   --ssl-capath=name

           CA directory (check OpenSSL docs, implies --ssl).

       ·   --ssl-cert=name

           X509 cert in PEM format (check OpenSSL docs, implies --ssl).

       ·   --ssl-cipher=name

           SSL cipher to use (check OpenSSL docs, implies --ssl).

       ·   --ssl-key=name

           X509 key in PEM format (check OpenSSL docs, implies --ssl).

       ·   --ssl-crl=name

           Certificate revocation list (check OpenSSL docs, implies --ssl).

       ·   --ssl-crlpath=name

           Certificate revocation list path (check OpenSSL docs, implies --ssl).

       ·   --ssl-verify-server-cert

           Verify server's "Common Name" in its cert against hostname used when connecting. This
           option is disabled by default.

       ·   --tmpdir=path, -t path

           The path name of the directory to use for creating temporary files.

       ·   --upgrade-system-tables, -s

           Only upgrade the system tables in the mysql database. Tables in other databases are not
           checked or touched.

       ·   --user=user_name, -u user_name

           The MariaDB user name to use when connecting to the server and not using the current
           login.

       ·   --verbose

           Display more output about the process. Using it twice will print connection arguments;
           using it 3 times will print out all CHECK, RENAME and ALTER TABLE commands used during the
           check phase; using it 4 times (added in MariaDB 10.0.14) will also write out all
           mysqlcheck commands used.

       ·   --version, -V

           Output version information and exit.

       ·   --version-check, -k

           Run this program only if its 'server version' matches the version of the server to which
           it's connecting. Note: the 'server version' of the program is the version of the MariaDB
           server with which it was built/distributed. Defaults to on; use --skip-version-check to
           disable.

       ·   --write-binlog

           Cause binary logging to be enabled while mysql_upgrade runs.

COPYRIGHT
       Copyright 2007-2008 MySQL AB, 2008-2010 Sun Microsystems, Inc., 2010-2019 MariaDB Foundation

       This documentation is free software; you can redistribute it and/or modify it only under the
       terms of the GNU General Public License as published by the Free Software Foundation; version
       2 of the License.

       This documentation is distributed in the hope that it will be useful, but WITHOUT ANY
       WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
       PURPOSE. See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with the program; if
       not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1335 USA or see http://www.gnu.org/licenses/.

SEE ALSO
       For more information, please refer to the MariaDB Knowledge Base, available online at
       https://mariadb.com/kb/

AUTHOR
       MariaDB Foundation (http://www.mariadb.org/).

MariaDB 10.5                                 27 June 2019                            MYSQL_UPGRADE(1)
