MYSQL_WAITPID(1)                       MariaDB Database System                       MYSQL_WAITPID(1)

NAME
       mysql_waitpid - kill process and wait for its termination

SYNOPSIS
       mysql_waitpid [options] pid wait_time

DESCRIPTION
       mysql_waitpid signals a process to terminate and waits for the process to exit. It uses the
       kill() system call and Unix signals, so it runs on Unix and Unix-like systems.

       Invoke mysql_waitpid like this:

           shell> mysql_waitpid [options] pid wait_time

       mysql_waitpid sends signal 0 to the process identified by pid and waits up to wait_time
       seconds for the process to terminate.  pid and wait_time must be positive integers.

       If process termination occurs within the wait time or the process does not exist,
       mysql_waitpid returns 0. Otherwise, it returns 1.

       If the kill() system call cannot handle signal 0, mysql_waitpid() uses signal 1 instead.

       mysql_waitpid supports the following options:

       ·   --help, -?, -I

           Display a help message and exit.

       ·   --verbose, -v

           Verbose mode. Display a warning if signal 0 could not be used and signal 1 is used
           instead.

       ·   --version, -V

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

MariaDB 10.5                                 27 June 2019                            MYSQL_WAITPID(1)
