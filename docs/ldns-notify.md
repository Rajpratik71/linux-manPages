ldns-notify(1)                                                                             General Commands Manual                                                                             ldns-notify(1)



NAME
       ldns-notify - notify DNS servers that updates are available

SYNOPSIS
       ldns-notify [options] -z zone servers


DESCRIPTION
       ldns-notify  sends  a NOTIFY message to DNS servers. This tells them that an updated zone is available at the master servers. It can perform TSIG signatures and it can add a SOA serial number of the
       updated zone.  If a server already has that serial number it will disregard the message.


OPTIONS
       -z zone
              The zone that is updated.


       -h     Show usage and exit


       -v     Show the version and exit


       -s serial
              Append a SOA record indicating the serial number of the updated zone.


       -p port
              Use port as destination port (default the DNS port 53) for the UDP packets.


       -y key:data
              Use the given TSIG key and base64-data to sign the NOTIFY. Uses the hmac-md5 algorithm.


       -d     Print verbose debug information. The query that is sent and the query that is received.


       -r num Specify the maximum number of retries before notify gives up trying to send the UDP packet.


EXIT CODE
       The program exits with a 0 exit code if all servers replied an acknowledgement to the notify message, and a failure exit code otherwise.


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                  9 Jan 2007                                                                                   ldns-notify(1)
