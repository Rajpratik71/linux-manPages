ncftpspooler(1)                        General Commands Manual                        ncftpspooler(1)

NAME
       ncftpspooler - Global batch FTP job processor daemon

SYNOPSIS
       ncftpspooler -d [options]

       ncftpspooler -l [options]

OPTIONS
   Command line flags:
       -d      Begin background processing of FTP jobs in the designated FTP job queue directory.

       -q XX   Use  this  option  to  specify  a directory to use as the FTP job queue instead of the
               default directory, /var/spool/ncftp.

       -o XX   Use this option to specify a filename to use as the log file.  By default, (and rather
               inappropriately) the program simply uses a file called log in the job queue directory.
               If you don't want a log, use this option to specify /dev/null.

       -l      Lists the contents of the job queue directory.

       -s XX   When the job queue is empty, the program sleeps 120 seconds and then checks  again  to
               see  if a new job has been submitted.  Use this option to change the number of seconds
               used for this delay.

DESCRIPTION
       The ncftpspooler program evolved from the ncftpbatch  program.   The  ncftpbatch  program  was
       originally  designed as a ``personal FTP spooler'' which would process a single background job
       a particular user and exit when it finished;  the  ncftpspooler  program  is  a  ``global  FTP
       spooler'' which stays running and processes background jobs as they are submitted.

       The  job queue directory is monitored for specially-named and formatted text files.  Each file
       serves as a single FTP job.  The name of the job file contains the type of  FTP  job  (get  or
       put),  a  timestamp  indicating  the earliest the job should be processed, and optionally some
       additional information to make it easier to create unique job files (i.e. a sequence  number).
       The  contents  of  the job files have information such as the remote server machine to FTP to,
       username, password, remote pathname, etc.

       Your job queue directory must be readable and writable by the user that you plan to run ncftp‐
       spooler as, so that jobs can be removed or renamed within the queue.

       More importantly, the user that is running the program will need adequate privileges to access
       the local files that are involved in the FTPing.  I.e., if your spooler is going  to  be  pro‐
       cessing  jobs which upload files to remote servers, then the user will need read permission on
       the local files that will be uploaded (and directory access  permission  the  parent  directo‐
       ries).   Likewise,  if  your spooler is going to be processing jobs which download files, then
       the user would need to be able to write to the local directories.

       Once you have created your spool directory with appropriate permissions  and  ownerships,  you
       can  run ncftpspooler -d to launch the spooler daemon.  You can run additional spoolers if you
       want to process more than FTP job from the same job queue directory simultaneously.   You  can
       then  monitor  the log file (i.e., using tail -f ) to track the progress of the spooler.  Most
       of the time it won't be doing anything, unless job files have appeared in the job queue direc‐
       tory.

JOB FILE NAMES
       When  the  ncftpspooler program monitors the job queue directory, it ignores any files that do
       not follow the naming convention for job files.  The job files must be prefixed in the  format
       of  X-YYYYMMDD-hhmmss  where X denotes a job type, YYYY is the four-digit year, MM is the two-
       digit month number, DD is the two-digit day of the month, hh is the two-digit hour of the  day
       (00-23), mm is the two-digit minute, and ss is the two-digit second.  The date and time repre‐
       sent the earliest time you want the job to be run.

       The job type can be g for a get (download from remote host), or p for  aput (upload to  remote
       host).

       As an example, if you wanted to schedule an upload to occur at 11:45 PM on December 7, 2001, a
       job file could be named

           p-20011207-234500

       In practice, the job files include additional information such as a sequence number or process
       ID.   This  makes it easier to create unique job file names.  Here is the same example, with a
       process ID and a sequence number:

           p-20011207-234500-1234-2

       When submitting job files to the queue directory, be sure to use a dash  character  after  the
       hhmmss field if you choose to append any additional data to the job file name.

JOB FILE CONTENTS
       Job files are ordinary text files, so that they can be created by hand.  Each line of the file
       is a key-pair in the format variable=value, or is a comment line beginning with an  octothorpe
       character (#), or is a blank line.  Here is an example job file:

           # This is a NcFTP spool file entry.
           job-name=g-20011016-100656-008299-1
           op=get
           hostname=ftp.freebsd.org
           xtype=I
           passive=1
           remote-dir=pub/FreeBSD
           local-dir=/tmp
           remote-file=README.TXT
           local-file=readme.txt

       Job  files  are flexible since they follow an easy-to-use format and do not have many require‐
       ments, but there are a few mandatory parameters that must appear for the spooler to be able to
       process the job.

       op      The operation (job type) to perform.  Valid values are get and put.

       hostname
               The  remote  host to FTP to.  This may be an IP address or a DNS name (i.e.  ftp.exam‐
               ple.com).

       For a regular get job, these parameters are required:

       remote-file
               The pathname of the file to download from the remote server.

       local-file
               The pathname to use on the local server for the downloaded file.

       For a regular put job, these parameters are required:

       local-file
               The pathname of the file to upload to the remote server.

       remote-file
               The pathname to use on the remote server for the uploaded file.

       For a recursive get job, these parameters are required:

       remote-file
               The pathname of the file or directory to download from the remote server.

       local-dir
               The directory pathname to use on the local server to contain the downloaded items.

       For a recursive put job, these parameters are required:

       local-file
               The pathname of the file or directory to upload to the remote server.

       remote-dir
               The directory pathname to use on the remote server to contain the uploaded items.

       The rest of the parameters are optional.  The spooler will attempt to use reasonable  defaults
       for these parameters if necessary.

       user    The  username  to  use  to  login to the remote server.  Defaults to ``anonymous'' for
               guest access.

       pass    The password to use in conjunction with the username to login to the remote server.

       acct    The account to use in conjunction with the username to login  to  the  remote  server.
               The need to specify this parameter is extremely rare.

       port    The  port  number  to  use  in  conjunction with the remote hostname to connect to the
               remote server.  Defaults to the standard FTP port number, 21.

       host-ip The IP address to use in conjunction with the remote hostname to connect to the remote
               server.  This parameter can be used in place of the hostname parameter, but one or the
               other must be used.  This parameter is  commonly  included  along  with  the  hostname
               parameter as supplemental information.

       xtype   The  transfer  type  to use.  Defaults to binary transfer type (TYPE I).  Valid values
               are I for binary, A for ASCII text.

       passive Whether to use FTP passive data connections (PASV)  or  FTP  active  data  connections
               (PORT).  Valid values are 0 for active, 1 for passive, or 2 to try passive, then fall‐
               back to active.  The default is 2.

       recursive
               This can be used to transfer entire directory trees.  By default, only a  single  file
               is transferred.  Valid values are yes or no.

       delete  This  can  be  used to delete the source file on the source machine after successfully
               transferring the file to the destination machine.  By default, source  files  are  not
               deleted.  Valid values are yes or no.

       job-name
               This  isn't  used  by the program, but can be used by an entity which is automatically
               generating job files.  As an example, when using the -bbb flag with ncftpput, it  cre‐
               ates a job file on stdout with a job-name parameter so you can easily copy the file to
               the job queue directory with the suggested job name as the job file name.

       pre-ftp-command

       post-ftp-command
               These parameters correspond to the -W, and -Y options of ncftpget and ncftpput.  It is
               important  to  note that these refer to RFC959 File Transfer Protocol commands and not
               shell commands, nor commands used from within /usr/bin/ftp or ncftp.

       pre-shell-command

       post-shell-command
               These parameters provide hooks so you can run a custom program when an  item  is  pro‐
               cessed  by the spooler.  Valid values are pathnames to scripts or executable programs.
               Note that the value must not contain any command-line arguments -- if you want  to  do
               that,  create  a shell script and have it run your program with the command-line argu‐
               ments it requires.

       Generally speaking, post-shell-command is much more useful than pre-shell-command since if you
       need  to  use  these options you're more likely to want to do something after the FTP transfer
       has completed rather than before.  For example, you might want to run  a  shell  script  which
       pages an administrator to notify her that her 37 gigabyte file download has completed.

       When  your  custom  program is run, it receives on standard input the contents of the job file
       (i.e. several lines of variable=value key-pairs), as well as additional data the  spooler  may
       provide, such as a result key-pair with a textual description of the job's completion status.

       post-shell-command update a log file named /var/log/ncftp_spooler.

           #!/usr/bin/perl -w

           my ($line);
           my (%params) = ();

           while (defined($line = <STDIN>)) {
                $params{$1} = $2
                     if ($line =~ /^([^=\#\s]+)=(.*)/);
           }

           if ((defined($params{"result"})) &&
             ($params{"result"} =~ /^Succeeded/))
           {
                open(LOG, ">> /var/log/ncftp_spooler.log")
                     or exit(1);
                print LOG "DOWNLOAD" if ($params{"op"} eq "get");
                print LOG "UPLOAD" if ($params{"op"} eq "put");
                print LOG " ", $params{"local-file"}, "\n";
                close(LOG);
           }

DIAGNOSTICS
       The  log file should be examined to determine if any ncftpspooler processes are actively work‐
       ing on jobs.  The log contains copious amounts of useful information, including the entire FTP
       control connection conversation between the FTP client and server.

BUGS
       The recursive option may not be reliable since ncftpspooler depends on functionality which may
       or may not be present in the remote server software.  Additionally, even if the  functionality
       is  available,  ncftpspooler  may need to use heuristics which cannot be considered 100% accu‐
       rate.  Therefore it is best to create individual jobs for each file  in  the  directory  tree,
       rather than a single recursive directory job.

       For  resumption  of  downloads  to  work, the remote server must support the FTP SIZE and MDTM
       primitives.  Most modern FTP server software can do this, but there  are  still  a  number  of
       bare-bones  ftpd  implementations which do not.  In these cases, ncftpspooler will re-download
       the file in entirety each time until the download succeeds.

       The program needs to be improved to detect jobs that have no chance of  ever  completing  suc‐
       cessfully.   There are still a number of cases where jobs can get spooled but get retried over
       and over again until a vigilant sysadmin manually removes the jobs.

       The spool files may contain usernames and passwords stored in cleartext.  These  files  should
       not be readable by any user except the user running the program!

AUTHOR
       Mike Gleason, NcFTP Software (http://www.ncftp.com).

SEE ALSO
       ncftpbatch(1), ncftp(1), ncftpput(1), ncftpget(1), uucp(1).

ncftpspooler                                NcFTP Software                            ncftpspooler(1)
