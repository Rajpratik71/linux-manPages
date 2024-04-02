LOGTAIL(8)                                                        logtail2 manual                                                       LOGTAIL(8)

NAME
       logtail2 - print log file lines that have not been read

SYNOPSIS
       logtail2 [-t] -flogfile [-ooffsetfile]

DESCRIPTION
       logtail2  reads a specified file (usually a log file) and writes to the standard output that part of it which has not been read by previous
       runs of logtail2.  It prints the appropriate number of bytes from the end of logfile, assuming that all changes that are made to it are  to
       add new characters to it.

       logfile must be a plain file.  A symlink is not allowed.

       logtail2  stores  the information about how much of it has already been read in a separate file called offsetfile.  offsetfile can be omit‐
       ted.  If omitted, the file named logfile.offset in the same directory which contains logfile is used by default.

       If offsetfile is not empty, the inode of  logfile  is  checked.   If  the  inode  is  changed,  logtail2  uses  the  heuristics  stored  in
       /usr/share/logtail/detectrotate/  to  find  a file that might be the rotated logfile and prints it starting with the stored offset. It then
       proceeds to simply print the entire new file and generates a new offsetfile.  If the inode is not changed but logfile is  shorter  than  it
       was at the last run of logtail2, it writes a warning message to the standard output.

OPTIONS
       -f     logfile to be read after offset

       -o     offsetfile stores offset of previous run

       -t     test mode - do not change offset in offsetfile

RETURN VALUES
       0      successful

       65     cannot get the size of logfile

       66     general file or directory access issue

       73     cannot write offsetfile

AUTHOR
       The original logtail was written in C by Craig H. Rowland <crowland@psionic.com>.  This version of logtail is a modification of Paul Sloot‐
       man's re-implementation in perl.  enhanced by the Debian Logcheck Team <logcheck-devel@lists.alioth.debian.org>.

       This   manual   was   written   by   Oohara   Yuuma   <oohara@libra.interq.or.jp>   and   enhanced   by   the    Debian    Logcheck    Team
       <logcheck-devel@lists.alioth.debian.org>..

SEE ALSO
       logcheck(8)

Debian                                                              28 Jul 2007                                                         LOGTAIL(8)
