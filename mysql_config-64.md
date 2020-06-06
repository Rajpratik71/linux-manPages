MYSQL_CONFIG(1)                                                                            MariaDB Database System                                                                            MYSQL_CONFIG(1)



NAME
       mysql_config - get compile options for compiling clients

SYNOPSIS
       mysql_config options

DESCRIPTION
       mysql_config provides you with useful information for compiling your MariaDB client and connecting it to MariaDB.

       mysql_config supports the following options.

       ·   --cflags

           Compiler flags to find include files and critical compiler flags and defines used when compiling the libmysqlclient library. The options returned are tied to the specific compiler that was used
           when the library was created and might clash with the settings for your own compiler. Use --include for more portable options that contain only include paths.

       ·   --include

           Compiler options to find MariaDB include files.

       ·   --libmysqld-libs, --embedded

           Libraries and options required to link with the MariaDB embedded server.

       ·   --libs

           Libraries and options required to link with the MariaDB client library.

       ·   --libs_r

           Libraries and options required to link with the thread-safe MariaDB client library.

       ·   --plugindir

           The default plugin directory path name, defined when configuring MariaDB.

       ·   --port

           The default TCP/IP port number, defined when configuring MariaDB.

       ·   --socket

           The default Unix socket file, defined when configuring MariaDB.

       ·   --variable=VAR

           Path to MariaDB include, library and plugin directories. VAR is one of `pkgincludedir`, `pkglibdir` and `plugindir`, respectively.

       ·   --version

           Version number for the MariaDB distribution.

       If you invoke mysql_config with no options, it displays a list of all options that it supports, and their values:

           shell> mysql_config
           Usage: /usr/local/mysql/bin/mysql_config [options]
           Options:
             --cflags         [-I/usr/local/mysql/include/mysql -mcpu=pentiumpro]
             --include        [-I/usr/local/mysql/include/mysql]
             --libs           [-L/usr/local/mysql/lib/mysql -lmysqlclient -lz
                               -lcrypt -lnsl -lm -L/usr/lib -lssl -lcrypto]
             --libs_r         [-L/usr/local/mysql/lib/mysql -lmysqlclient_r
                               -lpthread -lz -lcrypt -lnsl -lm -lpthread]
             --socket         [/tmp/mysql.sock]
             --port           [3306]
             --version        [4.0.16]
             --libmysqld-libs [-L/usr/local/mysql/lib/mysql -lmysqld -lpthread -lz
                               -lcrypt -lnsl -lm -lpthread -lrt]

       You can use mysql_config within a command line to include the value that it displays for a particular option. For example, to compile a MariaDB client program, use mysql_config as follows:

           shell> CFG=/usr/local/mysql/bin/mysql_config
           shell> sh -c "gcc -o progname `$CFG --include` progname.c `$CFG --libs`"

       When you use mysql_config this way, be sure to invoke it within backtick (“`”) characters. That tells the shell to execute it and substitute its output into the surrounding command.

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



MariaDB 10.3                                                                                      9 May 2017                                                                                  MYSQL_CONFIG(1)
