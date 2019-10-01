UTMPDUMP(1)                                                                                 System Administration                                                                                 UTMPDUMP(1)



NAME
       utmpdump - dump UTMP and WTMP files in raw format

SYNOPSIS
       utmpdump [-frh] [ filename ]

DESCRIPTION
       utmpdump is a simple program to dump UTMP and WTMP files in raw format, so they can be examined.  utmpdump eads from stdin unless a filename is passed.

OPTIONS
       -f, --follow
              Output appended data as the file grows.

       -r, --reverse
              Undump, write back edited login information into utmp or wtmp files.

       -h, --help
              Print a help text and exit.

       -V, --version
              Output version information and exit.

NOTES
       utmpdump can be useful in cases of corrupted utmp or wtmp entries.  It can dump out utmp/wtmp to an ASCII file, then that file can be edited to remove bogus entries and reintegrated, using

              utmpdump -r < ascii_file > wtmp

       but be warned as utmpdump was written for debugging purpose only.

BUGS
       You may not use the option -r as the format for the utmp/wtmp files strongly depends on the input format.  This tool was not written for normal use but for debugging.

AUTHOR
       Michael Krapp

SEE ALSO
       last(1), w(1), who(1), utmp(5)

AVAILABILITY
       The utmpdump command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.



util-linux                                                                                        July 2012                                                                                       UTMPDUMP(1)
