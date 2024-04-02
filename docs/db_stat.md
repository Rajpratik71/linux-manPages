DB_STAT(1)                                                                                   BerkeleyDB Utilities                                                                                  DB_STAT(1)



NAME
       db_stat - Display environment statistics

SYNOPSIS
       db_stat -d file [-fN] [-h home] [-P password] [-s database]

       db_stat [-cEelmNrtVxZ] [-C Aclop] [-h home] [-L A] [-M Ah] [-R A] [-P password]

DESCRIPTION
       The db_stat utility displays statistics for Berkeley DB environments.

OPTIONS
       -C     Display internal information about the locking subsystem.  (The output from this option is often both voluminous and meaningless, and is intended only for debugging.)

              A      Display all information.

              c      Display lock conflict matrix.

              l      Display lockers within hash chains.

              o      Display lock objects within hash chains.

              p      Display locking subsystem parameters.

       -c     Display locking subsystem statistics, as described in DB_ENV->lock_stat.

       -d     Display database statistics for the specified file, as described in DB->stat.

              If  the  database  contains multiple databases and the -s flag is not specified, the statistics are for the internal database that describes the other databases the file contains, and not for
              the file as a whole.

       -E     Display internal information about the database environment, including all configured subsystems of the database environment.  (The output from this option is often both voluminous and  mean‐
              ingless, and is intended only for debugging.)

       -e     Display information about the database environment, including all configured subsystems of the database environment.

       -f     Display only those database statistics that can be acquired without traversing the database.

       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -l     Display logging subsystem statistics, as described in DB_ENV->log_stat.

       -L     Display all logging subsystem statistics.

              A      Display all information.

       -M     Display internal information about the cache.  (The output from this option is often both voluminous and meaningless, and is intended only for debugging.)

              A      Display all information.

              h      Display buffers within hash chains.

       -m     Display cache statistics, as described in DB_ENV->memp_stat.

       -N     Do  not  acquire  shared  region  mutexes while running.  Other problems, such as potentially fatal errors in Berkeley DB, will be ignored as well.  This option is intended only for debugging
              errors, and should not be used under any other circumstances.

       -P password
              Specify an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where  unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -R     Display internal information about the replication subsystem.  (The output from this option is often both voluminous and meaningless, and is intended only for debugging.)

              A      Display all information.

       -r     Display replication statistics, as described in DB_ENV->rep_stat.

       -s database
              Display statistics for the specified database contained in the file specified with the -d flag.

       -t     Display transaction subsystem statistics, as described in DB_ENV->txn_stat.

       -V     Write the library version number to the standard output, and exit.

       -x     Display mutex subsystem statistics, as described in the DB_ENV->mutex_stat method.

       -Z     Reset the statistics after reporting them; valid only with the -C, -c, -E, -e, -L, -l, -M, -m, -R, -r, and -t options.

       Values  normally displayed in quantities of bytes are displayed as a combination of gigabytes (GB), megabytes (MB), kilobytes (KB), and bytes (B).  Otherwise, values smaller than 10 million are dis‐
       played without any special notation, and values larger than 10 million are displayed as a number followed by "M".

       The db_stat utility may be used with a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory containing a  Berkeley
       DB  environment).   In  order  to avoid environment corruption when using a Berkeley DB environment, db_stat should always be given the chance to detach from the environment and exit gracefully.  To
       cause db_stat to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_stat utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                    DB_STAT(1)
