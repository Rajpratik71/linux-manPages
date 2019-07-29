UNICORNSCAN(1)                                                    Network Tools                                                     UNICORNSCAN(1)

NAME
       unicornscan Version 0.4.6b is a asynchronous network stimulus delivery/response recoring tool.

SYNOPSIS
       unicornscan  [-b, --broken-crc layer] [-B, --source-port port] [-d, --delay-type type] [-D, --no-defpayload ] [-e, --enable-module modules]
       [-E, --proc-errors ] [-F, --try-frags ] [-G, --payload-group group] [-h, --help ] [-H, --do-dns ] [-i, --interface interface] [-I,  --imme‐
       diate  ]  [-j,  --ignore-seq  ignore]  [-l, --logfile file] [-L, --packet-timeoutdelay] [-m, --mode mode] [-M, --module-dir directory] [-p,
       --ports string] [-P, --pcap-filter filter] [-q, --covertness covertness] [-Q, --quiet ] [-r,  --pps  rate]  [-R,  --repeats  repeats]  [-s,
       --source-addr address] [-S, --no-shuffle ] [-t, --ip-ttl TTL] [-T, --ip-tos TOS] [-w, --safefile file] [-W, --fingerprint fingerprint] [-v,
       --verbose ] [-V, --version ] [-z, --sniff ] [-Z, --drone-type type] target list

DESCRIPTION
       unicornscan: ...

OPTIONS
       [-b, --broken-crc Layer]
               Break CRC sums on the following layers. N and T are valid, and both may be used without separator, so NT would indicate  both  Net‐
              work and Transport layers are to have invalid checksums.

       [-B, --source-port Port]
               Source  port for sent packets, numeric value -1 means to use a random source port (the default situation), and other valid settings
              are 0 to 65535. normally this option will not be used, but sometimes it is useful to say scan from port 53 into a network.

       [-d, --delay-type Type]
               Specify the timer used for pps calculations, the default is variable and will try and use something appropriate for  the  rate  you
              have  selected.  Note however, if available, the tsc timer and the gtod timer are very CPU intensive.  if you require unicornscan to
              not monopolize your system while running, consider using the sleep timer, normally 3.  it has been observed that the tsc  timer  and
              gtod  timer are required for high packet rates, however this is highly system dependent, and should be tested on each hardware/plat‐
              form combination. The tsc timer may not be available on every cpu. The sleep timer module is not recommended for scans where  utmost
              accuracy is required.

       [-D, --no-defpayload ]
               Do not use default payloads when one cannot be found.

       [-e, --enable-module List]
               A  comma  separated  list  of modules to activate (note: payload modules do not require explicit activation, as they are enabled by
              default). an example would be `pgsqldb,foomod'.

       [-E, --proc-errors ]
               Enable processing of errors such as icmp error messages and reset+ack messages (for example). If this option is set then  you  will
              see responses that may or may not indicate the presence of a firewall, or other otherwise missed information.

       [-F, --try-frags ]
               It is likely that this option doesn't work, don't bother using it until it is fixed.

       [-G, --payload-group Group]
               activate payloads only from this numeric payload group. The default payload group is 1.

       [-h, --help ]
               if you don't know what this means, perhaps you should consider not using this program.

       [-H, --do-dns ]
               Resolve  dns  hostnames before and after the scan (but not during, as that would likely cause superfluous spurious responses during
              the scan, especially if udp scanning). the hosts that will be resolved are (in order of resolution) the low and  high  addresses  of
              the  range,  and  finally  each host address that replied with something that would be visible depending on other scan options. This
              option is not recommended for use during scans where utmost accuracy is required.

       [-i, --interface Interface]
               string representation of the interface to use, overriding automatic detection.

       [-I, --immediate ]
               Display results immediately as they are found in a sort of meta report format (read: terse). This option is not recommended for use
              during scans where the utmost accuracy is required.

       [-j, --ignore-seq Type]
               A string representing the intended sequence ignorance level. This affects the tcp header validity checking, normally used to filter
              noise from the scan. If for example you wish to see reset packets with an ack+seq that is not set or perhaps intended for  something
              else appropriate use of this option would be R. A is normally used for more exotic tcp scanning. normally the R option is associated
              with reset scanning.

       [-l, --logfile File]
               Path to a file where flat text will be dumped that normally would go to the users terminal. A limitation of this  option  currently
              is that it only logs the output of the `Main' thread and not the sender and receiver.

       [-L, --packet-timeout Seconds]
               Numeric  value  representing  the number of seconds to wait before declaring the scan over. for connect scans sometimes this option
              can be adjusted to get more accurate results, or if scanning a high-latency target network; for example.

       [-m, --mode Mode]
               String representation of the desired scanning mode. Correct usage includes U, T, A and sf for Udp scanning, Tcp scanning, Arp scan‐
              ning, and Tcp Connect scanning respectively.

       [-M, --module-dir Directory]
               Path to a directory containing shared object `modules' for unicornscan to search.

       [-p, --ports Ports]
               A global list of ports to scan, can be overridden in the target specification on a per target basis.

       [-P, --pcap-filter Filter]
               A pcap filter string to add to the listeners default pcap filter (that will be associated with the scan mode being used).

       [-c, --covertness Level]
               Numeric option that currently does nothing, except look cool.

       [-Q, --quiet ]
               This  option is intended to make unicornscan play the `quiet game'. If you are unfamiliar with its rules, consult with someone else
              who finds you irritating.

       [-r, --pps Rate]
               This is arguably the most important option, it is a numeric option containing the desired packets per second for the sender to use.
              choosing  a rate too high will cause your scan results to be incomplete. choosing a rate too low will likely make you feel as though
              you are using nmap.

       [-R, --repeats Times]
               The number of times to completely repeat the senders workload, this option is intended to improve accuracy during  critical  scans,
              or with scans going over a highly unreliable network.

       [-s, --source-addr Address]
               The address to use to override the listeners default interfaces address. using this option often necessitates using the helper pro‐
              gram fantaip(1) to make sure the replies are routed back to the interface the listener has open.

       [-S, --no-shuffle ]
               ..

       [-t, --ip-ttl Number]
               ..

       [-T, --ip-tos Number]
               ..

       [-w, --savefile File]
               ..

       [-W, --fingerprint Type]
               ..

       [-v, --verbose ]
               ..

       [-V, --version ]
               ..

       [-z, --sniff ]
               ..

       [-Z, --drone-type Type]
               ..

EXAMPLES
       unicornscan -msf -s 5.4.3.2 -r 340 -Iv -epgsqldb www.domain.tld/21:80,8080,443,81 runs unicornscan in connect mode with an apparent (to the
       target)  source  address of 5.4.3.2 at a rate of 340 packets per second. results will be displayed as they are found -I and the output will
       be verbose -v.  The module `pgsqldb' will be activated -epgsqldb  and  the  target  of  this  scan  will  be  the  /21  network  that  host
       www.domain.tld belongs to making attempts to connect to port 80, 8080, 443 and 81.

FILES
       unicorn.conf
               The file containing the default configuration options for usage.

       modules.conf
               The default file for module parameters.

       oui.txt
               Contains the MAC prefix to vendor mapping used in Ethernet scanning.

       payloads.conf
               The default file for tcp and udp payloads.

       ports.txt
               The protocol/port number to name mapping.

SEE ALSO
       fantaip(1) unicfgtst(1) unicycle(1) unibrow(1) unicorn.conf(5)

REPORTING BUGS
       Report Bugs to osace-users@lists.sourceforge.net

COPYRIGHT
       (C)2004  Jack  Louis  jack@rapturesecurity.org This is free software; see the source for copying conditions. There is NO warranty; not even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Network Tools                                                        03/30/05                                                       UNICORNSCAN(1)
