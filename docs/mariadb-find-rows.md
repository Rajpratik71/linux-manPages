MYSQL_FIND_ROWS                        MariaDB Database System                        MYSQL_FIND_ROWS

NAME
       mysql_find_rows - extract SQL statements from files

SYNOPSIS
       mysql_find_rows [options] [file_name ...]

DESCRIPTION
       mysql_find_rows reads files containing SQL statements and extracts statements that match a
       given regular expression or that contain USE db_name or SET statements. The utility was
       written for use with update log files (as used prior to MySQL 5.0) and as such expects
       statements to be terminated with semicolon (;) characters. It may be useful with other files
       that contain SQL statements as long as statements are terminated with semicolons.

       Invoke mysql_find_rows like this:

           shell> mysql_find_rows [options] [file_name ...]

       Each file_name argument should be the name of file containing SQL statements. If no file names
       are given, mysql_find_rows reads the standard input.

       Examples:

           mysql_find_rows --regexp=problem_table --rows=20 < update.log
           mysql_find_rows --regexp=problem_table  update-log.1 update-log.2

       mysql_find_rows supports the following options:

       ·   --help, --Information

           Display a help message and exit.

       ·   --regexp=pattern

           Display queries that match the pattern.

       ·   --rows=N

           Quit after displaying N queries.

       ·   --skip-use-db

           Do not include USE db_name statements in the output.

       ·   --start_row=N

           Start output from this row.

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

MariaDB 10.5                                 27 June 2019                             MYSQL_FIND_ROWS
