MYSQL_SECURE_INST(1)                   MariaDB Database System                   MYSQL_SECURE_INST(1)

NAME
       mysql_secure_installation - improve MariaDB installation security

SYNOPSIS
       mysql_secure_installation

DESCRIPTION
       This program enables you to improve the security of your MariaDB installation in the following
       ways:

       ·   You can set a password for root accounts.

       ·   You can remove root accounts that are accessible from outside the local host.

       ·   You can remove anonymous-user accounts.

       ·   You can remove the test database, which by default can be accessed by anonymous users.

       mysql_secure_installation can be invoked without arguments:

           shell> mysql_secure_installation

       The script will prompt you to determine which actions to perform.

       mysql_secure_installation accepts some options:

       ·   --basedir=dir_name

           Base directory.

       ·   --defaults-extra-file=file_name

           Additional option file.

       ·   --defaults-file=file_name

           Option file.

       ·   --no-defaults

           Don't read any defaults file.

       Other unrecognized options will be passed on to the server.

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

MariaDB 10.5                                 27 June 2019                        MYSQL_SECURE_INST(1)
