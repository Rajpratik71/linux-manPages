MYSQL_CONVERT_TAB(1)                   MariaDB Database System                   MYSQL_CONVERT_TAB(1)

NAME
       mysql_convert_table_format - convert tables to use a given storage engine

SYNOPSIS
       mysql_convert_table_format [options] db_name

DESCRIPTION
       mysql_convert_table_format converts the tables in a database to use a particular storage
       engine (MyISAM by default).  mysql_convert_table_format is written in Perl and requires that
       the DBI and DBD::MariaDB Perl modules be installed (see Section 2.15, “Perl Installation
       Notes”).

       Invoke mysql_convert_table_format like this:

           shell> mysql_convert_table_format [options]db_name

       The db_name argument indicates the database containing the tables to be converted.

       mysql_convert_table_format supports the options described in the following list.

       ·   --help

           Display a help message and exit.

       ·   --force

           Continue even if errors occur.

       ·   --host=host_name

           Connect to the MariaDB server on the given host.

       ·   --password=password

           The password to use when connecting to the server. Note that the password value is not
           optional for this option, unlike for other MariaDB programs.

           Specifying a password on the command line should be considered insecure. You can use an
           option file to avoid giving the password on the command line.

       ·   --port=port_num

           The TCP/IP port number to use for the connection.

       ·   --socket=path

           For connections to localhost, the Unix socket file to use.

       ·   --type=engine_name

           Specify the storage engine that the tables should be converted to use. The default is
           MyISAM if this option is not given.

       ·   --user=user_name

           The MariaDB user name to use when connecting to the server.

       ·   --verbose

           Verbose mode. Print more information about what the program does.

       ·   --version

           Display version information and exit.

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

MariaDB 10.5                                 27 June 2019                        MYSQL_CONVERT_TAB(1)
