PERROR(1)                                                      MySQL Database System                                                     PERROR(1)

NAME
       perror - display MySQL error message information

SYNOPSIS
       perror [options] errorcode ...

DESCRIPTION
       For most system errors, MySQL displays, in addition to an internal text message, the system error code in one of the following styles:

           message ... (errno: #)
           message ... (Errcode: #)

       You can find out what the error code means by examining the documentation for your system or by using the perror utility.

       perror prints a description for a system error code or for a storage engine (table handler) error code.

       Invoke perror like this:

           shell> perror [options] errorcode ...

       Examples:

           shell> perror 1231
           MySQL error code 1231 (ER_WRONG_VALUE_FOR_VAR): Variable '%-.64s' can't
           be set to the value of '%-.200s'

           shell> perror 13 64
           OS error code  13:  Permission denied
           OS error code  64:  Machine is not on the network

       To obtain the error message for a MySQL Cluster error code, use the ndb_perror utility.

       The meaning of system error messages may be dependent on your operating system. A given error code may mean different things on different
       operating systems.

       perror supports the following options.

       ·   --help, --info, -I, -?

           Display a help message and exit.

       ·   --ndb

           Print the error message for an NDB Cluster error code.

           This option is deprecated in NDB 7.6.4 and later, where perror prints a warning if it is used, and is removed in NDB Cluster 8.0. Use
           the ndb_perror utility instead.

       ·   --silent, -s

           Silent mode. Print only the error message.

       ·   --verbose, -v

           Verbose mode. Print error code and message. This is the default behavior.

       ·   --version, -V

           Display version information and exit.

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

MySQL 5.7                                                           06/08/2019                                                           PERROR(1)
