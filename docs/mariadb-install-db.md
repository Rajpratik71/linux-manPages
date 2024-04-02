MYSQL_INSTALL_DB(1)                    MariaDB Database System                    MYSQL_INSTALL_DB(1)

NAME
       mysql_install_db - initialize MariaDB data directory

SYNOPSIS
       mysql_install_db [options]

DESCRIPTION
       mysql_install_db initializes the MariaDB data directory and creates the system tables that it
       contains, if they do not exist.

       To invoke mysql_install_db, use the following syntax:

           shell> mysql_install_db [options]

       Because the MariaDB server, mysqld, needs to access the data directory when it runs later, you
       should either run mysql_install_db from the same account that will be used for running mysqld
       or run it as root and use the --user option to indicate the user name that mysqld will run as.
       It might be necessary to specify other options such as --basedir or --datadir if
       mysql_install_db does not use the correct locations for the installation directory or data
       directory. For example:

           shell> bin/mysql_install_db --user=mysql \
                    --basedir=/opt/mysql/mysql \
                    --datadir=/opt/mysql/mysql/data

       mysql_install_db needs to invoke mysqld with the --bootstrap and --skip-grant-tables options
       (see Section 2.3.2, “Typical configure Options”). If MariaDB was configured with the
       --disable-grant-options option, --bootstrap and --skip-grant-tables will be disabled. To
       handle this, set the MYSQLD_BOOTSTRAP environment variable to the full path name of a server
       that has all options enabled.  mysql_install_db will use that server.

       mysql_install_db supports the following options, which can be specified on the command line or
       in the [mysql_install_db] and (if they are common to mysqld) [mysqld] option file groups.

       ·   --basedir=path

           The path to the MariaDB installation directory.

       ·   --builddir=path

           If using --srcdir with out-of-directory builds, you will need to set this to the location
           of the build directory where built files reside..

       ·   --cross-bootstrap

           For internal use. Used when building the MariaDB system tables on a different host than
           the target..

       ·   --datadir=path, --ldata=path

           The path to the MariaDB data directory.

       ·   --defaults-extra-file=filename

           Set filename as the file to read default options from after the global defaults files has
           been read.  Must be given as first option.

       ·   --defaults-file=filename

           Set filename as the file to read default options from, override global defaults files.
           Must be given as first option.

       ·   --defaults-group-suffix=name

           In addition to the given groups, also read groups with this suffix.

       ·   --force

           Cause mysql_install_db to run even if DNS does not work. In that case, grant table entries
           that normally use host names will use IP addresses.

       ·   --help

           Display a help message and exit.

       ·   --no-defaults

           Do not read default options from any option file. This must be given as the first
           argument.

       ·   --print-defaults

           Print the program argument list and exit.  This must be given as the first argument.

       ·   --rpm

           For internal use. This option is used by RPM files during the MariaDB installation
           process.

       ·   --skip-name-resolve

           Use IP addresses rather than host names when creating grant table entries. This option can
           be useful if your DNS does not work.

       ·   --srcdir=path

           For internal use. The directory under which mysql_install_db looks for support files such
           as the error message file and the file for populating the help tables.4.

       ·   --user=user_name

           The login user name to use for running mysqld. Files and directories created by mysqld
           will be owned by this user. You must be root to use this option. By default, mysqld runs
           using your current login name and files and directories that it creates will be owned by
           you.

       ·   --verbose

           Verbose mode. Print more information about what the program does.

       ·   --windows

           For internal use. This option is used for creating Windows distributions.

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

MariaDB 10.5                                 27 June 2019                         MYSQL_INSTALL_DB(1)
