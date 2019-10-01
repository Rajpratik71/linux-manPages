ipa-restore(1)                                                                                 IPA Manual Pages                                                                                ipa-restore(1)



NAME
       ipa-restore - Restore an IPA master

SYNOPSIS
       ipa-restore [OPTION]... BACKUP

DESCRIPTION
       Only  the name of the backup needs to be passed in, not the full path. Backups are stored in a subdirectory in /var/lib/ipa/backup. If a backup is in another location then the full path must be pro‐
       vided.

       The naming convention for full backups is ipa-full-YEAR-MM-DD-HH-MM-SS in the GMT time zone.

       The naming convention for data backups is ipa-data-YEAR-MM-DD-HH-MM-SS In the GMT time zone.

       The type of backup is automatically detected. A data restore can be done from either type.

       WARNING: A full restore will restore files like /etc/passwd, /etc/group, /etc/resolv.conf as well. Any file that IPA may have touched is backed up and restored.

       An encrypted backup is also automatically detected and the root keyring is used by default. The --keyring option can be used to define the full path to the private and public keys.

       Within the subdirectory is file, header, that describes the back up including the type, system, date of backup, the version of IPA, the version of the backup and the services on the master.

       A backup can not be restored on another host.

       A backup can not be restored in a different version of IPA.

       Restoring from backup sets the server as the new data master. All other masters will need to be re-initialized. The first step in restoring a backup is to disable replication on all the  other  mas‐
       ters. This is to prevent the changelog from overwriting the data in the backup.

       Use the ipa-replica-manage and ipa-csreplica-manage commands to re-initialize other masters. ipa-csreplica-manage only needs to be executed on masters that have a CA installed.

REPLICATION
       The  restoration  on  other  masters  needs  to be done carefully, to match the replication topology, working outward from the restored master. For example, if your topology is A <-> B <-> C and you
       restored master A you would restore B first, then C.

       Replication is disabled on all masters that are available when a restoration is done. If a master is down at the time of the restoration you will need to proceed with extreme caution. If this master
       is  brought  back  up  after the restoration is complete it may send out replication updates that apply the very changes you were trying to back out. The only safe answer is to reinstall the master.
       This would involve deleting all replication agreements to the master. This could have a cascading effect if the master is a hub to other masters. They would need to be  connected  to  other  masters
       before removing the downed master.

       If  the restore point is from a period prior to a replication agreement then the master will need to be re-installed. For example, you have masters A and B and you create a backup. You then add mas‐
       ter C from B. Then you restore from the backup. The restored data is going to lose the replication agreement to C. The master on C will have a replication agreement pointing to B, but B  won't  have
       the reverse agreement. Master C won't be registered as an IPA master. It may be possible to manually correct these and re-connect C to B but it would be very prone to error.

       If  re-initializing  on an IPA master version prior to 3.2 then the replication agreements will need to be manually re-enabled otherwise the re-initialization will never complete. To manually enable
       an agreement use ldapsearch to find the agreement name in cn=mapping tree,cn=config. The value of nsds5ReplicaEnabled needs to be on, and enabled on both sides. Remember that CA replication is  done
       through a separate agreement and will need to be updated separately.

       If you have older masters you should consider re-creating them rather than trying to re-initialize them.

OPTIONS
       -p, --password=PASSWORD
              The Directory Manager password.

       --data Restore the data only. The default is to restore everything in the backup.

       --gpg-keyring=GPG_KEYRING
              The full path to a GPG keyring. The keyring consists of two files, a public and a private key (.sec and .pub respectively). Specify the path without an extension.

       --no-logs
              Exclude the IPA service log files in the backup (if they were backed up).

       --online
              Perform the restore on-line. Requires data-only backup or the --data option.

       --instance=INSTANCE
              Restore  only  the  databases  in this 389-ds instance. The default is to restore all found (at most this is the IPA REALM instance and the PKI-IPA instance). Requires data-only backup or the
              --data option.

       --backend=BACKEND
              The backend to restore within an instance or instances. Requires data-only backup or the --data option.

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

FILES
       /var/lib/ipa/backup
           The default directory for storing backup files.

       /var/log/iparestore.log
           The log file for restoration

SEE ALSO
       ipa-backup(1).



IPA                                                                                              Mar 22 2013                                                                                   ipa-restore(1)
