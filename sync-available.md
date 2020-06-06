SYNC-AVAILABLE(8)                                                                     Debian administrator's manual                                                                     SYNC-AVAILABLE(8)

NAME
       sync-available - sync dpkg's available database with apt's database

SYNOPSIS
       sync-available

       sync-available --version

       sync-available --help

DESCRIPTION
       This program updates the dpkg(8) available database with the data in the apt(8) package database.  This is required for grep-available(1) and other similar programs to give up-to-date results.

       The same functionality is available through dselect(8), when it is configured to use apt(8) as its acquisition method.  However, this program does not require that dselect(8) is installed.

EXIT STATUS
       The program exits with status code 0 if all went well, and a non-zero status code otherwise.

OPTIONS
       --version
              Output the name and version of the program onto standard output stream.

       --help Give a brief usage statement on the standard output stream.

ENVIRONMENT
       TMPDIR The name of the directory where temporary files are created.  Default is /tmp.

AUTHOR
       The program and this manual page were written by Antti-Juhani Kaijanaho <ajk@debian.org>.

SEE ALSO
       grep-available(1), apt(8), dpkg(8), dselect(8)

Debian Project                                                                                  2005-07-11                                                                              SYNC-AVAILABLE(8)
