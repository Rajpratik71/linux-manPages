INNOCHECKSUM(1)                                                                            MariaDB Database System                                                                            INNOCHECKSUM(1)



NAME
       innochecksum - offline InnoDB file checksum utility

SYNOPSIS
       innochecksum [options] file_name

DESCRIPTION
       innochecksum prints checksums for InnoDB files. This tool reads an InnoDB tablespace file, calculates the checksum for each page, compares the calculated checksum to the stored checksum, and reports
       mismatches, which indicate damaged pages. It was originally developed to speed up verifying the integrity of tablespace files after power outages but can also be used after file copies. Because
       checksum mismatches will cause InnoDB to deliberately shut down a running server, it can be preferable to use this tool rather than waiting for a server in production usage to encounter the damaged
       pages.

       innochecksum cannot be used on tablespace files that the server already has open. For such files, you should use CHECK TABLE to check tables within the tablespace.

       If checksum mismatches are found, you would normally restore the tablespace from backup or start the server and attempt to use mysqldump to make a backup of the tables within the tablespace.

       Invoke innochecksum like this:

           shell> innochecksum [options] file_name

       innochecksum supports the following options. For options that refer to page numbers, the numbers are zero-based.

       ·   -?, --help

           Displays help and exits.

       ·   -c, --count

           Print a count of the number of pages in the file.

       ·   -d, --debug

           Debug mode; prints checksums for each page.

       ·   -e num, --end-page=#

           End at this page number.

       ·   -i, --per-page-details

           Print out per-page detail information.

       ·   -I, --info

           Synonym for --help.

       ·   -l, --leaf

           Examine leaf index pages.

       ·   -m num, --merge=#

           Leaf page count if merge given number of consecutive pages.

       ·   -p num, --page-num=#

           Check only this page number.

       ·   -s num, --start-page

           Start at this page number.

       ·   -u, --skip-corrupt

           Skip corrupt pages.

       ·   -v, --verbose

           Verbose mode; print a progress indicator every five seconds.

       ·   -V, --version

           Displays version information and exits.

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



MariaDB 10.3                                                                                      9 May 2017                                                                                  INNOCHECKSUM(1)
