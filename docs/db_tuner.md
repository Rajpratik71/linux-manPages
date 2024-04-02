DB_TUNER(1)                                                                                  BerkeleyDB Utilities                                                                                 DB_TUNER(1)



NAME
       db_tuner - analyze and tune btree database

SYNOPSIS
       db_tuner [-c cachesize] -d file [-h home] [-s database] [-v]

DESCRIPTION
       The db_tuner utility analyzes the data in a btree database, and suggests a page size that is likely to deliver optimal operation.

OPTIONS
       -c cachesize
              Specify a value of the cachesize, otherwise, the default value will be set.

       -d file
              Display  database  statistics for the specified file. If the database contains multiple databases and the -s flag is not specified, the statistics are for the internal database that describes
              the other databases the file contains, and not for the file as a whole.

       -h home
              Specify a home directory for the database environment.

       -s database
              Display page size recommendation for the specified database contained in the file specified with the -d flag.

       -v     Display verbose information.

NOTES
       The db_tuner utility assumes that databases are compacted when analysing the data.  The analysis is based on a static view of the data and the data access and  update  patterns  are  not  take  into
       account.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_stat(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                   DB_TUNER(1)
