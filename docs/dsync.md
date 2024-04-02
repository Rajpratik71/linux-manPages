DOVEADM-SYNC(1)                                                                                    Dovecot                                                                                    DOVEADM-SYNC(1)



NAME
       doveadm-sync - Dovecot's two-way mailbox synchronization utility
       doveadm-backup - Dovecot's one-way mailbox synchronization utility

SYNOPSIS
       doveadm  [-Dv]  sync  [-u user|-A|-F file] [-S socket_path] [-1fPRU] [-l secs] [-r rawlog_path] [-m mailbox] [-g mailbox_guid] [-n namespace|-N] [-x exclude] [-s state] [-T secs] [-t start date] [-e
       end date] -d|destination

       doveadm [-Dv] backup [-u user|-A|-F file] [-S socket_path] [-fPRU] [-l secs] [-r rawlog_path] [-m mailbox] [-g mailbox_guid] [-n namespace|-N] [-x exclude] [-s state] [-T secs] [-t start  date]  [-e
       end date] -d|destination

DESCRIPTION
       dsync  is  Dovecot's  mailbox synchronization utility.  It can be used for several different use cases: Two-way synchronization of mailboxes, creating backups of mails, and convert mailboxes from/to
       different mailbox formats.  All of these can be used within the same server or between different servers (via ssh(1) or tcp connections).  Remote mailboxes can be accessed also  via  IMAP  protocol,
       which allows using dsync for mailbox migration purposes.

       You can run dsync in one of three modes:

              ·      doveadm backup performs one-way synchronization.  If there are any changes in the destination they will be deleted, so the destination will look exactly like the source.

              ·      doveadm sync performs two-way synchronization.  It merges all changes without losing anything.  Both the mailboxes will end up looking identical after the synchronization is finished.

              ·      doveadm  sync -1 performs one-way synchronization, but it merges the changes in destination without deleting anything.  This doesn't currently work perfectly, so its use should be lim‐
                     ited.  Its main purpose is that during mailbox migration you can run doveadm backup multiple times, then switch mails to be delivered to the new mailbox and run doveadm  sync  -1  once
                     more to transfer any last new mails from the old mailbox.

                     The  one-way  algorithm is the same as two-way dsync algorithm except the source account is not modified. It fetches the message's GUID (Global UID), which is used to identify any con‐
                     flicting UIDs in messages. As long as the source and destination side has matching UID<->GUID mapping, those emails are assumed to be synced correctly. Only after  the  first  mismatch
                     will changes begin.

                     Example:  Source  mailbox  has  messages UID 1..5; source mailbox is sync'd using doveadm backup to the destination. Subsequently, UID 6 is delivered to the source mailbox and UID 1 is
                     expunged from the destination mailbox. In this example, UID 1 is kept removed (in destination) because UID 1..5 have identical Date+Message-ID headers. UID 6 is not seen in destination
                     so it's copied.

                     If  both source and destination have UID 6, but the messages are different, the headers don't match and both the messages are kept in the destination but they're given new UIDs 7 and 8
                     just to be sure any client didn't get confused about what UID 11 actually was. Thus, one-way sync begins to quickly diverge from the source mailbox  once  changes  start  to  occur  on
                     either side; one-way sync should therefore normally only be used within a short period of time after a doveadm backup or doveadm sync command was used to synchronize the mailboxes.

       There are also three different synchronization algorithms:

              ·      Full  synchronization  (-f parameter) scans through all the messages in all the mailboxes.  This guarantees that everything will be synchronized, but it's unnecessarily slow for incre‐
                     mental synchronization.

              ·      Fast synchronization (default) first attempts to find mailboxes that have changed, and synchronize only those.  This is done by checking the mailboxes' metadata (NEXTUID  and  HIGHEST‐
                     MODSEQ).   Usually this works fine, especially with one-way synchronization, but if both sides do exactly the same number of changes, the metadata may end up containing the same values
                     even if the changes were different.

              ·      Stateful synchronization (-s parameter) is the most efficient way to synchronize mailboxes.  It relies on having the earlier dsync run's state saved somewhere and being passed  to  the
                     next  dsync run.  Based on this state dsync can send only the changes that happened after the previous dsync run.  As long as the state or the mailboxes aren't corrupted this algorithm
                     should work perfectly.  The replicator process uses this internally to perform most of the synchronization.

       The syncing is done as perfectly as possible: an IMAP or a POP3 client shouldn't be able to notice any differences between the two mailboxes.  Two-way syncing means that it's safe to do any kind  of
       modifications  in  both  sides,  and  dsync  will merge the changes without losing any changes done on either side.  This is possible because dsync can access Dovecot's index logs that keep track of
       changes.  It's of course possible to have conflicts during merging, these are resolved in a safe way.  See the dsync design document for more information.

       dsync uses the same configuration files as the rest of Dovecot (via doveconf(1) binary).  The entire configuration can be changed by giving -c parameter to another configuration file,  or  using  -o
       parameter to override specific settings.  When executing a remote dsync program it works the same way: it uses its own local configuration.

       dsync can be run completely standalone.  It doesn't require any Dovecot server processes to be running, except when using -u parameter to do a userdb lookup from auth process.

       dsync  can  sync  either one or multiple users using the -u or -A parameters.  For continuous replication you can use the Dovecot replicator process, which automatically runs dsync whenever messages
       have changed.

OPTIONS
       Global doveadm(1) options:

       -D     Enables verbosity and debug messages.

       -o setting=value
              Overrides the configuration setting from /etc/dovecot/dovecot.conf and from the userdb with the given value.  In order to override multiple settings, the -o option may be  specified  multiple
              times.

       -v     Enables verbosity, including progress counter.

       Command specific options:

       -1     Do one-way synchronization instead of two-way synchronization.

       -A     If  the  -A  option is present, the command will be performed for all users.  Using this option in combination with system users from userdb { driver = passwd } is not recommended, because it
              contains also users with a lower UID than the one configured with the first_valid_uid setting.

              When the SQL userdb module is used make sure that the iterate_query setting in /etc/dovecot/dovecot-sql.conf.ext matches your database layout.  When using the LDAP userdb  module,  make  sure
              that the iterate_attrs and iterate_filter settings in /etc/dovecot/dovecot-ldap.conf.ext match your LDAP schema.  Otherwise doveadm(1) will be unable to iterate over all users.

       -F file
              Execute  the  command  for all the users in the file.  This is similar to the -A option, but instead of getting the list of users from the userdb, they are read from the given file.  The file
              contains one username per line.

       -N     Synchronize all the available namespaces.  By default only namespaces that don't have explicit location setting are synchronized.

       -P     Run a doveadm-purge(1) for the destination (remote) storage after synchronization.

       -R     Do a reverse sync. Normally, messages would be pushed from the local system to the destination (remote). This option reverses the flow, and will instead pull messages from the remote  to  the
              local storage.

       -S socket_path
              The option's argument is either an absolute path to a local UNIX domain socket, or a hostname and port (hostname:port), in order to connect a remote host via a TCP socket.

              This allows an administrator to execute doveadm(1) mail commands through the given socket.

       -T secs
              Specify the time in seconds, how long doveadm(1) should wait for stalled I/O operations.  The default timeout is 600 seconds.

       -U     This is used internally by replicator to have dsync notify it when the synchronization is finished.

       -d     Use the default destination, which is looked up from the mail_replica userdb extra field.

       -g mailbox_guid
              Same as -m, but find the mailbox to be synchronized by its GUID instead of by name.

       -l secs
              Lock the dsync for this user.  Wait for maximum secs before giving up.  This parameter should be used to avoid broken synchronization if it's possible that dsync is being run concurrently for
              the same user.

       -m mailbox
              Synchronize only this mailbox name.

       -n namespace
              Synchronize only the specified namespace.  This parameter can be used multiple times.

       -r rawlog_path
              Running dsync remotely, write the remote input/output traffic to the specified log file.

       -s previous_state
              Use stateful synchronization.  If the previous state is unknown, use an empty string.  The new state is always printed to standard output.

       -u user/mask
              Run the command only for the given user.  It's also possible to use '*' and '?' wildcards (e.g. -u *@example.org).
              When neither the -A option, nor the -F file option, nor the -u user was specified, the command will be executed with the environment of the currently logged in user.

       -x mailbox_mask
              Exclude the specified mailbox name/mask.  The mask may contain "?" and "*" wildcards.  This parameter can be used multiple times.

ARGUMENTS
       destination
              This argument specifies the synchronized destination.  It can be one of:

              location
                     Same as mail_location setting, e.g. maildir:~/Maildir

              remote:login@host
                     Uses dsync_remote_cmd setting to connect to the remote host (usually via ssh)

              remoteprefix:login@host
                     This is the same as remote, except "user@domain\n" is sent before dsync protocol starts.  This allows implementing a trusted wrapper script that runs doveadm  dsync-server  by  reading
                     the username from the first line.

              tcp:host[:port]
                     Connects to remote doveadm server via TCP.  The default port is specified by doveadm_port setting.

              tcps:host[:port]
                     This is the same as tcp, but with SSL.

EXIT STATUS
       dsync will exit with one of the following values:

       0   Synchronization was done perfectly.

       2   Synchronization was done without errors, but some changes couldn't be done, so the mailboxes aren't perfectly synchronized. Running dsync again usually fixes this. Typically this occurs for mes‐
           sage modification sequences with newly created mailboxes. It can also occur if one of the mailboxes change during the syncing.

       1, >2
           Synchronization failed.

EXAMPLE
   SYNCHRONIZATION
       Synchronize mailboxes with a remote server.  Any errors are written to stderr.

              doveadm sync -u username@example.com remote:server-replica.example.com

       If you need more complex parameters to ssh, you can use e.g.:

              doveadm sync -u username@example.com ssh -i id_dsa.dovecot \
              mailuser@example.com doveadm dsync-server -u username@example.com

   CONVERTING
       Assuming that the mail_location setting in /etc/dovecot/conf.d/10-mail.conf is set to: mail_location = mdbox:~/mdbox, a logged in system user may convert her/his mails from its  Maildir  in  her/his
       home directory to the mdbox mailbox format.  The user has to execute the command:

              doveadm sync maildir:~/Maildir

       If you want to do this without any downtime, you can do the conversion one user at a time.  Initially:

           ·   Configuration uses mail_location = maildir:~/Maildir

           ·   Set up the possibility of doing per-user mail location using userdb extra fields.

       Then for each user:

           1.  Run doveadm sync once to do the initial conversion.

           2.  Run doveadm sync again, because the initial conversion could have taken a while and new changes could have occurred during it.  This second time only applies changes, so it should be fast.

           3.  Update mail extra field in userdb to mdbox:~/mdbox.  If you're using auth cache, you need to flush it, e.g.  doveadm auth cache flush.

           4.  Wait for a few seconds and then kill (doveadm kick) the user's all existing imap and pop3 sessions (that are still using maildir).

           5.  Run doveadm sync once more to apply final changes that were possibly done.  After this there should be no changes to Maildir, because the user's mail location has been changed and all exist‐
               ing processes using it have been killed.

       Once all users have been converted, you can set the default mail_location to mdbox and remove the per-user mail locations from userdb.

REPORTING BUGS
       Report bugs, including doveconf -n output, to the Dovecot Mailing List <dovecot@dovecot.org>.  Information about reporting bugs is available at: http://dovecot.org/bugreport.html

SEE ALSO
       doveadm(1), doveadm-auth(1), doveadm-kick(1), doveadm-purge(1), doveconf(1)

       Additional resources:

       dsync design
              http://wiki2.dovecot.org/Design/Dsync



Dovecot v2.2                                                                                      2015-08-31                                                                                  DOVEADM-SYNC(1)
