BINSTATS(1)                                                        Debian Manual                                                       BINSTATS(1)

NAME
       binstats - display statistics about programs and libraries

SYNOPSIS
       binstats  [-b[inaries]=bindirs]  [-d[ebug]]  [-s[kip-debian]  [-f[ile]=logfile]  [-l[ibraries]=libdirs] [-m[anuals]=mandirs] [-p[ath]=path]
       [-t[emp]=tmpdir]

       binstats -h[elp]

       binstats -v[ersion]

OPTIONS
       -binaries bindirs
              bindirs is a quoted list of whitespace delimited directories where programs should be searched for.

       -debug Store temporary files in the current directory and do not remove them when finished.

       -skip-debian
              Skip Debian tests that analyse installed packages even if this is a Debian system.

       -file logfile
              Output report to logfile instead of standard output.

       -help  Display a usage summary and exit.

       -libraries libdirs
              libdirs is a quoted list of whitespace delimited directories where libraries should be searched for.

       -manuals mandirs
              mandirs is a quoted list of whitespace delimited directories where manpages should be searched for.

       -path path
              Use the specified path instead of the value of the environment variable PATH.

       -temp tmpdir
              Store temporary files in tmpdir instead of the value of the environment variable TMPDIR, if defined, or /tmp.

       -version
              Output version information and exit.

AUTHOR
       Peter Chang <Peter.Chang@nottingham.ac.uk>.   This manual page was originally written by Matej Vela <vela@debian.org>.

Debian Project                                                   October 31, 1999                                                      BINSTATS(1)
