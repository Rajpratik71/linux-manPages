RESOLVE_STACK_DUM(1)                   MariaDB Database System                   RESOLVE_STACK_DUM(1)

NAME
       resolve_stack_dump - resolve numeric stack trace dump to symbols

SYNOPSIS
       resolve_stack_dump [options] symbols_file [numeric_dump_file]

DESCRIPTION
       resolve_stack_dump resolves a numeric stack dump to symbols.

       Invoke resolve_stack_dump like this:

           shell> resolve_stack_dump [options] symbols_file [numeric_dump_file]

       The symbols file should include the output from the nm --numeric-sort mysqld command. The
       numeric dump file should contain a numeric stack track from mysqld. If no numeric dump file is
       named on the command line, the stack trace is read from the standard input.

       resolve_stack_dump supports the following options.

       ·   --help, -h

           Display a help message and exit.

       ·   --numeric-dump-file=file_name, -n file_name

           Read the stack trace from the given file.

       ·   --symbols-file=file_name, -s file_name

           Use the given symbols file.

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

MariaDB 10.5                                 27 June 2019                        RESOLVE_STACK_DUM(1)
