GRSYNC-BATCH(1)                                                                            grsync batch runner                                                                            GRSYNC-BATCH(1)

NAME
       GRSYNC-BATCH - Grsync batch session runner

SYNOPSIS
       grsync-batch [-f] [-d] [session_name|file_name]

DESCRIPTION
       GRSYNC-BATCH  is a script which can be used to automate rsync runs using grsync sessions (see man grsync).  for example it can be put into crontab for scheduled execution on terminal, and to get
       the results via email.

OPTIONS
       GRSYNC-BATCH by default loads the session you specify on the command line from your grsync.ini default configuration file. if you specify the -f option, it will be treated as a file name to load
       instead. in this case, only one session can be present in the file so there is no need to specify the session.  the -d option makes a dry-run, i.e. simulation (run but don't make any changes)

SEE ALSO
       Website <http://www.opbyte.it/grsync/>, grsync

AUTHOR
       GRSYNC was written by Piero Orsoni <info@opbyte.it>.

       This manual page was written by Piero Orsoni

0.6                                                                                             2007-07-18                                                                                GRSYNC-BATCH(1)
