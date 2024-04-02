AMRECOVER(8)                                                                            System Administration Commands                                                                           AMRECOVER(8)



NAME
       amrecover - Amanda index database browser

SYNOPSIS
       amrecover [-s index-server] [-t tape-server] [-d tape-device] [-h hostname] [-o configoption...] [-C config]

DESCRIPTION
       Amrecover browses the database of Amanda index files to determine which tapes contain files to recover. Furthermore, it is able to recover files.

       In order to restore files in place, you must invoke amrecover from the root of the backed up filesystem, or use lcd to move into that directory, otherwise a directory tree that resembles the backed
       up filesystem will be created in the current directory. See the examples below for details.

       Amrecover will read the amanda-client.conf file and the config/amanda-client.conf file. If no configuration name is supplied on the command line, Amrecover will try the compiled-in default
       configuration ,usually DailySet1.

       See the amanda(8) man page for more details about Amanda.

OPTIONS
           Note
           The Default values are those set at compile-time. Use amrestore to recover client-encrypted or client-custom-compressed tapes.

       [ -C ] config
           Amanda configuration.

       -s index-server
           Host that runs the index daemon.

       -t tape-server
           Host that runs the tape server daemon.

       -d tape-device
           Tape device to use on the tape server host.

       -h hostname
           Hostname to begin restoring; defaults to the system's hostname.

       -o clientconfigoption
           See the "CONFIGURATION OVERRIDE" section in amanda(8).

AUTH
       The default auth is 'BSDTCP', you can set a different auth in the amanda-client.conf file or by specifying the '-oauth=bsd' command line argument.

COMMANDS
       Amrecover connects to the index server and then presents a command line prompt. Usage is similar to an ftp client. The GNU readline library is used to provide command line history and editing if it
       was built in to amrecover.

       The purpose of browsing the database is to build up a restore list of files to be extracted from the backup system. The following commands are available:

       sethost hostname
           Specifies which host to look at backup files for (default: the local host).

       setdate YYYY-MM-DD-HH-MM[-SS] | YYYY-MM-DD
           Set the restore time (default: now). File listing commands only return information on backup images for this day, for the day before with the next lower dump level, and so on, until the most
           recent level 0 backup on or before the specified date is encountered.

           For example, if:

               1996-07-01 was a level 0 backup
               1996-07-02 through 1996-07-05 were level 1 backups
               1996-07-06 through 1997-07-08 were level 2 backups

           then the command setdate 1997-07-08-00 would yield files from the following days:

               1997-07-08 (the latest level 2 backup)
               1997-07-05 (the latest level 1 backup)
               1997-07-01 (the latest level 0 backup)

           Only the most recent version of a file will be presented.

           The following abbreviated date specifications are accepted:

           --MM-DD
               dates in the current year

           ---DD
               dates in the current month of the current year

       setdisk diskname [mountpoint]
           Specifies which disk to consider (default: the disk holding the working directory where amrecover is started). It can only be set after the host is set with sethost.  Diskname is the device name
           specified in the amanda.conf or disklist(5). The disk must be local to the host. If mountpoint is not specified, all pathnames will be relative to the (unknown) mount point instead of full
           pathnames.

       listhost [diskdevice]
           List all host

       listdisk [diskdevice]
           List all diskname

       listproperty
           List all property

       setproperty [append] [priority] name [value ...]
           Set the property name to the value value. The append keyword appends the value to the values already set for this property. Without value, the property is unset. The priority keyword is unused,
           it is present for ease of copy/paste from application definition.

       setdevice [[-h tape-server] tapedev]
           Specifies the host to use as the tape server, and which of its tape devices to use. If the server is omitted, the server name reverts to the configure-time default. If the tape device is
           omitted, the default is used.

           If you want amrecover to use your changer, the tapedev must be equal to the amrecover-changer setting on the server.

           Since device names contain colons, you must always specify the hostname.
           settape 192.168.0.10:file:/file1
           You can change the tape device when amrecover ask you to load the tape:
           Load tape DMP014 now
           Continue? [Y/n/t]: t
           Tape device: server2:/dev/nst2
           Continue? [Y/n/t]: Y
           Using tape /dev/nst2 from server server2.

       setmode mode
           Set the extraction mode for Samba shares. If mode is smb, shares are sent to the Samba server to be restored back onto the PC. If mode is tar, they are extracted on the local machine the same
           way tar volumes are extracted.

       settranslate [on|off]
           Default: on. Translate escaped octal value ('\000') in the index file to their corespondig characters, it improve the interface if amrecover is run in the same charset as the filename. Set it to
           off if the charset of some filename is not compatible with the amrecover charset.

       mode
           Displays the extracting mode for Samba shares.

       history
           Show the backup history of the current host and disk. Dates, levels, tapes and file position on tape of each backup are displayed.

       pwd
           Display the name of the current backup working directory.

       cd dir
           Change the backup working directory to dir.  If the mount point was specified with setdisk, this can be a full pathname or it can be relative to the current backup working directory. If the
           mount point was not specified, paths are relative to the mount point if they start with "/", otherwise they are relative to the current backup working directory. The dir can be a shell style
           wildcards.

       cdx dir
           Like the cd command but allow regular expression.

       lpwd
           Display the amrecover working directory. Files will be restored under this directory, relative to the backed up filesystem.

       lcd path
           Change the amrecover working directory to path.

       ls
           List the contents of the current backup working directory. See the description of the setdate command for how the view of the directory is built up. The backup date is shown for each file.

       add item1 item2 ...
           Add the specified files or directories to the restore list. Each item may have shell style wildcards.

       addx item1 item2 ...
           Add the specified files or directories to the restore list. Each item may be a regular expression.

       delete item1 item2 ...
           Delete the specified files or directories from the restore list. Each item may have shell style wildcards.

       deletex item1 item2 ...
           Delete the specified files or directories from the restore list. Each item may be a regular expression.

       list file
           Display the contents of the restore list. If a file name is specified, the restore list is written to that file. This can be used to manually extract the files from the Amanda tapes with
           amrestore.

       clear
           Clear the restore list.

       quit
           Close the connection to the index server and exit.

       exit
           Close the connection to the index server and exit.

       extract
           Start the extract sequence (see the examples below). Make sure the local working directory is the root of the backed up filesystem, or another directory that will behave like that. Use lpwd to
           display the local working directory, and lcd to change it.

       help
           Display a brief list of these commands.

EXAMPLES
       The following shows the recovery of an old syslog file.
       # cd /var/log
       # ls -l syslog.7
       syslog.7: No such file or directory
       # amrecover MyConfig
       AMRECOVER Version 2.4.2. Contacting server on oops ...
       220 oops Amanda index server (2.4.2) ready.
       Setting restore date to today (1997-12-09)
       200 Working date set to 1997-12-09.
       200 Config set to MyConfig.
       200 Dump host set to this-host.some.org.
       $CWD '/var/log' is on disk '/var' mounted at '/var'.
       200 Disk set to /var.
       /var/log
       WARNING: not on root of selected filesystem, check man-page!
       amrecover> ls
       1997-12-09 daemon.log
       1997-12-09 syslog
       1997-12-08 authlog
       1997-12-08 sysidconfig.log
       1997-12-08 syslog.0
       1997-12-08 syslog.1
       1997-12-08 syslog.2
       1997-12-08 syslog.3
       1997-12-08 syslog.4
       1997-12-08 syslog.5
       1997-12-08 syslog.6
       1997-12-08 syslog.7
       amrecover> add syslog.7
       Added /log/syslog.7
       amrecover> lpwd
       /var/log
       amrecover> lcd ..
       /var
       amrecover> extract

       Extracting files using tape drive /dev/nst0 on host 192.168.0.10

       The following tapes are needed: DMP014

       Restoring files into directory /var
       Continue? [Y/n]: y

       Load tape DMP014 now
       Continue? [Y/n/t]: y
       set owner/mode for '.'? [yn] n
       amrecover> quit
       200 Good bye.
       # ls -l syslog.7
       total 26
       -rw-r--r--   1 root     other      12678 Oct 14 16:36 syslog.7

       If you do not want to overwrite existing files, create a subdirectory to run amrecover from and then move the restored files afterward.
       # cd /var
       # (umask 077 ; mkdir .restore)
       # cd .restore
       # amrecover
       AMRECOVER Version 2.4.2. Contacting server on oops ...
       ...
       amrecover> cd log
       /var/log
       amrecover> ls
       ...
       amrecover> add syslog.7
       Added /log/syslog.7
       amrecover> lpwd
       /var/.restore
       amrecover> extract

       Extracting files using tape drive /dev/nst0 on host 192.168.0.10
       ...
       amrecover> quit
       200 Good bye.
       # mv -i log/syslog.7 ../log/syslog.7-restored
       # cd ..
       # rm -fr .restore

       If you need to run amrestore by hand instead of letting amrecover control it, use the list command after browsing to display the needed tapes.
       # cd /var/log
       # amrecover
       AMRECOVER Version 2.4.2. Contacting server on oops ...
       ...
       amrecover> ls
       ...
       amrecover> add syslog syslog.6 syslog.7
       Added /log/syslog
       Added /log/syslog.6
       Added /log/syslog.7
       amrecover> list
       TAPE DMP014 LEVEL 0 DATE 1997-12-08
               /log/syslog.7
               /log/syslog.6
       TAPE DMP015 LEVEL 1 DATE 1997-12-09
               /log/syslog
       amrecover> quit

       The history command shows each tape that has a backup of the current disk along with the date of the backup, the level, the tape label and the file position on the tape. All active tapes are listed,
       not just back to the most recent full dump.

       Tape file position zero is a label. The first backup image is in file position one.
       # cd /var/log
       # amrecover
       AMRECOVER Version 2.4.2. Contacting server on oops ...
       ...
       amrecover> history
       200- Dump history for config "MyConfig" host "this-host.some.org" disk "/var"
       201- 1997-12-09 1 DMP015 9
       201- 1997-12-08 1 DMP014 11
       201- 1997-12-07 0 DMP013 22
       201- 1997-12-06 1 DMP012 16
       201- 1997-12-05 1 DMP011 9
       201- 1997-12-04 0 DMP010 11
       201- 1997-12-03 1 DMP009 7
       201- 1997-12-02 1 DMP008 7
       201- 1997-12-01 1 DMP007 9
       201- 1997-11-30 1 DMP006 6
       ...
       amrecover> quit

ENVIRONMENT
       PAGER The ls and list commands will use $PAGER to display the file lists. Defaults to more if PAGER is not set.

       AMANDA_SERVER If set, $AMANDA_SERVER will be used as index-server. The value will take precedence over the compiled default, but will be overridden by the -s switch.

       AMANDA_TAPE_SERVER If set, $AMANDA_TAPE_SERVER will be used as tape-server. The value will take precedence over the compiled default, but will be overridden by the -t switch.

SEE ALSO
       amanda(8), amanda-client.conf(5), amrestore(8), amfetchdump(8), readline(3)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHORS
       Alan M. McIvor <alan@kauri.auck.irl.cri.nz>

       Stefan G. Weichinger <sgw@amanda.org>



Amanda 3.3.3                                                                                      01/10/2013                                                                                     AMRECOVER(8)
