texlinks(8)                                                                                         teTeX                                                                                         texlinks(8)



NAME
       texlinks - maintain symbolic links from format to engine

SYNOPSIS
       texlinks [ OPTIONS... ]  DIRECTORIES...

DESCRIPTION
       texlinks is used to create or recreate symbolic links from formats to engines according to the information in fmtutil.cnf or a file specified with --cnffile.

       DIRECTORIES is an optional list of directories in which to operate.  If no directories are specified the list of directories depends on the --multiplatform option.

OPTIONS
       --cnffile FILE or -f FILE
              use file as configuration file (default: fmtutil.cnf)

       --help or -h
              show some help text

       --multiplatform or -m
              operate in all platform-specific directories (default: operate only in the directory for this platform)

       --silent or -s
              silently skip over existing scripts/binaries instead of printing a warning

       --unlink or -u
              Unlink previously created symlinks

       --verbose or -v
              +set verbose mode on (default: off)

FILES
       fmtutil.cnf
              default configuration file

SEE ALSO
       fmtutil(1), fmtutil.cnf(5)

       Web page: <http://tug.org/teTeX/>

BUGS
       None known, but report any bugs found to <tex-k@tug.org> (mailing list).

AUTHOR
       texlinks was written by Thomas Esser <te@dbs.uni-hannover.de> in 1999.  texlinks has been released into the public domain.

       This manual page was written by C.M. Connelly <c@eskimo.com>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mistakes or omissions in the
       manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).



teTeX                                                                                           November 2007                                                                                     texlinks(8)
