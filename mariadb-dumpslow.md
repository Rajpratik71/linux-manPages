MYSQLDUMPSLOW(1)                       MariaDB Database System                       MYSQLDUMPSLOW(1)

NAME
       mysqldumpslow - Summarize slow query log files

SYNOPSIS
       mysqldumpslow [options] [log_file ...]

DESCRIPTION
       The MariaDB slow query log contains information about queries that take a long time to
       execute.  mysqldumpslow parses MariaDB slow query log files and prints a summary of their
       contents.

       Normally, mysqldumpslow groups queries that are similar except for the particular values of
       number and string data values. It “abstracts” these values to N and ´S´ when displaying
       summary output. The -a and -n options can be used to modify value abstracting behavior.

       Invoke mysqldumpslow like this:

           shell> mysqldumpslow [options] [log_file ...]

       mysqldumpslow supports the following options.

       ·   --help

           Display a help message and exit.

       ·   -a

           Do not abstract all numbers to N and strings to ´S´.

       ·   --debug, -d

           Run in debug mode.

       ·   -g pattern

           Consider only queries that match the (grep-style) pattern.

       ·   -h host_name

           Host name of MariaDB server for *-slow.log file name. The value can contain a wildcard.
           The default is * (match all).

       ·   -i name

           Name of server instance (if using mysql.server startup script).

       ·   -l

           Do not subtract lock time from total time.

       ·   -n N

           Abstract numbers with at least N digits within names.

       ·   -r

           Reverse the sort order.

       ·   -s sort_type

           How to sort the output. The value of sort_type should be chosen from the following list:

           ·   t, aa: Sort by rows affected or average rows affected

           ·   l, ae: Sort by rows examined or aggregate rows examined

           ·   l, at: Sort by query time or average query time

           ·   l, al: Sort by lock time or average lock time

           ·   s, as: Sort by rows sent or average rows sent

           ·   c: Sort by count

       ·   -t N

           Display only the first N queries in the output.

       ·   --verbose, -v

           Verbose mode. Print more information about what the program does.

       Example of usage:

           shell> mysqldumpslow
           Reading mysql slow query log from /usr/local/mysql/data/mysqld51-apple-slow.log
           Count: 1  Time=4.32s (4s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
            insert into t2 select * from t1
           Count: 3  Time=2.53s (7s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
            insert into t2 select * from t1 limit N
           Count: 3  Time=2.13s (6s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
            insert into t1 select * from t1

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

MariaDB 10.5                                 27 June 2019                            MYSQLDUMPSLOW(1)
