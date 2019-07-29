ITOX(8)                                                                                    System Manager's Manual                                                                                    ITOX(8)



NAME
       itox - converts inetd.conf style configuration files to xinetd.conf

SYNOPSIS
       itox [-daemon_dir <dir_path>]

DESCRIPTION
       itox takes on its standard input inetd.conf style entries and dumps to standard output the corresponding xinetd.conf style entries.

OPTIONS
       -daemon_dir <dir_path>
              Specifies the file name of the TCP daemon used in the inetd.conf file.

EXAMPLES
       itox -daemon_dir /usr/sbin/tcpd < inetd.conf > xinetd.conf

AUTHOR
       xinetd and itox were written by Panagiotis Tsirigotis.

       This man page was written by Norbert Veber <nveber@debian.org>.



xinetd                                                                                           October 1999                                                                                         ITOX(8)
