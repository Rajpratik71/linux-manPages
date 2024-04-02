DB_DUMP(1)                                                                                   BerkeleyDB Utilities                                                                                  DB_DUMP(1)



NAME
       db_dump - Write database file using flat-text format

SYNOPSIS
       db_dump [-klNpRrV] [-d ahr] [-f output] [-h home] [-P password] [-s database] file

       db_dump [-kNpV] [-d ahr] [-f output] [-h home] -m database

       db_dump185 [-p] [-f output] file

DESCRIPTION
       The db_dump utility reads the database file and writes it to the standard output using a portable flat-text format understood by the db_load utility.  The file argument must be a file produced using
       the Berkeley DB library functions.  The db_dump185 utility is similar to the db_dump utility, except that it reads databases in the format used by Berkeley DB versions 1.85 and 1.86.

OPTIONS
       -d     Dump the specified database in a format helpful for debugging the Berkeley DB library routines.

              a      Display all information.

              h      Display only page headers.

              r      Do not display the free-list or pages on the free list.  This mode is used by the recovery tests.

              The output format of the -d option is not standard and may change, without notice, between releases of the Berkeley DB library.

       -f output
              Write to the specified output file instead of to the standard output.

       -h home
              Specify a home directory for the database environment; by default, the current working directory is used.

       -k     Dump record numbers from Queue and Recno databases as keys.

       -l     List the databases stored in the file.

       -N     Do not acquire shared region mutexes while running.  Other problems, such as potentially fatal errors in Berkeley DB, will be ignored as well.  This option  is  intended  only  for  debugging
              errors, and should not be used under any other circumstances.

       -P password
              Specify  an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -p     If characters in either the key or data items are printing characters (as defined by isprint(3)), use printing characters in file to represent them.  This option permits users to use standard
              text editors and tools to modify the contents of databases.

              Note: different systems may have different notions about what characters are considered printing characters, and databases dumped in this manner may be less portable to external systems.

       -R     Aggressively  salvage  data  from a possibly corrupt file.  The -R flag differs from the -r option in that it will return all possible data from the file at the risk of also returning already
              deleted or otherwise nonsensical items.  Data dumped in this fashion will almost certainly have to be edited by hand or other means before the data is ready for reload into another database

       -r     Salvage data from a possibly corrupt file.  When used on a uncorrupted database, this option should return equivalent data to a normal dump, but most likely in a different order.

       -s database
              Specify a single database to dump.  If no database is specified, all databases in the database file are dumped.

       -V     Write the library version number to the standard output, and exit.

       Dumping and reloading Hash databases that use user-defined hash functions will result in new databases that use the default hash function.  Although using the default hash function may not be  opti‐
       mal for the new database, it will continue to work correctly.

       Dumping  and  reloading  Btree  databases that use user-defined prefix or comparison functions will result in new databases that use the default prefix and comparison functions.  In this case, it is
       quite likely that the database will be damaged beyond repair permitting neither record storage or retrieval.

       The only available workaround for either case is to modify the sources for the db_load utility to load the database using the correct hash, prefix, and comparison functions.

       The db_dump utility output format is documented in the Dump Output Formats section of the Berkeley DB Reference Guide.

       The db_dump utility may be used with a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a directory containing a  Berkeley
       DB  environment).   In  order  to avoid environment corruption when using a Berkeley DB environment, db_dump should always be given the chance to detach from the environment and exit gracefully.  To
       cause db_dump to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

       Even when using a Berkeley DB database environment, the db_dump utility does not use any kind of database locking if it is invoked with the -d, -R, or -r arguments.   If used with one of these argu‐
       ments, the db_dump utility may only be safely run on databases that are not being modified by any other process; otherwise, the output may be corrupt.

EXIT STATUS
       The db_dump utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_hotbackup(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                                    DB_DUMP(1)
