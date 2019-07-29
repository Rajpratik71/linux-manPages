NBTSCAN(1)                                                    General Commands Manual                                                   NBTSCAN(1)

NAME
       nbtscan —  program for scanning networks for NetBIOS name information

SYNOPSIS
       nbtscan  [-v]   [-d]   [-e]   [-l]   [-t  timeout]   [-b  bandwidth]   [-r]   [-q]   [-s separator]  [-h]  [-m retransmits]  [-f filename |
       scan_range]

DESCRIPTION
       This manual page documents briefly the nbtscan command.

       This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.

       nbtscan is a program for scanning IP networks for NetBIOS name information. It sends NetBIOS status query to each address in supplied range
       and  lists  received information in human readable form. For each responded host it lists IP address, NetBIOS computer name, logged-in user
       name and MAC address (such as Ethernet).

OPTIONS
       A summary of options is included below.

       -v        Verbose output. Print all names received from each host.

       -d        Dump packets. Print whole packet contents. Cannot be used with -v, -s or -h options.

       -e        Format output in /etc/hosts format.

       -l        Format output in lmhosts format. Cannot be used with -v, -s or -h options.

       -t timeout
                 Wait timeout seconds for response. Default 1.

       -b bandwidth
                 Output throttling. Slow down output so that it uses no more that bandwidth bps.  Useful on slow links, so  that  ougoing  queries
                 don't get dropped.

       -r        Use local port 137 for scans. Win95 boxes respond to this only.  You need to be root to use this option.

       -q        Suppress banners and error messages.

       -s separator
                 Script-friendly output. Don't print column and record headers, separate fields with separator.

       -h        Print human-readble names for services.  Can only be used with -v option.

       -m retransmits
                 Number of retransmits. Default 0.

       -f filename
                 Take IP addresses to scan from file "filename"

       scan_range
                 What  to  scan.  Can  either  be  single  IP  like  192.168.1.1  or range of addresses in one of two forms: xxx.xxx.xxx.xxx/xx or
                 xxx.xxx.xxx.xxx-xxx.

BUGS
       Report bugs to alla@sovlink.ru (that's autor of nbtscan). I cannot promise to do anything but I might well want fix it. Remember:  no  war‐
       ranty.  At least it's worth what you payed for it.

AUTHOR
       This  manual  page  was  written by Ryszard Lach rla@debian.org for the Debian GNU/Linux system (but may be used by others) and is based on
       nbtscan author's README file.  Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free  Docu‐
       mentation License, Version 1.1 or any later version published by the Free Software Foundation.

                                                                                                                                        NBTSCAN(1)
