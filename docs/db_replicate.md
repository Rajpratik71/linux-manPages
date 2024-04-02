DB_REPLICATE(1)                                                                              BerkeleyDB Utilities                                                                             DB_REPLICATE(1)



NAME
       db_replicate - Provide replication services

SYNOPSIS
       db_replicate [-MVv] [-h home] [-L file] [-P password] [-T num-threads] [-t secs]

DESCRIPTION
       The  db_replicate  utility is a daemon process that provides replication/HA services on a transactional environment. This utility enables you to upgrade an existing Transactional Data Store applica‐
       tion to an HA application with minor modifications.

OPTIONS
       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -L file
              Log the execution of the db_replicate utility to the specified file in the following format, where ### is the process ID, and the date is the time the utility was started.

              db_replicate: ### Wed Jun 15 01:23:45 EDT 1995

              Additionally, events such as site role changes will be noted in the log file.  This file will be removed if the db_replicate utility exits gracefully.

       -M     Start the db_replicate utility to be the master site of the replication group.  Otherwise, the site will be started as a client replica.

       -P password
              Specify an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where  unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -T num-threads
              Specify the number of replication message processing threads.

       -t secs
              Specify how often (in seconds) the utility will check for program interruption and resend the last log record.

       -V     Write the library version number to the standard output, and exit.

       -v     Turn on replication verbose messages.  These messages will be written to the standard output and will be quite voluminous.

       The  db_replicate utility does not attempt to create the Berkeley DB shared memory regions if they do not already exist. The application that creates the region should be started first, and once the
       region is created, the db_replicate utility should be started.  The application must use the DB_INIT_REP and DB_THREAD flags when creating the environment.

       The db_replicate utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a  directory  containing  a  Berkeley  DB
       environment).   In  order to avoid environment corruption when using a Berkeley DB environment, db_replicate should always be given the chance to detach from the environment and exit gracefully.  To
       cause db_replicate to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_replicate utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

NOTES
       This utility is not supported for use with the DB SQL APIs.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                               DB_REPLICATE(1)
