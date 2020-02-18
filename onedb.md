ONEDB(1)     onedb(1) -- OpenNebula database migration tool     ONEDB(1)

NAME
       onedb - OpenNebula database migration tool

       This  command enables the user to manage the OpenNebula database.
       It provides information about the DB version, means to upgrade it
       to the latest version, and backup tools.

OPTIONS
        -f, --force               Forces the backup even if the DB exists
        -b, --backup file         Use this file to store SQL dump
        --slave-server host       Slave MySQL server hostname or IP. Defaults to
                                  localhost
        --slave-port port         Slave MySQL server port. Defaults to 3306
        --slave-username user     Slave MySQL username
        --slave-password pass     Slave MySQL password. Leave unset to be prompted
                                  for it
        --slave-dbname dbname     Slave MySQL DB name for OpenNebula
        --slave-backup file       Use this file to store SQL dump
        -v, --verbose             Verbose mode
        -h, --help                Show this message
        -V, --version             Show version and copyright information
        -s, --sqlite file         SQLite DB file
        -S, --server host         MySQL server hostname or IP. Defaults to
                                  localhost
        -P, --port port           MySQL server port. Defaults to 3306
        -u, --username user       MySQL username
        -p, --password pass       MySQL password. Leave unset to be prompted for it
        -d, --dbname dbname       MySQL DB name for OpenNebula

COMMANDS
       ·   backup  [output_file] Dumps the DB to a file specified in the
           argument valid options: force

       ·   version Prints the current DB version. Use  -v  flag  to  see
           also OpenNebula version

       ·   history Prints the upgrades history

       ·   restore  [backup_file]  Restores  the  DB from a backup file.
           Only restores backups generated from the same backend (SQLite
           or MySQL) valid options: force

       ·   upgrade [version] Upgrades the DB to the latest version where
           version : DB version (e.g. 1, 3) to upgrade. By  default  the
           DB  is  upgraded  to the latest version valid options: force,
           backup

       ·   fsck Checks the consistency of the DB, and fixes the problems
           found valid options: force, backup

       ·   import-slave  Imports  an  existing federation slave into the
           federation master  database  valid  options:  force,  backup,
           slave-server,   slave-port,  slave-username,  slave-password,
           slave-dbname, slave-backup

ARGUMENT FORMATS
       ·   file Path to a file

       ·   range List of id´s in the form 1,8..15

       ·   text String

                               March 2015                       ONEDB(1)
