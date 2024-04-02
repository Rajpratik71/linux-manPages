MYSQLFRM(1)                                                        User Commands                                                       MYSQLFRM(1)

NAME
       mysqlfrm - show CREATE TABLE from .frm files

SYNOPSIS
       mysqlfrm --server=[user[:<pass>]@host[:<port>][:<socket>]|<login-path>[:<port>][:<socket>]] [pathbl1.frm|db:tbl.frm]

DESCRIPTION
       mysqlfrm - show CREATE TABLE from .frm files

OPTIONS
       --version
              show program's version number and exit

       --help

       --basedir=BASEDIR
              the base directory for the server

       --diagnostic
              read  the  frm  files byte-by-byte to form the CREATE statement. May require the --server or --basedir options to decipher character
              set information

       --new-storage-engine=NEW_ENGINE
              change ENGINE clause to use this engine.

       --port=PORT
              Port to use for the spawned server.

       -s, --show-stats
              show file statistics and general table information.

       --server=SERVER
              connection    information    for    the    server     in     the     form:     <user>[:<password>]@<host>[:<port>][:<socket>]     or
              <login-path>[:<port>][:<socket>]  (optional)  -  if  provided,  the  storage  engine and character set information will be validated
              against this server.

       --user=USER
              user account to launch spawned server. Required if running as root user. Used only in the default mode.

       --start-timeout=START_TIMEOUT
              Number of seconds to wait for spawned server to start.  Default = 10.

       -v, --verbose
              control how much information is displayed. e.g., -v = verbose, -vv = more verbose, -vvv = debug

       -q, --quiet
              turn off all messages for quiet execution.

       Introduction ------------ The mysqlfrm utility is designed as a recovery tool that reads .frm files and produces  facsimile  CREATE  state‐
       ments from the table definition data found in the .frm file. In most cases, the CREATE statement produced will be usable for recreating the
       table on another server or for extended diagnostics.  However, some features are not saved in the .frm files and therefore will be omitted.
       The exclusions include but are not limited to:

              - foreign key constraints - auto increment number sequences

       The  mysqlfrm  utility has two modes of operation. The default mode is designed to spawn an instance of an installed server by reference to
       the base directory using the --basedir option or by connecting to the server with the --server option. The process will not alter the orig‐
       inal  .frm  file(s).  This mode also requires the --port option to specify a port to use for the spawned server. The spawned server will be
       shutdown and all temporary files removed after the .frm files are read.

       A diagnostic mode is available by using the --diagnostic option. This will switch the utility to reading the  .frm  files  byte-by-byte  to
       recover  as much information as possible. The diagnostic mode has additional limitations in that it cannot decipher character set or colla‐
       tion values without using an existing server installation specified with either the --server or --basedir option. This can also affect  the
       size  of  the  columns  if the table uses multi-byte characters. Use this mode when the default mode cannot read the file or if there is no
       server installed on the host.

       To read .frm files, list each file as a separate argument for the utility as shown in the following examples. You will need to specify  the
       path for each .frm file you want to read or supply a path to a directory and all of the .frm files in that directory will be read.

              #  Read  a  single  .frm file in the default mode using the server installed # in /usr/local/bin/mysql where the .frm file is in the
              current folder.  # Notice the use of the db:table.frm format for specifying the database # name for the  table.  The  database  name
              appears to the left of ':' and # the .frm name to the right. So in this case, we have database = test1 # and table = db1 so the CRE‐
              ATE statement will read CREATE test1.db1.

              $ mysqlfrm --basedir=/usr/local/bin/mysql test1:db1.frm --port=3333

              # Read multiple .frm files in the default mode using a running server # where the .frm files are located in different folders.

              $ mysqlfrm --server=root:pass@localhost:3306 /mysql/data/temp1/t1.frm \

              /mysql/data/temp2/g1.frm --port=3310

              # Execute the spawned server under a different user name and read # all of the .frm files in a particular folder in default mode.

              $ mysqlfrm --server=root:pass@localhost:3306 /mysql/data/temp1/t1.frm \

              /mysql/data/temp2/g1.frm --port=3310 --user=joeuser

              # Read all of the .frm files in a particular folder using the diagnostic # mode.

              $ mysqlfrm --diagnostic /mysql/data/database1

       Helpful Hints -------------

              - Tables with certain storage engines cannot be read in the default mode.

              These include PARTITION, PERFORMANCE_SCHEMA. You must read these with the --diagnostic mode.

              - Use the --diagnostic mode for tables that fail to open correctly

              in the default mode or if there is no server installed on the host.

              - To change the storage engine in the CREATE statement generated for all

              .frm files read, use the --new-storage-engine option

              - To turn off all messages except the CREATE statement and warnings or

              errors, use the --quiet option.

              - Use the --show-stats option to see file statistics for each .frm file.

              - If you encounter connection or similar errors when running in default

              mode, re-run the command with the --verbosity option and view the output from the spawned server and repair any errors in  launching
              the server. If mysqlfrm fails in the middle, you may need to manually shutdown the server on the port specified with --port.

              - If the spawned server takes more than 10 seconds to start, use the

       --start-timeout option to increase the timeout to wait for the

              spawned server to start.

              - If you need to run the utility with elevated privileges, use the --user

              option to execute the spawned server using a normal user account.

              - You can specify the database name to be used in the resulting CREATE

              statement  by  prepending  the .frm file with the name of the database followed by a colon. For example, oltp:t1.frm will use 'oltp'
              for the database  name  in  the  CREATE  statement.  The  optional  database  name  can  also  be  used  with  paths.  For  example,
              /home/me/oltp:t1.frm  will use 'oltp' as the database name. If you leave off the optional database name and include a path, the last
              folder will be the database name.  For example /home/me/data1/t1.frm will use 'data1' as the database name. If you do  not  want  to
              use  the  last  folder  as the database name, simply specify the colon like this: /home/me/data1/:t1.frm. In this case, the database
              will be omitted from the CREATE statement.

       Enjoy!

mysqlfrm                                                          September 2013                                                       MYSQLFRM(1)
