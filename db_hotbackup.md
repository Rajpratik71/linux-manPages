DB_HOTBACKUP(1)                                                                              BerkeleyDB Utilities                                                                             DB_HOTBACKUP(1)



NAME
       db_hotbackup - Create "hot backup" or "hot failover" snapshots

SYNOPSIS
       db_hotbackup [-cDEguVv] [-d data_dir ...] [-h home] [-l log_dir] [-P password] -b backup_dir

DESCRIPTION
       The db_hotbackup utility creates "hot backup" or "hot failover" snapshots of Berkeley DB database environments.

       The db_hotbackup utility performs the following steps:

              1. Sets the DB_HOTBACKUP_IN_PROGRESS flag in the home database environment.

              2. If the -c option is specified, checkpoint the source home database environment, and remove any unnecessary log files.

              3. If the target directory for the backup does not exist, it is created with mode read-write-execute for the owner.

                 If  the  target directory for the backup does exist and the -u option was specified, all log files in the target directory are removed; if the -u option was not specified, all files in the
                 target directory are removed.

              4. If the -u option was not specified, copy application-specific files found in the database environment home directory, or any directory specified using the -d option, into the target direc‐
                 tory for the backup.

              5. Copy  all  log  files  found  in  the directory specified by the -l option (or in the database environment home directory, if no -l option was specified), into the target directory for the
                 backup.

              6. Perform catastrophic recovery on the hot backup.

              7. Remove any unnecessary log files from the hot backup.

              8. Reset the DB_HOTBACKUP_IN_PROGRESS flag in the environment.

       The db_hotbackup utility does not resolve pending transactions that are in the prepared state. Applications that use DB_TXN->prepare should specify DB_RECOVER_FATAL when opening the environment, and
       run DB_ENV->txn_recover to resolve any pending transactions, when failing over to the hot backup.

OPTIONS
       -b backup_dir
              Specify the target directory for the backup.

       -c     Before  performing  the  snapshot,  checkpoint  the source database environment and remove any log files that are no longer required in that environment.  To avoid making catastrophic failure
              impossible, log file removal must be integrated with log file archival.

              Care should be taken with the -c option, where the db_hotbackup MUST be run by the same user that owns the database. If db_hotbackup is run by a user different to the owner of the database, a
              new log file owned by this user might be created, making it impossible to use the database for its owner.

       -D     Use the data and log directories listed in a DB_CONFIG configuration file in the source directory. This option has four effects:

              1. The specified data and log directories will be created relative to the target directory, with mode read-write-execute owner, if they do not already exist.

              2. In step #3 above, all files in any source data directories specified in the DB_CONFIG file will be copied to the target data directories.

              3. In step #4 above, log files will be copied from any log directory specified in the DB_CONFIG file, instead of from the default locations.

              4. The DB_CONFIG configuration file will be copied from the source directory to the target directory, and subsequently used for configuration if recovery is run in the target directory.

              Care  should  be  taken  with  the -D option where data and log directories are named relative to the source directory but are not subdirectories (that is, the name includes the element "..")
              Specifically, the constructed target directory names must be meaningful and distinct from the source directory names, otherwise running recovery in the  target  directory  might  corrupt  the
              source data files.

              It is an error to use absolute pathnames for data or log directories in this mode, as the DB_CONFIG configuration file copied into the target directory would then point at the source directo‐
              ries and running recovery would corrupt the source data files.

       -d data_dir
              Specify one or more source directories that contain databases; if none is specified, the database environment home directory will be searched for database files.  As database files are copied
              into a single backup directory, files named the same, stored in different source directories, could overwrite each other when copied into the backup directory.

       -F     Directly  copy from the filesystem. This option can CORRUPT the backup if used while the environment is active and the operating system does not support atomic file system reads.  This option
              is known to be safe only on UNIX systems, not Linux or Windows systems.

       -h home
              Specify the source directory for the backup, that is, the database environment home directory.

       -l log_dir
              Specify a source directory that contains log files; if none is specified, the database environment home directory will be searched for log files.

       -P password
              Specify an environment password.  Although Berkeley DB utilities overwrite password strings as soon as possible, be aware there may be a window of vulnerability on systems where  unprivileged
              users can see command-line arguments or where utilities are not able to overwrite the memory containing the command-line arguments.

       -u     Update a pre-existing hot backup snapshot by copying in new log files.  If the -u option is specified, no databases will be copied into the target directory.

       -V     Write the library version number to the standard output, and exit.

       -v     Run in verbose mode, listing operations as they are done.

       -D     Use  the data directories listed in the DB_CONFIG configuration file in the source directory.   This option has three effects: First, if they do not already exist, the specified data directo‐
              ries will be created relative to the target directory (with mode read-write-execute owner). Second, all files in the source data directories will be copied to the target data directories.  If
              the  DB_CONFIG  file specifies one or more absolute pathnames, files in those source directories will be copied to the top-level target directory. Third, the DB_CONFIG configuration file will
              be copied from the +source directory to the target directory, and subsequently used for configuration if recovery is run in the target directory.

       Care should be taken with the -D option and data directories which are named relative to the source directory but are not subdirectories (that is, the name includes the element "..")   Specifically,
       the constructed target directory names must be meaningful and distinct from the source directory names, otherwise running recovery in the target directory might corrupt the source data files.

       It  is  an error to use absolute pathnames for data directories or the log directory in this mode, as the DB_CONFIG configuration file copied into the target directory would then point at the source
       directories and running recovery would corrupt the source data files.

       The db_hotbackup utility uses a Berkeley DB environment (as described for the -h option, the environment variable DB_HOME, or because the utility was run in a  directory  containing  a  Berkeley  DB
       environment).   In  order to avoid environment corruption when using a Berkeley DB environment, db_hotbackup should always be given the chance to detach from the environment and exit gracefully.  To
       cause db_hotbackup to release all environment resources and exit cleanly, send it an interrupt signal (SIGINT).

EXIT STATUS
       The db_hotbackup utility exits 0 on success, and >0 if an error occurs.

ENVIRONMENT
       DB_HOME
              If the -h option is not specified and the environment variable DB_HOME is set, it is used as the path of the database home, as described in DB_ENV->open.

SEE ALSO
       db_archive(1) db_checkpoint(1) db_deadlock(1) db_dump(1) db_log_verify(1) db_load(1) db_printlog(1) db_recover(1) db_replicate(1) db_stat(1) db_tuner(1) db_upgrade(1) db_verify(1)



BerkeleyDB 5.3.21                                                                              06 December 2016                                                                               DB_HOTBACKUP(1)
