LOGTAIL(8)                                                        logtail manual                                                        LOGTAIL(8)

NAME
       logtail - print log file lines that have not been read

SYNOPSIS
       logtail [-t] -flogfile [-ooffsetfile]

DESCRIPTION
       logtail  reads  a specified file (usually a log file) and writes to the standard output that part of it which has not been read by previous
       runs of logtail.  It prints the appropriate number of bytes from the end of logfile, assuming that all changes that are made to it  are  to
       add new characters to it.

       logfile must be a plain file.  A symlink is not allowed.

       logtail stores the information about how much of it has already been read in a separate file called offsetfile.  offsetfile can be omitted.
       If omitted, the file named logfile.offset in the same directory which contains logfile is used by default.

       If offsetfile is not empty, the inode of logfile is checked.  If the inode is changed, logtail simply prints the entire file.  If the inode
       is not changed but logfile is shorter than it was at the last run of logtail, it writes a warning message to the standard output.

OPTIONS
       -f     logfile to be read after offset

       -o     offsetfile stores offset of previous run

       -t     test mode - do not change offset in offsetfile

RETURN VALUES
       0      successful

       65     cannot get the size of logfile

       66     logfile does not exist, is not a plain file, or is not readable

       73     cannot write offsetfile

AUTHOR
       The  original  logtail  was written in C by Craig H. Rowland <crowland@psionic.com>.  This version of logtail is a Perl reimplementation by
       Paul Slootman <paul@debian.org>.  Enhanced by the Debian Logcheck Team <logcheck-devel@lists.alioth.debian.org>.

       This manual was written by Oohara Yuuma <oohara@libra.interq.or.jp>.

SEE ALSO
       logcheck(8)

Debian                                                           Fri, 19 Nov 2004                                                       LOGTAIL(8)
