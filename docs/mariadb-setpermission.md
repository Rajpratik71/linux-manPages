MYSQL_SETPERMISSI(1)                   MariaDB Database System                   MYSQL_SETPERMISSI(1)

NAME
       mysql_setpermission - interactively set permissions in grant tables

SYNOPSIS
       mysql_setpermission [options]

DESCRIPTION
       mysql_setpermission is a Perl script that was originally written and contributed by Luuk de
       Boer. It interactively sets permissions in the MariaDB grant tables.  mysql_setpermission is
       written in Perl and requires that the DBI and DBD::MariaDB Perl modules be installed.

       Invoke mysql_setpermission like this:

           shell> mysql_setpermission [options]

       options should be either --help to display the help message, or options that indicate how to
       connect to the MariaDB server. The account used when you connect determines which permissions
       you have when attempting to modify existing permissions in the grant tables.

       mysql_setpermission also reads options from the [client] and [perl] groups in the .my.cnf file
       in your home directory, if the file exists.

       mysql_setpermission supports the following options:

       ·   --help

           Display a help message and exit.

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

       ·   --user=user_name

           The MariaDB user name to use when connecting to the server.

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

MariaDB 10.5                                 27 June 2019                        MYSQL_SETPERMISSI(1)
