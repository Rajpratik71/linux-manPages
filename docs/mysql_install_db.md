MYSQL_INSTALL_DB(1)                                            MySQL Database System                                           MYSQL_INSTALL_DB(1)

NAME
       mysql_install_db - initialize MySQL data directory

SYNOPSIS
       mysql_install_db [options]

DESCRIPTION
           Note
           mysql_install_db is deprecated as of MySQL 5.7.6 because its functionality has been integrated into mysqld, the MySQL server. To
           initialize a MySQL installation, invoke mysqld with the --initialize or --initialize-insecure option. For more information, see
           Section 2.10.1, “Initializing the Data Directory”.  mysql_install_db will be removed in a future MySQL release.

       mysql_install_db handles initialization tasks that must be performed before the MySQL server, mysqld, is ready to use:

       ·   It initializes the MySQL data directory and creates the system tables that it contains.

       ·   It initializes the system tablespace and related data structures needed to manage InnoDB tables.

       ·   It loads the server-side help tables.

       ·   It installs the sys schema.

       ·   It creates an administrative account. Older versions of mysql_install_db may create anonymous-user accounts.

       Before MySQL 5.7.5, mysql_install_db is a Perl script and requires that Perl be installed. As of 5.7.5, mysql_install_db is written in C++
       and supplied in binary distributions as an executable binary. In addition, a number of new options were added and old options removed. If
       you find that an option does not work as you expect, be sure to check which options apply in your version of mysql_install_db (invoke it
       with the --help option).  Secure-by-Default Deployment.PP Current versions of mysql_install_db produce a MySQL deployment that is secure by
       default. It is recommended that you use mysql_install_db from MySQL 5.7.5 or up for best security, but version-dependent information about
       security characteristics is included here for completeness (secure-by-default deployment was introduced in stages in MySQL 5.7).

       MySQL 5.7.5 and up is secure by default, with these characteristics:

       ·   A single administrative account named 'root'@'localhost' is created with a randomly generated password, which is marked expired.

       ·   No anonymous-user accounts are created.

       ·   No test database accessible by all users is created.

       ·   --admin-xxx options are available to control characteristics of the administrative account.

       ·   The --random-password-file option is available to control where the random password is written.

       ·   The --insecure option is available to suppress random password generation.

       MySQL 5.7.4 is secure by default, with these characteristics:

       ·   A single administrative account named 'root'@'localhost' is created with a randomly generated password, which is marked expired.

       ·   No anonymous-user accounts are created.

       ·   No test database accessible by all users is created.

       ·   The --skip-random-passwords option is available to suppress random password generation, and to create a test database.

       MySQL 5.7.3 and earlier are not secure by default, with these characteristics:

       ·   Multiple administrative root accounts are created with no password.

       ·   Anonymous-user accounts are created.

       ·   A test database accessible by all users is created.

       ·   The --random-passwords option is available to generate random passwords for administrative accounts and mark them expired, and to not
           create anonymous-user accounts.

       If mysql_install_db generates a random administative password, it writes the password to a file and displays the file name. The password
       entry includes a timestamp to indicate when it was written. By default, the file is .mysql_secret in the home directory of the effective
       user running the script.  .mysql_secret is created with mode 600 to be accessible only to the operating system user for whom it is created.

           Important
           When mysql_install_db generates a random password for the administrative account, it is necessary after mysql_install_db has been run
           to start the server, connect using the administrative account with the password written to the .mysql_secret file, and specify a new
           administrative password. Until this is done, the administrative account cannot be used for anything else. To change the password, you
           can use the SET PASSWORD statement (for example, with the mysql or mysqladmin client). After resetting the password, remove the
           .mysql_secret file; otherwise, if you run mysql_secure_installation, that command may see the file and expire the root password again
           as part of ensuring secure deployment.
       Invocation Syntax.PP Several changes to mysql_install_db were made in MySQL 5.7.5 that affect the invocation syntax. Change location to the
       MySQL installation directory and use the command appropriate to your version of MySQL:

       ·   Invocation syntax for MySQL 5.7.5 and up:

               shell> bin/mysql_install_db --datadir=path/to/datadir [other_options]

           The --datadir option is mandatory.  mysql_install_db creates the data directory, which must not already exist:

           ·   If the data directory does already exist, you are performing an upgrade operation (not an install operation) and should run
               mysql_upgrade, not mysql_install_db. See mysql_upgrade(1).

           ·   If the data directory does not exist but mysql_install_db fails, you must remove any partially created data directory before
               running mysql_install_db again.

       ·   Invocation syntax before MySQL 5.7.5:

               shell> scripts/mysql_install_db [options]

       Because the MySQL server, mysqld, must access the data directory when it runs later, you should either run mysql_install_db from the same
       system account that will be used for running mysqld, or run it as root and specify the --user option to indicate the user name that mysqld
       will run as. It might be necessary to specify other options such as --basedir if mysql_install_db does not use the correct location for the
       installation directory. For example:

           shell> bin/mysql_install_db --user=mysql \
                    --basedir=/opt/mysql/mysql \
                    --datadir=/opt/mysql/mysql/data

           Note
           After mysql_install_db sets up the InnoDB system tablespace, changes to some tablespace characteristics require setting up a whole new
           instance. This includes the file name of the first file in the system tablespace and the number of undo logs. If you do not want to use
           the default values, make sure that the settings for the innodb_data_file_path and innodb_log_file_size configuration parameters are in
           place in the MySQL configuration file before running mysql_install_db. Also make sure to specify as necessary other parameters that
           affect the creation and location of InnoDB files, such as innodb_data_home_dir and innodb_log_group_home_dir.

           If those options are in your configuration file but that file is not in a location that MySQL reads by default, specify the file
           location using the --defaults-extra-file option when you run mysql_install_db.

           Note
           If you have set a custom TMPDIR environment variable when performing the installation, and the specified directory is not accessible,
           mysql_install_db may fail. If so, unset TMPDIR or set TMPDIR to point to the system temporary directory (usually /tmp).
       Administrative Account Creation.PP mysql_install_db creates an administrative account named 'root'@'localhost' by default. (Before MySQL
       5.7.4, mysql_install_db creates additional root accounts, such as 'root'@'127.0.0.1'. This is no longer done.)

       As of MySQL 5.7.5, mysql_install_db provides options that enable you to control several aspects of the administrative account:

       ·   To change the user or host parts of the account name, use --login-path, or --admin-user and --admin-host.

       ·   --insecure suppresses generation of a random password.

       ·   --admin-auth-plugin specifies the authentication plugin.

       ·   --admin-require-ssl specifies whether the account must use SSL connections.

       For more information, see the descriptions of those options.

       mysql_install_db assigns mysql.user system table rows a nonempty plugin column value to set the authentication plugin. The default value is
       mysql_native_password. The value can be changed using the --admin-auth-plugin option in MySQL 5.7.5 and up (as noted previously), or by
       setting the default_authentication_plugin system variable in MySQL 5.7.2 to 5.7.4.  Default my.cnf File.PP As of MySQL 5.7.5,
       mysql_install_db creates no default my.cnf file.

       Before MySQL 5.7.5, mysql_install_db creates a default option file named my.cnf in the base installation directory. This file is created
       from a template included in the distribution package named my-default.cnf. You can find the template in or under the base installation
       directory. When started using mysqld_safe, the server uses my.cnf file by default. If my.cnf already exists, mysql_install_db assumes it to
       be in use and writes a new file named my-new.cnf instead.

           Note
           As of MySQL 5.7.18, my-default.cnf is no longer included in or installed by distribution packages.

       With one exception, the settings in the default option file are commented and have no effect. The exception is that the file sets the
       sql_mode system variable to NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES. This setting produces a server configuration that results in errors
       rather than warnings for bad data in operations that modify transactional tables. See Section 5.1.10, “Server SQL Modes”.  Command
       Options.PP mysql_install_db supports the following options, which can be specified on the command line or in the [mysql_install_db] group
       of an option file. For information about option files used by MySQL programs, see Section 4.2.2.2, “Using Option Files”.

       Before MySQL 5.7.5, mysql_install_db passes unrecognized options to mysqld.

       ·   --help, -?

           Display a help message and exit.

       ·   --admin-auth-plugin=plugin_name

           The authentication plugin to use for the administrative account. The default is mysql_native_password.

       ·   --admin-host=host_name

           The host part to use for the adminstrative account name. The default is localhost. This option is ignored if --login-path is also
           specified.

       ·   --admin-require-ssl

           Whether to require SSL for the administrative account. The default is not to require it. With this option enabled, the statement that
           mysql_install_db uses to create the account includes a REQUIRE SSL clause. As a result, the administrative account must use secure
           connections when connecting to the server.

       ·   --admin-user=user_name

           The user part to use for the adminstrative account name. The default is root. This option is ignored if --login-path is also specified.

       ·   --basedir=dir_name

           The path to the MySQL installation directory.

       ·   --builddir=dir_name

           For use with --srcdir and out-of-source builds. Set this to the location of the directory where the built files reside.

       ·   --cross-bootstrap

           For internal use. This option is used for building system tables on one host intended for another.

           This option was removed in MySQL 5.7.5.

       ·   --datadir=dir_name

           The path to the MySQL data directory. Only the last component of the path name is created if it does not exist; the parent directory
           must already exist or an error occurs.

               Note
               As of MySQL 5.7.5, the --datadir option is mandatory and the data directory must not already exist. (It remains true that the
               parent directory must exist.)

       ·   --defaults

           This option causes mysql_install_db to invoke mysqld in such a way that it reads option files from the default locations. If given as
           --no-defaults, and --defaults-file or --defaults-extra-file is not also specified, mysql_install_db passes --no-defaults to mysqld, to
           prevent option files from being read. This may help if program startup fails due to reading unknown options from an option file.

       ·   --defaults-extra-file=file_name

           Read this option file after the global option file but (on Unix) before the user option file. If the file does not exist or is
           otherwise inaccessible, an error occurs.  file_name is interpreted relative to the current directory if given as a relative path name
           rather than a full path name.

           This option is passed by mysql_install_db to mysqld.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --defaults-file=file_name

           Use only the given option file. If the file does not exist or is otherwise inaccessible, an error occurs.  file_name is interpreted
           relative to the current directory if given as a relative path name rather than a full path name.

           This option is passed by mysql_install_db to mysqld.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --extra-sql-file=file_name, -f file_name

           This option names a file containing additional SQL statements to be executed after the standard bootstrapping statements. Accepted
           statement syntax in the file is like that of the mysql command-line client, including support for multiple-line C-style comments and
           delimiter handling to enable definition of stored programs.

       ·   --force

           Cause mysql_install_db to run even if DNS does not work. Grant table entries normally created using host names will use IP addresses
           instead.

           This option was removed in MySQL 5.7.5.

       ·   --insecure

           Do not generate a random password for the adminstrative account.

               Note
               The --insecure option was added in MySQL 5.7.5, replacing the --skip-random-passwords option.
           If --insecure is not given, it is necessary after mysql_install_db has been run to start the server, connect using the administrative
           account with the password written to the .mysql_secret file, and specify a new administrative password. Until this is done, the
           administrative account cannot be used for anything else. To change the password, you can use the SET PASSWORD statement (for example,
           with the mysql or mysqladmin client). After resetting the password, remove the .mysql_secret file; otherwise, if you run
           mysql_secure_installation, that command may see the file and expire the root password again as part of ensuring secure deployment.

       ·   --keep-my-cnf

           Tell mysql_install_db to preserve any existing my.cnf file and not create a new default my.cnf file.

           This option was added in MySQL 5.7.4 and removed in 5.7.5. As of 5.7.5, mysql_install_db does not create a default my.cnf file.

       ·   --lc-messages=name

           The locale to use for error messages. The default is en_US. The argument is converted to a language name and combined with the value of
           --lc-messages-dir to produce the location for the error message file. See Section 10.11, “Setting the Error Message Language”.

       ·   --lc-messages-dir=dir_name

           The directory where error messages are located. The value is used together with the value of --lc-messages to produce the location for
           the error message file. See Section 10.11, “Setting the Error Message Language”.

       ·   --ldata=dir_name

           A synonym for --datadir.

           This option was removed in MySQL 5.7.5.

       ·   --login-file=file_name

           The file from which to read the login path if the --login-path=file_name option is specified. The default file is .mylogin.cnf.

       ·   --login-path=name

           Read options from the named login path in the .mylogin.cnf login path file. The default login path is client. (To read a different
           file, use the --login-file=name option.) A “login path” is an option group containing options that specify which MySQL server to
           connect to and which account to authenticate as. To create or modify a login path file, use the mysql_config_editor utility. See
           mysql_config_editor(1).

           If the --login-path option is specified, the user, host, and password values are taken from the login path and used to create the
           administrative account. The password must be defined in the login path or an error occurs, unless the --insecure option is also
           specified. In addition, with --login-path, any --admin-host and --admin-user options are ignored.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --mysqld-file=file_name

           The path name of the mysqld binary to execute. The option value must be an absolute path name or an error occurs.

           If this option is not given, mysql_install_db searches for mysqld in these locations:

           ·   In the bin directory under the --basedir option value, if that option was given.

           ·   In the bin directory under the --srcdir option value, if that option was given.

           ·   In the bin directory under the --builddir option value, if that option was given.

           ·   In the local directory and in the bin and sbin directories under the local directory.

           ·   In /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin, /opt/local/bin, /opt/local/sbin.

       ·   --no-defaults

           Before MySQL 5.7.5, do not read any option files. If program startup fails due to reading unknown options from an option file,
           --no-defaults can be used to prevent them from being read. For behavior of this option as of MySQL 5.7.5, see the description of
           --defaults.

           For additional information about this and other option-file options, see Section 4.2.2.3, “Command-Line Options that Affect Option-File
           Handling”.

       ·   --random-password-file=file_name

           The path name of the file in which to write the randomly generated password for the administrative account. The option value must be an
           absolute path name or an error occurs. The default is $HOME/.mysql_secret.

       ·   --random-passwords

               Note
               This option was removed in MySQL 5.7.4 and replaced with --skip-random-passwords, which was in turn removed in MySQL 5.7.5 and
               replaced with --insecure.
           On Unix platforms, this option provides for more secure MySQL installation. Invoking mysql_install_db with --random-passwords causes it
           to perform the following actions in addition to its normal operation:

           ·   The installation process creates a random password, assigns it to the initial MySQL root accounts, and marks the password expired
               for those accounts.

           ·   The initial random root password is written to the .mysql_secret file in the directory named by the HOME environment variable.
               Depending on operating system, using a command such as sudo may cause the value of HOME to refer to the home directory of the root
               system user.  .mysql_secret is created with mode 600 to be accessible only to the operating system user for whom it is created.

               If .mysql_secret already exists, the new password information is appended to it. Each password entry includes a timestamp to
               indicate when it was written.

           ·   No anonymous-user MySQL accounts are created.

           As a result of these actions, it is necessary after installation to start the server, connect as root using the password written to the
           .mysql_secret file, and specify a new root password. Until this is done, root cannot do anything else. This must be done for each root
           account you intend to use. To change the password, you can use the SET PASSWORD statement (for example, with the mysql client). You can
           also use mysqladmin or mysql_secure_installation.

           New install operations (not upgrades) using RPM packages and Solaris PKG packages invoke mysql_install_db with the --random-passwords
           option. (Install operations using RPMs for Unbreakable Linux Network are unaffected because they do not use mysql_install_db.)

           For install operations using a binary .tar.gz distribution or a source distribution, you can invoke mysql_install_db with the
           --random-passwords option manually to make your MySQL installation more secure. This is recommended, particularly for sites with
           sensitive data.

       ·   --rpm

           For internal use. This option is used during the MySQL installation process for install operations performed using RPM packages.

           This option was removed in MySQL 5.7.5.

       ·   --skip-name-resolve

           Use IP addresses rather than host names when creating grant table entries. This option can be useful if your DNS does not work.

           This option was removed in MySQL 5.7.5.

       ·   --skip-random-passwords

               Note
               The --skip-random-passwords option was added in MySQL 5.7.4, replacing the --random-passwords option.  --skip-random-passwords was
               in turn removed in MySQL 5.7.5 and replaced with --insecure.
           As of MySQL 5.7.4, MySQL deployments produced using mysql_install_db are secure by default. When invoked without the
           --skip-random-passwords option, mysql_install_db uses these default deployment characteristics:

           ·   The installation process creates a single root account, 'root'@'localhost', automatically generates a random password for this
               account, and marks the password expired.

           ·   The initial random root password is written to the .mysql_secret file in the home directory of the effective user running the
               script.  .mysql_secret is created with mode 600 to be accessible only to the operating system user for whom it is created.

               If .mysql_secret already exists, the new password information is appended to it. Each password entry includes a timestamp to
               indicate when it was written.

           ·   No anonymous-user MySQL accounts are created.

           ·   No test database is created.

           As a result of these actions, it is necessary after installation to start the server, connect as root using the password written to the
           .mysql_secret file, and specify a new root password. Until this is done, the administrative account cannot be used for anything else.
           To change the password, you can use the SET PASSWORD statement (for example, with the mysql client). You can also use mysqladmin or
           mysql_secure_installation.

           To produce a MySQL deployment that is not secure by default, you must explicitly specify the --skip-random-passwords option when you
           invoke mysql_install_db. With this option, mysql_install_db performs the following actions:

           ·   No random password is generated for the 'root'@'localhost' account.

           ·   A test database is created that is accessible by any user.

       ·   --skip-sys-schema

           As of MySQL 5.7.7, mysql_install_db installs the sys schema. The --skip-sys-schema option suppresses this behavior. This option was
           added in MySQL 5.7.7.

       ·   --srcdir=dir_name

           For internal use. This option specifies the directory under which mysql_install_db looks for support files such as the error message
           file and the file for populating the help tables.

       ·   --user=user_name, -u user_name

           The system (login) user name to use for running mysqld. Files and directories created by mysqld will be owned by this user. You must be
           the system root user to use this option. By default, mysqld runs using your current login name and files and directories that it
           creates will be owned by you.

       ·   --verbose, -v

           Verbose mode. Print more information about what the program does. You can use this option to see the mysqld command that
           mysql_install_db invokes to start the server in bootstrap mode.

       ·   --version, -V

           Display version information and exit.

       ·   --windows

           For internal use. This option is used for creating Windows distributions. It is a deprecated alias for --cross-bootstrap

           This option was removed in MySQL 5.7.5.

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

MySQL 5.7                                                           06/08/2019                                                 MYSQL_INSTALL_DB(1)
