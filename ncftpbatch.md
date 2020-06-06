ncftpbatch(1)                          General Commands Manual                          ncftpbatch(1)

NAME
       ncftpbatch - Individual batch FTP job processor

SYNOPSIS
       ncftpbatch -d

       ncftpbatch -l

       ncftpbatch -D

OPTIONS
   Command line flags:
       -d      Begin  background  processing  of  FTP  jobs  in the current user's $HOME/.ncftp/spool
               directory.  This returns immediately, because a daemon process is spawned and  ran  in
               the background.

       -l      Lists the contents of the user's job queue.

       -D      This is like -d, except that the process does not become a daemon.

DESCRIPTION
       This  program  is responsible for processing background FTP requests.  It is normally only run
       by ncftp and not manually by a human being, however you can run it to manually process the FTP
       job queue.

       The  jobs  are spool files written to a user's $HOME/.ncftp/spool directory and have a special
       format and file-naming convention (which contains when the job is to be run).  ncftp runs this
       program  when  it  needs  to, but if the ncftpbatch daemon dies unexpectedly the jobs that are
       left in the queue will not be processed until another instance of ncftpbatch is run.

       ncftpget and ncftpput can also be used to submit jobs for batch processing, using those utili‐
       ties' -b command-line flag.  If desired, you can also manually create the spool files although
       this procedure is not documented here (see the manual page for ncftpspooler for more  informa‐
       tion on how to do that).

DIAGNOSTICS
       ncftpbatch  writes  to its own log file, the $HOME/.ncftp/spool/log file.  This file should be
       examined to determine if any ncftpbatch processes are actively working on jobs.

AUTHOR
       Mike Gleason, NcFTP Software (http://www.ncftp.com).

SEE ALSO
       ncftp(1), ncftpput(1), ncftpget(1).

ncftpbatch                                  NcFTP Software                              ncftpbatch(1)
