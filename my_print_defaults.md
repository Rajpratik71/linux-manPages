MY_PRINT_DEFAULTS(1)                                                                       MariaDB Database System                                                                       MY_PRINT_DEFAULTS(1)



NAME
       my_print_defaults - display options from option files

SYNOPSIS
       my_print_defaults [options] option_group ...

DESCRIPTION
       my_print_defaults displays the options that are present in option groups of option files. The output indicates what options will be used by programs that read the specified option groups. For
       example, the mysqlcheck program reads the [mysqlcheck] and [client] option groups. To see what options are present in those groups in the standard option files, invoke my_print_defaults like this:

           shell> my_print_defaults mysqlcheck client
           --user=myusername
           --password=secret
           --host=localhost

       The output consists of options, one per line, in the form that they would be specified on the command line.

       my_print_defaults supports the following options.

       ·   --help, -?

           Display a help message and exit.

       ·   --config-file=file_name, --defaults-file=file_name, -c file_name

           Read only the given option file. If no extension is given, default extension(.ini or .cnf) will be used. --config-file is deprecated, use --defaults-file instead. If --defaults-file is the first
           option, then read this file only, do not read global or per-user config files; should be the first option.

       ·   --debug=debug_options, -# debug_options

           Write a debugging log. A typical debug_options string is ´d:t:o,file_name´. The default is ´d:t:o,/tmp/my_print_defaults.trace´.

       ·   --defaults-extra-file=file_name, --extra-file=file_name, -e file_name

           Read this option file after the global option file but (on Unix) before the user option file. Should be the first option. --extra-file is deprecated, use  --defaults-extra-file.

       ·   --defaults-group-suffix=suffix, -g suffix

           In addition to the groups named on the command line, read groups that have the given suffix.

       ·   --mysqld

           Read the same set of groups that the mysqld binary does.

       ·   --no-defaults, -n

           Return an empty string (useful for scripts).

       ·   --verbose, -v

           Verbose mode. Print more information about what the program does.

       ·   --version, -V

           Display version information and exit.

COPYRIGHT
       Copyright 2007-2008 MySQL AB, 2008-2010 Sun Microsystems, Inc., 2010-2015 MariaDB Foundation

       This documentation is free software; you can redistribute it and/or modify it only under the terms of the GNU General Public License as published by the Free Software Foundation; version 2 of the
       License.

       This documentation is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
       General Public License for more details.

       You should have received a copy of the GNU General Public License along with the program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301
       USA or see http://www.gnu.org/licenses/.


SEE ALSO
       For more information, please refer to the MariaDB Knowledge Base, available online at https://mariadb.com/kb/

AUTHOR
       MariaDB Foundation (http://www.mariadb.org/).



MariaDB 10.3                                                                                      9 May 2017                                                                             MY_PRINT_DEFAULTS(1)
