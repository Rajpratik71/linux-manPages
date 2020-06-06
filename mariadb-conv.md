MARIADB-CONV(1)                        MariaDB Database System                        MARIADB-CONV(1)

NAME
       mariadb-conv - character set conversion utility for MariaDB

SYNOPSIS
       mariadb-conv [OPTION...] [FILE...]

DESCRIPTION
       mariadb-conv is a character set conversion utility for MariaDB.

       mariadb-conv supports the following options.

       ·   --from=name, -f name

           Specifies the encoding of the input.

       ·   --to=name, -t name

           Specifies the encoding of the output.

       ·   --continue, -c

           Silently ignore conversion errors.

       ·   --delimiter=name,

           Treat the specified characters as delimiters.

COPYRIGHT
       Copyright 2020 MariaDB Foundation

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
       https://mariadb.com/kb/en/mariadb-conv/

AUTHOR
       MariaDB Foundation (http://www.mariadb.org/).

MariaDB 10.5                                 28 Feb 2020                              MARIADB-CONV(1)
