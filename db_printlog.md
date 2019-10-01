DB_PRINTLOG(1)                                                                               BerkeleyDB Utilities                                                                              DB_PRINTLOG(1)



NAME
       db_printlog - Dumps log files into a human-readable format

SYNOPSIS
       db_printlog [-NrV] [-b start-LSN] [-e stop-LSN] [-h home] [-P password]

DESCRIPTION
       The db_printlog utility is a debugging utility that dumps Berkeley DB log files in a human-readable format.

OPTIONS
       -b start-LSN
              Display  log  records starting at log sequence number (LSN) start-LSN; start-LSN is specified as a file number, followed by a slash (/) character, followed by an offset number, with no inter‐
              vening whitespace.

       -e stop-LSN
              Stop displaying log records at log sequence number (LSN) stop-LSN; stop-LSN is specified as a file number, followed by a slash (/) character, followed by an offset number, with no intervening
              whitespace.

       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -N     Do  not  acquire  shared  region  mutexes while running.  Other problems, such as potentially fatal errors in Berkeley DB, will be ignored as well.  This option is intended only for debugging
              errors, and should not be used under any other circumstances.

       -P password
              Specify an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where  unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -r     Read the log files in reverse order.

       -V     Write the library version number to the standard output, and exit.

       The db_printlog utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory containing a Berkeley DB envi‐
       ronment).  In order to avoid environment corruption when using a Berkeley DB environment, db_printlog should always be given the chance to detach from the environment and exit gracefully.  To  cause
       db_printlog to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_printlog utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

NOTES
       If the application(s) that use the environment make use of the DB_ENV->set_lg_dir method, then in order for this utility to run correctly, you need a DB_CONFIG file which sets the proper paths using
       the set_lg_dir configuration parameter.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_recover(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                DB_PRINTLOG(1)
