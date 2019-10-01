RESOLVEIP(1)                                                                               MariaDB Database System                                                                               RESOLVEIP(1)



NAME
       resolveip - resolve host name to IP address or vice versa

SYNOPSIS
       resolveip [options] {host_name|ip-addr} ...

DESCRIPTION
       The resolveip utility resolves host names to IP addresses and vice versa.

       Invoke resolveip like this:

           shell> resolveip [options] {host_name|ip-addr} ...

       resolveip supports the following options.

       ·   --help, --info, -?, -I

           Display a help message and exit.

       ·   --silent, -s

           Silent mode. Produce less output.

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



MariaDB 10.3                                                                                      9 May 2017                                                                                     RESOLVEIP(1)
