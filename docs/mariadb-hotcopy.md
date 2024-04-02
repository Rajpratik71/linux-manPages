MYSQLHOTCOPY(1)                        MariaDB Database System                        MYSQLHOTCOPY(1)

NAME
       mysqlhotcopy - a database backup program

SYNOPSIS
       mysqlhotcopy arguments

DESCRIPTION
       mysqlhotcopy is a Perl script that was originally written and contributed by Tim Bunce. It
       uses FLUSH TABLES, LOCK TABLES, and cp or scp to make a database backup. It is a fast way to
       make a backup of the database or single tables, but it can be run only on the same machine
       where the database directories are located.  mysqlhotcopy works only for backing up MyISAM and
       ARCHIVE tables. It runs on Unix and NetWare.

       To use mysqlhotcopy, you must have read access to the files for the tables that you are
       backing up, the SELECT privilege for those tables, the RELOAD privilege (to be able to execute
       FLUSH TABLES), and the LOCK TABLES privilege (to be able to lock the tables).

           shell> mysqlhotcopy db_name [/path/to/new_directory]

           shell> mysqlhotcopy db_name_1 ... db_name_n /path/to/new_directory

       Back up tables in the given database that match a regular expression:

           shell> mysqlhotcopy db_name./regex/

       The regular expression for the table name can be negated by prefixing it with a tilde (“~”):

           shell> mysqlhotcopy db_name./~regex/

       mysqlhotcopy supports the following options, which can be specified on the command line or in
       the [mysqlhotcopy] and [client] option file groups.

       ·   --help, -?

           Display a help message and exit.

       ·   --addtodest

           Do not rename target directory (if it exists); merely add files to it.

       ·   --allowold

           Do not abort if a target exists; rename it by adding an _old suffix.

       ·   --checkpoint=db_name.tbl_name

           Insert checkpoint entries into the specified database db_name and table tbl_name.

       ·   --chroot=path

           Base directory of the chroot jail in which mysqld operates. The path value should match
           that of the --chroot option given to mysqld.

       ·   --debug

           Enable debug output.

       ·   --dryrun, -n

           Report actions without performing them.

       ·   --flushlog

           Flush logs after all tables are locked.

       ·   --host=host_name, -h host_name

           The host name of the local host to use for making a TCP/IP connection to the local server.
           By default, the connection is made to localhost using a Unix socket file.

       ·   --keepold

           Do not delete previous (renamed) target when done.

       ·   --method=command

           The method for copying files (cp or scp). The default is cp.

       ·   --noindices

           Do not include full index files for MyISAM tables in the backup. This makes the backup
           smaller and faster. The indexes for reloaded tables can be reconstructed later with
           myisamchk -rq.

       ·   --old-server

           Connect to old MySQL-server (before v5.5) which doesn't have FLUSH TABLES WITH READ LOCK
           fully implemented..

       ·   --password=password, -ppassword

           The password to use when connecting to the server. The password value is not optional for
           this option, unlike for other MariaDB programs.

           Specifying a password on the command line should be considered insecure. You can use an
           option file to avoid giving the password on the command line.

       ·   --port=port_num, -P port_num

           The TCP/IP port number to use when connecting to the local server.

       ·   --quiet, -q

           Be silent except for errors.

       ·   --record_log_pos=db_name.tbl_name

           Record master and slave status in the specified database db_name and table tbl_name.

       ·   --regexp=expr

           Copy all databases with names that match the given regular expression.

       ·   --resetmaster

           Reset the binary log after locking all the tables.

       ·   --resetslave

           Reset the master.info file after locking all the tables.

       ·   --socket=path, -S path

           The Unix socket file to use for connections to localhost.

       ·   --suffix=str

           The suffix to use for names of copied databases.

       ·   --tmpdir=path

           The temporary directory. The default is /tmp.

       ·   --user=user_name, -u user_name

           The MariaDB user name to use when connecting to the server.

       Use perldoc for additional mysqlhotcopy documentation, including information about the
       structure of the tables needed for the --checkpoint and --record_log_pos options:

           shell> perldoc mysqlhotcopy

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

MariaDB 10.5                                 27 June 2019                             MYSQLHOTCOPY(1)
