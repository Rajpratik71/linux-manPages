SAVELOG(8)                              System Manager's Manual                             SAVELOG(8)

NAME
       savelog - save a log file

SYNOPSIS
       savelog [-m mode] [-u user] [-g group] [-t] [-p] [-c cycle] [-l] [-j] [-J] [-1 .. -9] [-C] [-d]
       [-l] [-r rolldir] [-n] [-q] [-D dateformat] file ...

DESCRIPTION
       The savelog command saves and optionally compresses old copies of  files.   Older  versions  of
       file are named:

              file.<number><compress_suffix>

       where  <number>  is the version number, 0 being the newest.  Version numbers > 0 are compressed
       unless -l prevents it.  Version number 0 is not compressed because a process might  still  have
       file opened for I/O.  Only cycle versions of the file are kept.

       If the file does not exist and -t was given, it will be created.

       For  files  that  do  exist  and have lengths greater than zero, the following actions are per‐
       formed:

       1)     Version numbered files are cycled.  Version file.2 is moved to version  file.3,  version
              file.1  is  moved to version file.2, and so on.  Finally version file.0 is moved to ver‐
              sion file.1, and version file is deleted.  Both compressed names and uncompressed  names
              are cycled, regardless of -l.  Missing version files are ignored.

       2)     The new file.1 is compressed unless the -l flag was given.  It is changed subject to the
              -m, -u, and -g flags.

       3)     The main file is moved to file.0.

       4)     If the -m, -u, -g,  -t, or -p flags are given, then an empty file is created subject  to
              the  given flags.  With the -p flag, the file is created with the same owner, group, and
              permissions as before.

       5)     The new file.0 is changed subject to the -m, -u, and -g flags.

OPTIONS
       -m mode
              chmod the log files to mode, implies -t

       -u user
              chown log files to user, implies -t

       -g group
              chgrp log files to group, implies -t

       -c cycle
              Save cycle versions of the logfile (default: 7). The cycle count must be at least 2.

       -t     touch new logfile into existence

       -l     don't compress any log files (default: do compress)

       -p     preserve owner, group, and permissions of logfile

       -j     compress with bzip2 instead of gzip

       -J     compress with xz instead of gzip

              For xz no strength option is set, and xz decides on  the  default  based  on  the  total
              amount  of  physical  RAM.  Note  that  xz can use a very large amount of memory for the
              higher compression levels.

       -1 .. -9
              compression strength or memory usage (default: 9, except for xz)

       -C     force cleanup of cycled logfiles

       -d     use standard date for rolling

       -D dateformat
              override date format, in the syntax understood by the date(1) command

       -r     use rolldir instead of . to roll files

       -n     do not rotate empty files

       -q     be quiet

BUGS
       If a process is still writing to file.0, and savelog moves it to file.1 and compresses it, data
       could be lost.

SEE ALSO
       logrotate(8)

Debian                                        30 Dec 2017                                   SAVELOG(8)
