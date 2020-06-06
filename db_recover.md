DB_RECOVER(1)                                                                                BerkeleyDB Utilities                                                                               DB_RECOVER(1)



NAME
       db_recover - Recover the database to a consistent state

SYNOPSIS
       db_recover [-cefVv] [-h home] [-P password] [-t [[CC]YY]MMDDhhmm[.SS]]]

DESCRIPTION
       The  db_recover utility must be run after an unexpected application, Berkeley DB, or system failure to restore the database to a consistent state. All committed transactions are guaranteed to appear
       after db_recover has run, and all uncommitted transactions will be completely undone.

       Note that this utility performs the same action as if the environment is opened with the DB_RECOVER flag.  If DB_RECOVER is specified on environment open, then use of this utility is not necessary.

OPTIONS
       -c     Perform catastrophic recovery instead of normal recovery.

       -e     Retain the environment after running recovery.  This option will rarely be used unless a DB_CONFIG file is present in the home directory.  If a DB_CONFIG file is not present, then the regions
              will be created with default parameter values.

       -f     Display a message on the standard output showing the percent of recovery completed.

       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -P password
              Specify  an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -t     Recover to the time specified rather than to the most current possible date.  The timestamp argument should be in the form [[CC]YY]MMDDhhmm[.SS] where each pair of letters represents the fol‐
              lowing:

              CC     The first two digits of the year (the century).

              YY     The second two digits of the year.  If "YY" is specified, but "CC" is not, a value for "YY" between 69 and 99 results in a "CC" value of 19.  Otherwise, a "YY" value of 20 is used.

              MM     The month of the year, from 1 to 12.

              DD     The day of the month, from 1 to 31.

              hh     The hour of the day, from 0 to 23.

              mm     The minute of the hour, from 0 to 59.

              SS     The second of the minute, from 0 to 61.

              If the "CC" and "YY" letter pairs are not specified, the values default to the current year.  If the "SS" letter pair is not specified, the value defaults to 0.

       -V     Write the library version number to the standard output, and exit.

       -v     Run in verbose mode.

       In  the case of catastrophic recovery, an archival copy - or snapshot - of all database files must be restored along with all of the log files written since the database file snapshot was made.  (If
       disk space is a problem, log files may be referenced by symbolic links).

       If the failure was not catastrophic, the files present on the system at the time of failure are sufficient to perform recovery.

       If log files are missing, db_recover will identify the missing log file(s) and fail, in which case the missing log files need to be restored and recovery performed again.

       The db_recover utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory containing a Berkeley DB  envi‐
       ronment).   In  order to avoid environment corruption when using a Berkeley DB environment, db_recover should always be given the chance to detach from the environment and exit gracefully.  To cause
       db_recover to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_recover utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

NOTES
       If the application(s) that use the environment make use of any of the following methods:

       DB_ENV->add_data_dir

       DB_ENV->set_data_dir

       DB_ENV->set_lg_dir

       then in order for this utility to run correctly, you need a DB_CONFIG file which sets the proper paths using the add_data_dir, or set_lg_dir configuration parameters.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                 DB_RECOVER(1)
