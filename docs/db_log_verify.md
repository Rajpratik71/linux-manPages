DB_LOG_VERIFY(1)                                                                             BerkeleyDB Utilities                                                                            DB_LOG_VERIFY(1)



NAME
       db_log_verify - Verify log files of a database environment

SYNOPSIS
       db_log_verify [-cNvV] [-h home-to-verify] [-H temporary-home] [-P password] [-C cache-size] [-b start-lsn] [-e end-lsn] [-s start-time] [-z end-time] [-d database-filename] [-D database-name]

DESCRIPTION
       The db_log_verify utility verifies the log files of a specific database environment.  This utility verifies a specific range of log records, or changed log records of a specific database.

OPTIONS
       -C cache-size
              Specify the cache size (in megabytes) of the temporary database environment internally used during the log verification.

       -b start-lsn
              Specify the starting log record (by lsn) to verify.

       -c     Specify whether to continue the verification after an error is detected.  If not specified, the verification stops when the first error is detected.

       -D database-name
              Specify a database name. Only log records related to this database are verified.

       -d database-filename
              Specify a database file name. Only log records related this database file are verified.

       -e end-lsn
              Specify the ending log record by lsn.

       -h home-to-verify
              Specify a home directory of the database environment whose log is to be verified.

       -H temporary-home
              Specify a home directory for this utility to create a temporarily database environment to store runtime data during the verification.

              It  is  an  error to specify the same directory as the -h option. If this directory is not specified, all temporary databases created during the verification will be in-memory, which is not a
              problem if the log files to verify are not huge.

       -N     Do not acquire shared region mutexes while running. Other problems, such as potentially fatal errors in Berkeley DB, are ignored as well. This option is intended only  for  debugging  errors,
              and should not be used under any other circumstances.

       -P password
              Specify  an environment password. Although Berkeley DB utilities overwrite password strings as soon as possible, there may be a window of vulnerability on systems where unprivileged users can
              see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -s start-time
              Specify the starting log record by time. The time range specified is not precise because the lsn of the most recent time point is used as the starting lsn.

       -V     Write the library version number to the standard output and exit.

       -v     Enable verbose mode to display verbose output during the verification process.

       -z end-time
              Specify the ending log record by time. The time range specified is not precise because the lsn of the most recent time point is used as the ending lsn.

       To specify a range of log records, you must provide either an lsn range or a time range.  You can neither specify both nor specify an lsn and a time as a range.

       If the log footprint is over several megabytes, specify a home directory and a big cache size for log verification internal use. Else, the process' private memory may be exhausted before the verifi‐
       cation completes.

       The  db_log_verify utility does not perform the locking function, even in Berkeley DB environments that are configured with a locking subsystem.  All errors are written to stderr, and all normal and
       verbose messages are written to stdout.

       The db_log_verify utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory  containing  a  Berkeley  DB
       environment).   In order to avoid environment corruption when using a Berkeley DB environment, db_log_verify should always be given the chance to detach from the environment and exit gracefully.  To
       cause db_log_verify to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_log_verify utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

NOTES
       If the application(s) that use the environment make use of the DB_ENV->set_lg_dir method, then in order for this utility to run correctly, you need a DB_CONFIG file which sets the proper paths using
       the set_lg_dir configuration parameter.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                              DB_LOG_VERIFY(1)
