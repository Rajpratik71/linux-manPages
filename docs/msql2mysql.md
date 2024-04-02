MSQL2MYSQL(1)                          MariaDB Database System                          MSQL2MYSQL(1)

NAME
       msql2mysql - convert mSQL programs for use with MySQL

SYNOPSIS
       msql2mysqlC-source-file ...

DESCRIPTION
       Initially, the MySQL C API was developed to be very similar to that for the mSQL database
       system. Because of this, mSQL programs often can be converted relatively easily for use with
       MySQL by changing the names of the C API functions.

       The msql2mysql utility performs the conversion of mSQL C API function calls to their MySQL
       equivalents.  msql2mysql converts the input file in place, so make a copy of the original
       before converting it. For example, use msql2mysql like this:

           shell> cp client-prog.c client-prog.c.orig
           shell> msql2mysql client-prog.c
           client-prog.c converted

       Then examine client-prog.c and make any post-conversion revisions that may be necessary.

       msql2mysql uses the replace utility to make the function name substitutions. See replace(1).

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

MariaDB 10.5                                 27 June 2019                               MSQL2MYSQL(1)
