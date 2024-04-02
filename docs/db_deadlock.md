DB_DEADLOCK(1)                                                                               BerkeleyDB Utilities                                                                              DB_DEADLOCK(1)



NAME
       db_deadlock - Detect deadlocks and abort lock requests

SYNOPSIS
       db_deadlock [-Vv] [-a e | m | n | o | W | w | y ] [-h home] [-L file] [-t sec.usec]

DESCRIPTION
       The  db_deadlock  utility traverses the database environment lock region, and aborts a lock request each time it detects a deadlock or a lock request that has timed out. By default, in the case of a
       deadlock, a random lock request is chosen to be aborted.

       This utility should be run as a background daemon, or the underlying Berkeley DB deadlock detection interfaces should be called in some other way, whenever there are multiple  threads  or  processes
       accessing a database and at least one of them is modifying it.

OPTIONS
       -a     When a deadlock is detected, abort the locker:

              m      with the most locks

              n      with the fewest locks

              o      with the oldest lock

              W      with the most write locks

              w      with the fewest write locks

              y      with the youngest lock

              e      When  lock  or  transaction timeouts have been specified, abort any lock request that has timed out. Note that this option does not perform the entire deadlock detection algorithm, but
                     instead only checks for timeouts.

       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -L file
              Log the execution of the db_deadlock utility to the specified file in the following format, where ### is the process ID, and the date is the time the utility was started.

              db_deadlock: ### Wed Jun 15 01:23:45 EDT 1995

              This file will be removed if the db_deadlock utility exits gracefully.

       -t sec.usec
              Check the database environment every sec seconds plus usec microseconds to see if a process has been forced to wait for a lock; if one has, review the database environment lock structures.

       -V     Write the library version number to the standard output, and exit.

       -v     Run in verbose mode, generating messages each time the detector runs.

       If the -t option is not specified, db_deadlock will run once and exit.

       The db_deadlock utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory containing a Berkeley DB envi‐
       ronment).   In order to avoid environment corruption when using a Berkeley DB environment, db_deadlock should always be given the chance to detach from the environment and exit gracefully.  To cause
       db_deadlock to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

       The db_deadlock utility does not attempt to create the Berkeley DB shared memory regions if they do not already exist.  The application which creates the region should be started  first,  and  then,
       once the region is created, the db_deadlock utility should be started.

       The DB_ENV->lock_detect method is the underlying method used by the db_deadlock utility. See the db_deadlock utility source code for an example of using DB_ENV->lock_detect in a IEEE/ANSI Std 1003.1
       (POSIX) environment.

EXIT STATUS
       The db_deadlock utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                DB_DEADLOCK(1)
