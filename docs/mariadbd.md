MYSQLD(8)                              MariaDB Database System                              MYSQLD(8)

NAME
       mysqld - the MariaDB server

SYNOPSIS
       mysqld [options]

DESCRIPTION
       mysqld, also known as MariaDB Server, is the main program that does most of the work in a
       MariaDB installation. MariaDB Server manages access to the MariaDB data directory that
       contains databases and tables. The data directory is also the default location for other
       information such as log files and status files.

       When MariaDB server starts, it listens for network connections from client programs and
       manages access to databases on behalf of those clients.

       The mysqld program has many options that can be specified at startup. For a complete list of
       options, run this command:

           shell> mysqld --verbose --help

       MariaDB Server also has a set of system variables that affect its operation as it runs. System
       variables can be set at server startup, and many of them can be changed at runtime to effect
       dynamic server reconfiguration. MariaDB Server also has a set of status variables that provide
       information about its operation. You can monitor these status variables to access runtime
       performance characteristics.

       For a full description of MariaDB Server command options, system variables, and status
       variables, see the MariaDB Knowledge Base.

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

MariaDB 10.5                                 27 June 2019                                   MYSQLD(8)
