ipa-backup(1)                                                                                  IPA Manual Pages                                                                                 ipa-backup(1)



NAME
       ipa-backup - Back up an IPA master

SYNOPSIS
       ipa-backup [OPTION]...

DESCRIPTION
       Two kinds of backups: full and data-only.

       The back up is optionally encrypted using either the default root GPG key or a named key. No passphrase is supported.

       Backups are stored in a subdirectory in /var/lib/ipa/backup.

       The naming convention for full backups is ipa-full-YEAR-MM-DD-HH-MM-SS in the GMT time zone.

       The naming convention for data backups is ipa-data-YEAR-MM-DD-HH-MM-SS In the GMT time zone.

       Within the subdirectory is file, header, that describes the back up including the type, system, date of backup, the version of IPA, the version of the backup and the services on the master.

       A backup can not be restored on another host.

       A backup can not be restored in a different version of IPA.

OPTIONS
       --data Back up data only. The default is to back up all IPA files plus data.

       --gpg  Encrypt the back up file.

       --gpg-keyring=GPG_KEYRING
              The full path to a GPG keyring. The keyring consists of two files, a public and a private key (.sec and .pub respectively). Specify the path without an extension.

       --logs Include the IPA service log files in the backup.

       --online
              Perform the backup on-line. Requires the --data option.

       --v, --verbose
              Print debugging information

       -d, --debug
              Alias for --verbose

       -q, --quiet
              Output only errors

       --log-file=FILE
              Log to the given file

EXIT STATUS
       0 if the command was successful

       1 if an error occurred

       2 if IPA is not configured

FILES
       /var/lib/ipa/backup
           The default directory for storing backup files.

       /var/log/ipabackup.log
           The log file for backups

SEE ALSO
       ipa-restore(1).



IPA                                                                                              Mar 22 2013                                                                                    ipa-backup(1)
