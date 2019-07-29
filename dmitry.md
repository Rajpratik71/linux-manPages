DMitry(1)                                                     General Commands Manual                                                    DMitry(1)

NAME
       DMitry - Deepmagic Information Gathering Tool

SYNOPSIS
       dmitry [Options] host

DESCRIPTION
       DMitry  (Deepmagic Information Gathering Tool) is a UNIX/(GNU)Linux command line application with the ability to gather as much information
       as possible about a host.

       Basic functionality of DMitry allows for information to be gathered about a target host from a simple whois lookup on the target to  uptime
       reports and TCP portscans.

       The  application is considered a tool to assist in information gathering when information is required quickly by removing the need to enter
       multiple commands and the timely process of searching through data from multiple sources.

OPTIONS
       Options should be passed to DMitry in the form of '-option'.  Only options known by DMitry will be used and others  will  be  ignored.   If
       options are not passed as a group block, the trailing options will be considered a host target.

       -o filename
              Create  an ascii text output of the results to the filename specified.  If no output filename is specified then output will be saved
              to "target.txt".  If this option is not specified in any form output will be sent to the standard output (STDOUT) by default.   This
              option MUST trail all other options, i.e. "dmitry -winseo target".

       -i     Perform an Internet Number whois lookup on the target IP address.

       -w     Perform a whois lookup on the host target.

       -n     Retrieve  netcraft.com  data  concerning  the  host, this includes operating system, web server release and uptime information where
              available.

       -s     Perform a subdomain search on the specified target.  This will use serveral search engines to attempt to locate  subdomains  in  the
              form  of sub.target.  There is no set limit to the level of subdomain that can be located, however, there is a maximum string length
              of 40 characters (NCOL 40) to limit memory usage.  Possible subdomains are then reversed to an IP address, if this comes back  posi‐
              tive then the resulting subdomain is listed.  However, if the host uses an asterisk in their DNS records all resolve subdomains will
              come back positive.

       -e     Perform an e-mail address search on the specified target.  This modules works using the same concept  as  the  subdomain  search  by
              attempting  to  locate possible e-mail addresses for a target host.  The e-mail addresses may also be for possible subdomains of the
              target host. There is a limit to the length of the e-mail address set to 50 characters (NCOL 50) to limit memory usage.

       -p     Perform a TCP portscan on the host target. This module will list open, closed and filtered ports within a specific range.

       -f     This option will cause the TCP portscan module to report/display output of filtered ports.  These are usually ports that  have  been
              filtered  and/or closed by a firewall at the specified host/target.  This option requires that the '-p' option be passed as a previ‐
              ous option.  For example, "dmitry -pf target".

       -b     This option will cause the TCP portscan module to output banners if they are received when scanning TCP ports.  This option requires
              that the '-p' option be passed as a previous option.  For example, "dmitry -pb target".

       -t     This  sets the Time To Live (TTL) of the portscan module when scanning individual ports.  This is set to 2 seconds by default.  This
              is usually required when scanning a host that has a firewall and/or has filtered ports which can slow down a scan.

EXAMPLES
       This section presents some example queries that can be made using dmitry.

       dmitry -w mydomain.com

       This will perform a named whois (INIC-WHOIS) lookup on the target host, displaying results to the standard output (STDOUT).

       dmitry -winsepo sometextfile.txt mydomain.com

       This will perform all the basic functions on the target host and store all the output into "sometextfile.txt".

       dmitry -winsepo mydomain.com

       This will perform all the basic functions on the target host and store all the output into "mydomain.txt".

       dmitry -winsepfbo 127.0.0.1

       This will perform all the basic functions on the target host and store all the output into "127.0.0.1.txt".  This will also display banners
       and show filtered ports.

AUTHOR
       This manual page was written by Runa Sandvik <runa.sandvik@gmail.com>, for the Debian GNU/Linux system (but may be used by others).

                                                                                                                                         DMitry(1)
