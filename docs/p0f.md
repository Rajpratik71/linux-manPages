P0F(1)                                                        General Commands Manual                                                       P0F(1)

NAME
       p0f - identify remote systems passively

SYNOPSIS
       p0f  p0f  [ -f file ] [ -i device ] [ -r file ] [ -o file ] [ -s socket ] [ -u user ] [ -S limit ] [ -t c,h ] [ -m c,h ] [ -pdL ] [ 'filter
       rule' ]

DESCRIPTION
       p0f uses a fingerprinting technique based on analyzing the structure of a TCP/IP packet to determine the operating system and other config‐
       uration properties of a remote host. The process is completely passive and does not generate any suspicious network traffic. The other host
       has to either:

       - connect to your network - either spontaneously or in an induced manner, for example when trying to establish a ftp data stream, returning
       a bounced mail, performing auth lookup, using IRC DCC, external html mail image reference and so on,

       -  or  be  contacted  by some entity on your network using some standard means (such as a web browsing); it can either accept or refuse the
       connection.

       The method can see thru packet firewalls and does not have the restrictions of an active fingerprinting. The main uses of passive  OS  fin‐
       gerprinting  are attacker profiling (IDS and honeypots), visitor profiling (content optimization), customer/user profiling (policy enforce‐
       ment), pen-testing, etc.

OPTIONS
       -f file
              read fingerprints from file; by default, p0f reads signatures from ./p0f.fp or /etc/p0f/p0f.fp (the latter on  Unix  systems  only).
              You can use this to load custom fingerprint data.  Specifying multiple -f values will NOT combine several signature files together.

       -i device
              listen  on this device; p0f defaults to whatever device libpcap considers to be the best (and which often isn't). On some newer sys‐
              tems you might be able to specify 'any' to listen on all devices, but don't rely on this. Specifying multiple  -i  values  will  NOT
              cause p0f to listen on several interfaces at once.

       -r file
              read  packets  from tcpdump snapshot; this is an alternate mode of operation, in which p0f reads packet from pcap data capture file,
              instead of a live network. Useful for forensics (this will parse tcpdump -w output, for example).

              You can use Ethereal's text2pcap to convert human-readable packet traces to pcap files, if needed.

       -o file
              write to this logfile. This option is required for -d and implies -t.

       -s socket
              listen on a specified local stream socket (a filesystem object, for example /var/run/p0f-sock) for queries. One  can  later  send  a
              packet to this socket with p0f_query structure from p0f-query.h, and wait for p0f_response. This is a method of integrating p0f with
              active services (web server or web scripts, etc). P0f will still continue to report signatures the usual way - but you can use  -qKU
              combination to suppress this. Also see -c notes.

              A sample query tool (p0f-client) is provided in the tools/ subdirectory.

              NOTE: The socket will be created with permissions corresponding to your current umask. If you want to restrict access to this inter‐
              face, use caution.

       -u user
              this option forces p0f to chroot to this user's home directory after reading configuration data and  binding  to  sockets,  then  to
              switch to his UID, GID and supplementary groups.

              This is a security feature for the paranoid - when running p0f in daemon mode, you might want to create a new unprivileged user with
              an empty home directory, and limit the exposure when p0f is compromised. That said, should such a  compromise  occur,  the  attacker
              will still have a socket he can use for sniffing some network traffic (better than rm -rf /).

       -p     switch  card to promiscuous mode; by default, p0f listens only to packets addressed or routed thru the machine it runs on. This set‐
              ting might decrease performance, depending on your network design and load. On switched networks, this  usually  has  little  or  no
              effect.

              Note  that  promiscuous  mode on IP-enabled interfaces can be detected remotely, and is sometimes not welcome by network administra‐
              tors.

       -d     go into daemon mode (detach from current terminal and fork into background). Requires -o or -s.

       -L     lists all available interfaces, then quits. Particularly useful on Windows, where the system-generated interface names are  impossi‐
              ble to memorize.

       -S limit
              Limit number of parallel API connections (default: 20)

       -t c,h Set connection / host cache age limits (default: 30s,120m)

       -m c,h Limit the number of active connections / hosts (default: 1000,10000)

FILTERS
       The  last  part, 'filter rule', is a bpf-style filter expression for incoming packets. It is very useful for excluding or including certain
       networks, hosts, or specific packets, in the logfile. See man tcpdump for more information, few examples:

       ´src port ftp-data´

       ´not dst net 10.0.0.0 mask 255.0.0.0´

       ´dst port 80 and ( src host 195.117.3.59 or src host 217.8.32.51 )´

BUGS
       You need to consult the documentation for an up-to-date list of issues.

FILES
       /etc/p0f/p0f.fp
              default fingerprint database file

AUTHOR
       p0f was written by Michal Zalewski <lcamtuf@coredump.cx>.  This man page was originally written by  William  Stearns  <wstearns@pobox.com>,
       then adopted for p0f v2 by Michal Zalewski, and p0f v3 by Pierre Chifflier.

                                                                                                                                            P0F(1)
