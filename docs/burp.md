Burp(8)                                                       System Manager's Manual                                                      Burp(8)

NAME
       Burp - BackUp and Restore Program

SYNOPSIS
       burp [OPTIONS]

DESCRIPTION
       BackUp and Restore Program.

SERVER OPTIONS
       -c [path]
              Short for 'config file'. The argument is a path to the config file. The default is /etc/burp/burp.conf.

       -n     No forking mode. The program will accept a single query, deal with it, and then exit. This is useful for debugging. Implies '-F'.

       -F     Foreground mode. The server will fork into the background and run as a daemon if you do not give this option.

       -g     Generate initial CA keys and certificates, and then exit.

       -i     Print an index table of symbols that humans may see burp produce, and exit.

       -a s   Run  this  to connect to a running server to get a live monitor of the status of all your backup clients. If your server config file
              is not in the default location, you will also need to specify the path with the '-c' option. The live monitor requires ncurses  sup‐
              port at compile time.

       -a S   Similar  to  '-a s', but it prints the main status monitor summary screen to stdout. The intention is that a script can run this and
              email an administrator the output on a cron job. This doesn't require ncurses support. There are  additional  options  that  can  be
              given with '-a S', listed below. These enable logs and contents of backups to be listed whilst logged in on the server machine.

       ADDITIONAL SERVER OPTIONS TO USE WITH '-a S'

       -C [client]
              Limit the output to a single client.

       -b [number]
              Show listable files in a particular backup (requires -C).

       -z [file]
              Dump a particular log file in a backup (requires -C and -b).

       -d [path]
              Show a particular path in a backup (requires -C and -b).

CLIENT OPTIONS
       -a [b|t|r|l|L|v|D|e]
              Short for 'action'. The arguments mean backup, timed backup, restore, list, long list, verify, delete, or estimate, respectively.

       -b [number|a]
              Short for 'backup number'. The argument is a number, or 'a' to select all backups.

       -c [path]
              Short  for  'config  file'.  The  argument  is  a  path  to  the  config  file.  The  default  is  /etc/burp/burp.conf, or %PROGRAM‐
              FILES%\Burp\burp.conf on Windows.

       -C [client]
              Allows you to specify an alternative client to list or restore from. Requires that  the  server  configuration  of  the  alternative
              client permits your client to do this. See the 'restore_client' option.

       -d [path]
              Short  for 'directory'. When restoring, the argument is a path to an alternative directory to restore to. When listing, the argument
              is the directory to list.

       -f [path]
              Short for 'force overwrite'. Without this option set, a restore will not overwrite existing files.

       -i     Print an index table of symbols that humans may see burp produce, and exit.

       -r [regex]
              Short for 'regular expression'. The argument is a regular expression with which  to  match  backup  files.  Use  it  for  lists  and
              restores.

       -s [number]
              For use with restores - strip a number of leading path components.

       -j     Format long file listing as JSON.

       -x     For Windows clients only - do not use the Windows VSS API on restore. Give this option when you are restoring a backup that contains
              no VSS information.

EXAMPLES
       burp -a b
              Runs a backup.

       burp -a l
              Lists the available backups and dates.

       burp -a l -b 1
              Lists all the files in backup number 1.

       burp -a l -b 1 -l /dev/null
              Lists all the files in backup number 1 without extra debug info.

       burp -a l -b a
              Lists all the files in all the backups.

       burp -a l -b 1 -r myregex
              Lists all the files in backup number 1 that match the regular expression 'myregex'.

       burp -a L -b 1 -r myregex
              Long lists all the files in backup number 1 that match the regular expression 'myregex'. This is like doing an 'ls -l'.

       burp -a r -b 1 -r myregex
              Restores all the files in backup number 1 that match the regular expression 'myregex' back to their original location.

       burp -a r -b 1 -r myregex -d /tmp/restoredir
              Restores all the files in backup number 1 that match the regular expression 'myregex' into the directory /tmp/restoredir.

       burp -a r -b 1 -r myregex -d /tmp/restoredir -s 2
              Restores all the files in backup number 1 that match the regular expression 'myregex' into the directory /tmp/restoredir and strip 2
              leading path components.

       burp -a r
              Restores all the files in the most recent backup to their original location.

       burp -a v
              Verifies the most recent backup.

       burp -a v -b 1 -r myregex
              Verifies everything in backup number 1 that matches the regular expression 'myregex'.

       burp -a D -b 1
              Deletes backup number 1. Note that burp will not delete backup directories that other backup directories depend upon.

       burp -a t
              Timed  backup. The same as 'burp -a b', except that a script is run on the server before deciding to go ahead. The intention is that
              this command will be run on a repeating cron job with a short interval, and that the server will decide when it is time  for  a  new
              backup.

       burp -a L -b 1 -d ''
              Long list the top level directory of backup 1.

       burp -a L -b 1 -d '/home/graham'
              Long list the /home/graham directory of backup 1. These '-d' versions of the list function provide the ability to 'browse' backups.

       burp -C altclient -a L
              Long list the top level directory of backup 1 on client 'altclient'.

       burp -C altclient -a r -b 1 -r myregex -d /tmp/restoredir
              Restores  all  the  files  in backup number 1 from client 'altclient' that match the regular expression 'myregex' into the directory
              /tmp/restoredir.

SERVER CONFIGURATION FILE OPTIONS
       . [path]
              Read an additional configuration file.

       mode=server
              Required to run in server mode.

       port=[port number]
              Defines the main TCP port that the server listens on.

       status_port=[port number]
              Defines the TCP port that the server listens on for status requests.

       daemon=[0|1]
              Whether to daemonise. The default is 1.

       fork=[0|1]
              Whether to fork children. The default is 1.

       directory=[path]
              Path to the directory in which to store backups.

       directory_tree=[0|1]
              When turned on (which is the default) and the client is on version 1.3.6 or greater, the structure of  the  storage  directory  will
              mimic that of the original filesystem on the client.

       timestamp_format=[strftime format]
              This  allows  you to tweak the format of the timestamps of individual backups. See 'man strftime' to see available substitutions. If
              this option is unset, burp uses "%Y-%m-%d %H:%M:%S".

       password_check=[0|1]
              Allows you to turn client password checking on or off. The default is on. SSL certificates will still be checked if you  turn  pass‐
              words off. This option can be overridden by the client configuration files in clientconfdir on the server.

       clientconfdir=[path]
              Path to the directory that contains client configuration files.

       lockfile=[path]
              Path to the lockfile that ensures that two server processes cannot run simultaneously.

       pidfile=[path]
              Synonym for lockfile.

       syslog=[0|1]
              Log to syslog. Defaults to off.

       stdout=[0|1]
              Log to stdout. Defaults to on.

       keep=[number]
              Number of backups to keep. This can be overridden by the client configuration files in clientconfdir on the server. Specify multiple
              'keep' entries on separate lines in order to keep multiple periods of backups. For example, assuming that you are doing a  backup  a
              day,  keep=7  keep=4  keep=6  (on  separate  lines) will keep 7 daily backups, 4 weekly backups (7x4=28), and 6 multiples of 4 weeks
              (7x4x6=168) - roughly 6 monthly backups. Effectively, you will be guaranteed to be able to restore up to 168 days ago, with the num‐
              ber  of  available  backups exponentially decreasing as you go back in time to that point. In this example, every 7th backup will be
              hardlinked to allow burp to safely delete intermediate backups when necessary. You can have as many 'keep' lines  as  you  like,  as
              long as they don't exceed 52560000 when multiplied together. That is, a backup every minute for 100 years.

       hardlinked_archive=[0|1]
              On  the server, defines whether to keep hardlinked files in the backups, or whether to generate reverse deltas and delete the origi‐
              nal files. Can be set to either 0 (off) or 1 (on). Disadvantage: More disk space will be used Advantage: Restores  will  be  faster,
              and since no reverse deltas need to be generated, the time and effort the server needs at the end of a backup is reduced.

       max_hardlinks=[number]
              On  the  server, the number of times that a single file can be hardlinked. The bedup program also obeys this setting. The default is
              10000.

       librsync=[0|1]
              When set to 0, delta differencing will not take place. That is, when a file changes, the server will request the whole new file. The
              default is 1. This option can be overridden by the client configuration files in clientconfdir on the server.

       compression=gzip[0-9]
              Choose  the  level  of gzip compression for files stored in backups. Setting 0 or gzip0 turns compression off. The default is gzip9.
              This option can be overridden by the client configuration files in clientconfdir on the server.

       version_warn=[0|1]
              When this is on, which is the default, a warning will be issued when the client version does not  match  the  server  version.  This
              option can be overridden by the client configuration files in clientconfdir on the server.

       client_lockdir=[path]
              Path to the directory in which to keep per-client lock files. By default, this is set to the path given by the 'directory' option.

       user=[username]
              Run as a particular user. This can be overridden by the client configuration files in clientconfdir on the server.

       group=[groupname]
              Run as a particular group. This can be overridden by the client configuration files in clientconfdir on the server.

       umask=[umask]
              Set the file creation umask. Default is 0022.

       ratelimit=[Mb/s]
              Set the network send rate limit, in Mb/s. If this option is not given, burp will send data as fast as it can.

       network_timeout=[s]
              Set  the  network timeout in seconds. If no data is sent or received over a period of this length, burp will give up. The default is
              7200 seconds (2 hours).

       working_dir_recovery_method=[resume|use|delete]
              This option tells the server what to do when it finds the working directory of an interrupted backup (perhaps  somebody  pulled  the
              plug on the server, or something). This can be overridden by the client configurations files in clientconfdir on the server. Options
              are...

       delete: Just delete the old working directory.

       use: Convert the working directory into a complete backup.

       resume: Simply continue the previous backup from the point at which it left off, at file granularity. NOTE: If the client has  changed  its
       include/exclude configuration since the backup was interrupted, the recovery method will automatically switch to 'use'.

       resume_partial=[0|1]
              Turn  this  on to enable 'resume partial' code. Requires 'working_dir_recovery_method=resume'. When resuming an interrupted transfer
              of a single file, it attempts to use previously transferred blocks of that file in order to be more efficient.  However,  situations
              have been reported where the file on the server side just gets bigger forever, so this feature now defaults to being turned off.

       client_can_delete=[0|1]
              Turn this off to prevent clients from deleting backups with the '-a D' option. The default is that clients can delete backups.

       client_can_force_backup=[0|1]
              Turn  this  off  to  prevent clients from forcing backups with the '-a b' option. Timed backups will still work. The default is that
              clients can force backups.

       client_can_list=[0|1]
              Turn this off to prevent clients from listing backups with the '-a l' option. The default is that clients can list backups.

       client_can_restore=[0|1]
              Turn this off to prevent clients from initiating restores with the '-a r' option. The default is that clients can initiate restores.

       client_can_verify=[0|1]
              Turn this off to prevent clients from initiating a verify job with the '-a v' option. The default is that  clients  can  initiate  a
              verify job.

       restore_client=[client]
              A  client  that  is  permitted to list and restore files belonging to any other client. You may specify multiple restore_clients. If
              this is too permissive, you may set a restore_client for individual original clients in the  individual  clientconfdir  files.  Note
              that restoring a backup from a Windows computer onto a Linux computer will currently leave the VSS headers in place at the beginning
              of each file. This will be addressed in a future version of burp.

       ssl_cert_ca=[path]
              The path to the SSL CA certificate. This file will probably be the same on both the server and the client. The file  should  contain
              just the certificate in PEM format. For more information on this, and the other ssl_* options, please see docs/burp_ca.txt.

       ssl_cert=[path]
              The  path to the server SSL certificate. It works for me when the file contains the concatenation of the certificate and private key
              in PEM format.

       ssl_key=[path]
              The path to the server SSL private key in PEM format.

       ssl_key_password=[password]
              The SSL key password.

       ssl_cert_password=[password]
              Synonym for ssl_key_password.

       ssl_ciphers=[cipher list]
              Allowed SSL ciphers. See openssl ciphers for details.

       ssl_dhfile=[path]
              Path to Diffie-Hellman parameter file. To generate one with openssl, use a command like this: openssl  dhparam  -out  dhfile.pem  -5
              1024

       max_children=[number]
              Defines the number of child processes to fork (the number of clients that can simultaneously connect. The default is 5.

       max_status_children=[number]
              Defines  the  number of status child processes to fork (the number of status clients that can simultaneously connect. The default is
              5.

       max_storage_subdirs=[number]
              Defines the number of subdirectories in the data storage areas. The maximum number of subdirectories that ext3 allows is  32000.  If
              you do not set this option, it defaults to 30000.

       timer_script=[path]
              Path  to  the script to run when a client connects with the timed backup option. If the script exits with code 0, a backup will run.
              The first two arguments are the client name and the path to the 'current' storage directory. The next three arguments are  reserved,
              and  user  arguments  are appended after that. An example timer script is provided. The timer_script option can be overridden by the
              client configuration files in clientconfdir on the server.

       timer_arg=[string]
              A user-definable argument to the timer script. You can have many of these. The timer_arg options can be  overridden  by  the  client
              configuration files in clientconfdir on the server.

       notify_success_script=[path]
              Path  to  the  script to run when a backup succeeds. User arguments are appended after the first five reserved arguments. An example
              notify script is provided. The notify_success_script option can be overriddden by the client configuration files in clientconfdir on
              the server.

       notify_success_arg=[string]
              A  user-definable  argument to the notify success script. You can have many of these. The notify_success_arg options can be overrid‐
              dden by the client configuration files in clientconfdir on the server.

       notify_success_warnings_only=[0|1]
              Set to 1 to send success notifications when there were warnings. If this and notify_success_changes_only are not turned on,  success
              notifications are always sent.

       notify_success_changes_only=[0|1]
              Set to 1 to send success notifications when there were new or changed files. If this and notify_success_warnings_only are not turned
              on, success notifications are always sent.

       notify_failure_script=[path]
              The same as notify_success_script, but for backups that failed.

       notify_failure_arg=[string]
              The same as notify_failure_arg, but for backups that failed.

       dedup_group=[string]
              Enables you to group clients together for file deduplication purposes. For example, you might want to set 'dedup_group=xp' for  each
              Windows XP client, and then run the bedup program on a cron job every other day with the option '-g xp'.

       server_script_pre=[path]
              Path to a script to run on the server after each successfully authenticated connection but before any work is carried out. The argu‐
              ments to it are 'pre', '(client command)', 'reserved3' to 'reserved5', and then arguments defined by server_script_pre_arg.  If  the
              script  returns  non-zero,  the task asked for by the client will not be run. This command and related options can be overriddden by
              the client configuration files in clientconfdir on the server.

       server_script_pre_arg=[string]
              A user-definable argument to the server pre script. You can have many of these.

       server_script_pre_notify=[0|1]
              Turn on to send a notification email when the server pre script returns non-zero. The output of the script will be included  in  the
              email.  The  default is off. Most people will not want this turned on because clients usually contact the server at 20 minute inter‐
              vals and this could cause a lot of emails to be generated. Requires the notify_failure options to be set.

       server_script_post=[path]
              Path to a script to run on the server before the client disconnects. The arguments to it are 'post', '(client command)', 'reserved3'
              to  'reserved5',  and  then  arguments defined by server_script_post_arg. This command and related options can be overriddden by the
              client configuration files in clientconfdir on the server.

       server_script_post_arg=[string]
              A user-definable argument to the server post script. You can have many of these.

       server_script_post_notify=[0|1]
              Turn on to send a notification email when the server post script returns non-zero. The output of the script will be included in  the
              email. The default is off. Requires the notify_failure options to be set.

       server_script=[path]
              You can use this to save space in your config file when you want to run the same server script twice. It overrides server_script_pre
              and server_script_post. This command and related options can be overriddden by the client configuration files  in  clientconfdir  on
              the server.

       server_script_arg=[path]
              Goes with server_script and overrides server_script_pre_arg and server_script_post_arg.

       server_script_notify=[0|1]
              Turn  on  to  send  a  notification  emails  when  the server pre and post scripts return non-zero. The output of the script will be
              included it the email. The default is off. Requires the notify_failure options to be set.

       server_script_post_run_on_fail=[0|1]
              If this is set to 1, server_script_post will always be run. The default is 0, which means that if the task asked for by  the  client
              fails, server_script_post will not be run.

       autoupgrade_dir=[path]
              Path  to autoupgrade directory from which upgrades are downloaded. The option can be left unset in order not to autoupgrade clients.
              Please see docs/autoupgrade.txt in the source package for more help with this option.

       ca_conf=[path]
              Path to certificate authority configuration file. The CA configuration file will usually be /etc/burp/CA.cnf. The CA directory indi‐
              cated  by  CA.cnf will usually be /etc/burp/CA. If ca_conf is set and the CA directory does not exist, the server will create, popu‐
              late it, and the paths indicated by ssl_cert_ca, ssl_cert, ssl_key and ssl_dhfile will be overwritten. For more detailed information
              on this and the other ca_* options, please see docs/burp_ca.txt.

       ca_name=[name]
              Name of the CA that the server will generate when using the ca_conf option.

       ca_server_name=[name]
              The name that the server will put into its own SSL certficates when using the ca_conf option.

       ca_burp_ca=[path]
              Path to the burp_ca script when using the ca_conf option.

CLIENT CONFIGURATION FILE OPTIONS
       . [path]
              Read an additional configuration file.

       mode=client
              Required to run in client mode.

       server=[IP address or hostname]
              Defines the server to connect to.

       port=[port number]
              Defines the TCP port that the server is listening on.

       cname=[password]
              Defines the client name to identify as to the server.

       password=[password]
              Defines the password to send to the server.

       lockfile=[path]
              Path to the lockfile that ensures that two client processes cannot run simultaneously (this currently doesn't work on Windows).

       pidfile=[path]
              Synonym for lockfile.

       syslog=[0|1]
              Log to syslog. Defaults to off.

       stdout=[0|1]
              Log to stdout. Defaults to on.

       progress_counter=[0|1]
              Print progress counters on stdout. Defaults to on.

       user=[username]
              Run as a particular user (not supported on Windows).

       group=[groupname]
              Run as a particular group (not supported on Windows).

       ratelimit=[Mb/s]
              Set the network send rate limit, in Mb/s. If this option is not given, burp will send data as fast as it can.

       network_timeout=[s]
              Set  the  network timeout in seconds. If no data is sent or received over a period of this length, burp will give up. The default is
              7200 seconds (2 hours).

       ca_burp_ca=[path]
              Path to the burp_ca script (burp_ca.bat on Windows). For more information on this, please see docs/burp_ca.txt.

       ca_csr_dir=[path]
              Directory where certificate signing requests are generated. For more information on this, please see docs/burp_ca.txt.

       ssl_cert_ca=[path]
              The path to the SSL CA certificate. This file will probably be the same on both the server and the client. The file  should  contain
              just the certificate in PEM format. For more information on this and the other ssl_* options, please see docs/burp_ca.txt.

       ssl_cert=[path]
              The  path to the client SSL certificate. It works for me when the file contains the concatenation of the certificate and private key
              in PEM format.

       ssl_key=[path]
              The path to the client SSL private key in PEM format.

       ssl_key_password=[password]
              The SSL key password.

       ssl_cert_password=[password]
              Synonym for ssl_key_password.

       ssl_peer_cn=[string]
              Must match the common name in the SSL certificate that the server gives when it connects. If ssl_peer_cn is not set, the server name
              will be used instead.

       ssl_ciphers=[cipher list]
              Allowed SSL ciphers. See openssl ciphers for details.

       server_can_restore=[0|1]
              To prevent the server from initiating restores, set this to 0. The default is 1.

       encryption_password=[password]
              Set  this  to  enable client side file Blowfish encryption. If you do not want encryption, leave this field out of your config file.
              IMPORTANT: Configuring this renders delta differencing pointless, since the smallest real change to a file will make the whole  file
              look different. Therefore, activating this option turns off delta differencing so that whenever a client file changes, the whole new
              file will be uploaded on the next backup. ALSO IMPORTANT: If you manage to lose your encryption password, you will not  be  able  to
              unencrypt  your  files. You should therefore think about having a copy of the encryption password somewhere off-box, in case of your
              client hard disk failing. FINALLY: If you change your encryption password, you will end up with a mixture of  files  on  the  server
              with  different  encryption  and  it  may become tricky to restore more than one file at a time. For this reason, if you change your
              encryption password, you may want to start a fresh chain of backups (by moving the original set aside, for example). Burp will  cope
              fine  with  turning  the same encryption password on and off between backups, and will restore a backup of mixed encrypted and unen‐
              crypted files without a problem.

       backup_script_pre=[path]
              Path to a script to run before a backup. The arguments to it are 'pre', 'reserved2' to 'reserved5', and then  arguments  defined  by
              backup_script_pre_arg.

       backup_script_pre_arg=[string]
              A user-definable argument to the backup pre script. You can have many of these.

       backup_script_post=[path]
              Path  to  a  script  to  run after a backup. The arguments to it are 'post', [0|1] if the backup failed or succeeded, 'reserved3' to
              'reserved5', and then arguments defined by backup_script_post_arg.

       backup_script_post_arg=[string]
              A user-definable argument to the backup post script. You can have many of these.

       backup_script_post_run_on_fail=[0|1]
              If this is set to 1, backup_script_post will be run whether the backup  succeeds  or  not.  The  default  is  0,  which  means  that
              backup_script_post will only be run if the backup succeeds.

       restore_script_pre=[path]
              Path  to  a script to run before a restore. The arguments to it are 'pre', 'reserved2' to 'reserved5', and then arguments defined by
              restore_script_pre_arg.

       restore_script_pre_arg=[string]
              A user-definable argument to the restore pre script. You can have many of these.

       restore_script_post=[path]
              Path to a script to run after a restore. The arguments to it are 'post', [0|1] if the restore failed or  succeeded,  'reserved3'  to
              'reserved5', and then arguments defined by restore_script_post_arg.

       restore_script_post_arg=[string]
              A user-definable argument to the restore post script. You can have many of these.

       restore_script_post_run_on_fail=[0|1]
              If  this  is  set  to  1,  restore_script_post  will  be run whether the restore succeeds or not. The default is 0, which means that
              restore_script_post will only be run if the restore succeeds.

       backup_script=[path]
              You can use this to save space in your config file when you want to run the same script before and  after  a  backup.  It  overrides
              backup_script_pre and backup_script_post.

       backup_script_arg=[path]
              Goes with backup_script and overrides backup_script_pre_arg and backup_script_post_arg.

       restore_script=[path]
              You  can  use  this  to save space in your config file when you want to run the same script before and after a restore. It overrides
              restore_script_pre and restore_script_post.

       restore_script_arg=[path]
              Goes with restore_script and overrides restore_script_pre_arg and restore_script_post_arg.

       autoupgrade_dir=[path]
              Path to autoupgrade directory into which upgrades are downloaded. Please see docs/autoupgrade.txt in the  source  package  for  more
              help with this option. If you do not want your client to autoupgrade, do not set this option.

       autoupgrade_os=[string]
              Name  of  the client operating system. Should match a directory name in the server's autoupgrade_dir. If you do not want your client
              to autoupgrade, do not set this option.

INCLUDES / EXCLUDES
       The following options specify exactly what is backed up. The client can specify these options, or if you include at least one 'include=' in
       the client configuration files on the server, the server will override them all.

       include=[path]
              Path to include in the backup. You can have multiple include lines. Use forward slashes '/', not backslashes '\' as path delimiters.

       exclude=[path]
              Path  to  exclude  from the backup. You can have multiple exclude lines. Use forward slashes '/', not backslashes '\' as path delim‐
              iters.

       include_regex=[regular expression]
              Not implemented.

       exclude_regex=[regular expression]
              Exclude paths that match the regular expression.

       include_ext=[extension]
              Extensions to include in the backup. Case insensitive. Nothing else will be included in the backup. You can  have  multiple  include
              extension  lines.  For  example,  set  'txt' to include files that end in '.txt'. You need to specify an 'include' line so that burp
              knows where to start looking.

       exclude_ext=[extension]
              Extensions to exclude from the backup. Case insensitive. You can have multiple exclude extension lines. For example,  set  'vdi'  to
              exclude VirtualBox disk images.

       exclude_comp=[extension]
              Extensions  to exclude from compression. Case insensitive. You can have multiple exclude compression lines. For example, set 'gz' to
              exclude gzipped files from compression.

       exclude_fs=[fstype]
              File systems to exclude from the backup. Case insensitive. You can have multiple exclude file system lines. For example, set 'tmpfs'
              to  exclude tmpfs. Burp has an internal mapping of file system names to file system IDs. If you know the file system ID, you can use
              that instead. For example, 'exclude_fs = 0x01021994' will also exclude tmpfs.

       min_file_size=[b/Kb/Mb/Gb]
              Do not back up files that are less than the specified size. Example: 'min_file_size = 10Mb'. Set to  0  (the  default)  to  have  no
              limit.

       max_file_size=[b/Kb/Mb/Gb]
              Do  not  back  up files that are greater than the specified size. Example: 'max_file_size = 10Mb'. Set to 0 (the default) to have no
              limit.

       cross_filesystem=[path]
              Allow backups to cross a particular filesystem mountpoint.

       cross_all_filesystems=[0|1]
              Allow backups to cross all filesystem mountpoints.

       nobackup=[file name]
              If this file system entry exists, the directory containing it will not be backed up.

       read_fifo=[path]
              Do not back up the given fifo itself, but open it for reading and back up the contents as if it were a regular file.

       read_all_fifos=[0|1]
              Open all fifos for reading and back up the contents as if they were regular files.

       read_blockdev=[path]
              Do not back up the given block device itself, but open it for reading and back up the contents as if it were a regular file.

       read_all_blockdevs=[0|1]
              Open all block devices for reading and back up the contents as if they were regular files.

       split_vss=[0|1]
              When backing up Windows computers, this option allows you to save the VSS header data separate from the file data.  The  default  is
              off, which means that the VSS header data is saved prepended to the file data.

       strip_vss=[0|1]
              When  backing  up  Windows  computers, this option allows you to prevent the VSS header data being backed up. The default is off. To
              restore a backup that has no VSS information on Windows, you need to give the client the '-x' command line option.

       vss_drives=[list of drive letters]
              When backing up Windows computers, this option allows you to specify which drives have VSS snapshots taken of them. If you omit this
              option,  burp  will  automatically decide based on the 'include' options. If you want no drives to have snapshots taken of them, you
              can specify '0'.

SERVER CLIENTCONFDIR FILE
       For the server to know about clients that can contact it, you need to place a file named after the client in clientconfdir. Files beginning
       with '.' or ending with '~' are ignored. Directories are also ignored.

       The file name must match the name in the 'cname' field on the client.

       ssl_peer_cn=[string]  must  match the common name in the SSL certificate that the client gives when it connects. If ssl_peer_cn is not set,
       the client name will be used instead (the clientconfdir file name).

       The file needs to contain a line like password=[password] that matches the same field on the client, or passwd=[encrypted password] - where
       the plain text password on the client will be tested against an encrypted password of the kind you might find in /etc/passwd.

       Additionally, the following options can be overridden here for each client:
              directory  directory_tree timestamp_format password_check keep working_dir_recovery_method resume_partial librsync version_warn sys‐
              log  client_can_delete  client_can_force_backup  client_can_list  client_can_restore  client_can_verify  restore_client  compression
              timer_script  timer_arg  notify_success_script  notify_success_arg  notify_success_warnings_only  notify_failure_script notify_fail‐
              ure_arg  dedup_group  server_script_pre  server_script_pre_arg  server_script_pre_notify  server_script_post  server_script_post_arg
              server_script_post_notify server_script server_script_arg server_script_notify server_script_post_run_on_fail

       Additionally, the includes and excludes can be overridden here, as described in the section above.

       As with the other configuration files, extra configuration can be included with the '. path/to/config/file' syntax.

Some notes on SSL certificates
       The  burp  example  configs come with example SSL certificates and keys. You can use these and burp will work. But if you are worried about
       network security, you should generate your own certificates and keys and point your config files to them. To create the  example  files,  I
       used  a  handy  interface  to  openssl, called 'tinyca' (http://tinyca.sm-zone.net/). If you are using Debian, you can run 'apt-get install
       tinyca' to get it. There is also the option of using burp_ca, which you can find in the source distribution, courtesy of Patrick Koppen.

Examining backups
       As well as using the client list options described above, you can go directly to the storage directory on the server.  The  backups  for  a
       client are in the directory named after the client. Inside each backup directory is a file called manifest.gz.

       This contains a list of all the files in the backup, and where they originally came from on the client.

       There is also a 'log.gz' file in the backup directory, which contains the output generated by the server during the backup.

       The 'data' directory contains complete backup files.

       The  'deltas.reverse'  directory contains reverse deltas that can be applied to the data from the next backup in the sequence (indicated by
       the contents of the 'forward' file).

       Anything with a .gz suffix is compressed in gzip format.  You can use standard tools, such as zcat, zless or cp, to view them or copy  them
       elsewhere.

Server initiated backups
       You  can  queue a backup on the server, to be performed when the client next makes contact. To do this, you put a file called 'backup' into
       the top level of the client storage directory. The contents of the file are ignored.

Server initiated restores
       You can queue a restore on the server, to be performed when the client next makes contact. To do this, you put a file called 'restore' into
       the  top  level  of  the  client  storage directory. The client can deny server initiated restores by setting "server_can_restore=0" in its
       burp.conf. Valid fields to include in the restore file are:

       orig_client=[client]
              The original client to restore from. Equivalent to '-C' when initiating a restore from a client.  Do  not  include  this  line  when
              restoring to the original client. See also the 'restore_client' server option.

       backup=[number|a]
              The number of the backup to restore from. Equivalent to '-b' when initiating a restore from the client.

       overwrite=[0|1]
              Whether to overwrite existing files. Equivalent to '-f' when initiating a restore from the client.

       strip=[number]
              Number of leading path components to strip. Equivalent to '-s' when initiating a restore from the client.

       restoreprefix=[path]
              Prefix to the restore path. Equivalent to '-d' when initiating a restore from the client.

       regex=[regular expression]
              Only restore files matching the regular expression. Equivalent to '-r' when initiating a restore from the client.

       include=[path]
              Restore  directories  and  files  that match the path. If it is a directory, the contents of the directory will be restored. You can
              have multiple 'include' lines. There is no equivalent when initiating a restore from the client.

       As a minimum, the 'restore' file needs to contain a 'backup' option, and one 'regex' or 'include' line.

SIGNALS
       Sending signal 1 (HUP) to the main server process will cause it to reload. For the vast majority of  configuration  changes,  a  reload  is
       unnecessary  as  the  server  will  pick up changes "on-the-fly". Sending signal 12 (USR2) to the main server process will cause it to wait
       until there are no longer any child processes, and then exit. The intention is to help with upgrades without interrupting current  backups.
       if you are running upstart, a new burp server process will start up when the old one exits.

BUGS
       If you find bugs, please report them to the email list. See the website <http://burp.grke.net/> for details.

AUTHOR
       The main author of Burp is Graham Keeling.

COPYRIGHT
       See the LICENCE file included with the source distribution.

                                                                       Burp                                                                Burp(8)
