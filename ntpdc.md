ntpdc(8)                                                                                   System Manager's Manual                                                                                   ntpdc(8)



NAME
       ntpdc - special NTP query program


SYNOPSIS
       ntpdc [ -46dilnps ] [ -c command ] [ host ] [ ... ]


DESCRIPTION
       ntpdc  is  used  to  query the ntpd daemon about its current state and to request changes in that state. The program may be run either in interactive mode or controlled using command line arguments.
       Extensive state and statistics information is available through the ntpdc interface. In addition, nearly all the configuration options which can be specified at startup  using  ntpd's  configuration
       file may also be specified at run time using ntpdc.

       If  one or more request options are included on the command line when ntpdc is executed, each of the requests will be sent to the NTP servers running on each of the hosts given as command line argu‐
       ments, or on localhost by default. If no request options are given, ntpdc will attempt to read commands from the standard input and execute these on the NTP server running on the first host given on
       the command line, again defaulting to localhost when no other host is specified. ntpdc will prompt for commands if the standard input is a terminal device.

       ntpdc  uses  NTP  mode  7 packets to communicate with the NTP server, and hence can be used to query any compatible server on the network which permits it. Note that since NTP is a UDP protocol this
       communication will be somewhat unreliable, especially over large distances in terms of network topology. ntpdc makes no attempt to retransmit requests, and will time requests out if the remote  host
       is not heard from within a suitable timeout time.

       The  operation  of  ntpdc  are specific to the particular implementation of the ntpd daemon and can be expected to work only with this and maybe some previous versions of the daemon. Requests from a
       remote ntpdc program which affect the state of the local server must be authenticated, which requires both the remote program and local server share a common key and key identifier.

       Note that in contexts where a host name is expected, a -4 qualifier preceding the host name forces DNS resolution to the IPv4 namespace, while a -6 qualifier forces DNS resolution to the IPv6 names‐
       pace.


COMMAND LINE OPTIONS
       Specifying  a command line option other than -i or -n will cause the specified query (queries) to be sent to the indicated host(s) immediately. Otherwise, ntpdc will attempt to read interactive for‐
       mat commands from the standard input.


       -4      Force DNS resolution of following host names on the command line to the IPv4 namespace.

       -6      Force DNS resolution of following host names on the command line to the IPv6 namespace.

       -c command
               The following argument is interpreted as an interactive format command and is added to the list of commands to be executed on the specified host(s). Multiple -c options may be given.

       -d      Turn on debugging mode.

       -i      Force ntpdc to operate in interactive mode. Prompts will be written to the standard output and commands read from the standard input.

       -l      Obtain a list of peers which are known to the server(s). This switch is equivalent to -c listpeers.

       -n      Output all host addresses in dotted-quad numeric format rather than converting to the canonical host names.

       -p      Print a list of the peers known to the server as well as a summary of their state. This is equivalent to -c peers.

       -s      Print a list of the peers known to the server as well as a summary of their state, but in a slightly different format than the -p switch. This is equivalent to -c dmpeers.


INTERACTIVE COMMANDS
       Interactive format commands consist of a keyword followed by zero to four arguments. Only enough characters of the full keyword to uniquely identify the command need be typed. The output of  a  com‐
       mand is normally sent to the standard output, but optionally the output of individual commands may be sent to a file by appending a <, followed by a file name, to the command line.

       A number of interactive format commands are executed entirely within the ntpdc program itself and do not result in NTP mode 7 requests being sent to a server. These are described following.


       ? [ command_keyword ]

       help [ command_keyword ]
               A  ? by itself will print a list of all the command keywords known to this incarnation of ntpq. A ? followed by a command keyword will print function and usage information about the command.
               This command is probably a better source of information about ntpq than this manual page.

       delay milliseconds
               Specify a time interval to be added to timestamps included in requests which require authentication. This is used to enable (unreliable) server reconfiguration over long delay network  paths
               or between machines whose clocks are unsynchronized. Actually the server does not now require timestamps in authenticated requests, so this command may be obsolete.

       host hostname
               Set the host to which future queries will be sent. Hostname may be either a host name or a numeric address.

       hostnames [ yes | no ]
               If  yes is specified, host names are printed in information displays. If no is specified, numeric addresses are printed instead. The default is yes, unless modified using the command line -n
               switch.

       keyid keyid
               This command allows the specification of a key number to be used to authenticate configuration requests from ntpdc to the host(s). This must correspond to a key number which the  host/server
               has  been configured to use for this purpose (server options: trustedkey, and requestkey). If authentication is not enabled on the host(s) for ntpdc commands, the command "keyid 0" should be
               given; otherwise the keyid of the next subsequent addpeer/addserver/broadcast  command will be used.

       quit    Exit ntpdc.

       passwd  This command prompts you to type in a password (which will not be echoed) which will be used to authenticate configuration requests. The password must correspond to the  key  configured  for
               use by the NTP server for this purpose if such requests are to be successful.

       timeout milliseconds
               Specify  a timeout period for responses to server queries. The default is about 8000 milliseconds. Note that since ntpdc retries each query once after a timeout, the total waiting time for a
               timeout will be twice the timeout value set.


CONTROL MESSAGE COMMANDS
       Query commands result in NTP mode 7 packets containing requests for information being sent to the server. These are read-only commands in that they make no modification of the  server  configuration
       state.


       listpeers
               Obtains  and  prints  a  brief list of the peers for which the server is maintaining state. These should include all configured peer associations as well as those peers whose stratum is such
               that they are considered by the server to be possible future synchronization candidates.

       peers   Obtains a list of peers for which the server is maintaining state, along with a summary of that state. Summary information includes the address  of  the  remote  peer,  the  local  interface
               address (0.0.0.0 if a local address has yet to be determined), the stratum of the remote peer (a stratum of 16 indicates the remote peer is unsynchronized), the polling interval, in seconds,
               the reachability register, in octal, and the current estimated delay, offset and dispersion of the peer, all in seconds.  The character in the left margin indicates the mode this peer  entry
               is  operating  in. A + denotes symmetric active, a - indicates symmetric passive, a = means the remote server is being polled in client mode, a ^ indicates that the server is broadcasting to
               this address, a ~ denotes that the remote peer is sending broadcasts and a * marks the peer the server is currently synchronizing to.

               The contents of the host field may be one of four forms. It may be a host name, an IP address, a reference clock implementation name  with  its  parameter  or  REFCLK(implementation  number,
               parameter). On hostnames no only IP-addresses will be displayed.


       dmpeers A slightly different peer summary list. Identical to the output of the peers command, except for the character in the leftmost column. Characters only appear beside peers which were included
               in the final stage of the clock selection algorithm. A . indicates that this peer was cast off in the falseticker detection, while a + indicates that the peer made it through.  A  *  denotes
               the peer the server is currently synchronizing with.

       showpeer peer_address [...]
               Shows a detailed display of the current peer variables for one or more peers. Most of these values are described in the NTP Version 2 specification.

       pstats peer_address [...]
               Show per-peer statistic counters associated with the specified peer(s).

       clockinfo clock_peer_address [...]
               Obtain and print information concerning a peer clock. The values obtained provide information on the setting of fudge factors and other clock performance information.

       kerninfo
               Obtain and print kernel phase-lock loop operating parameters. This information is available only if the kernel has been specially modified for a precision timekeeping function.

       loopinfo [ oneline | multiline ]
               Print the values of selected loop filter variables. The loop filter is the part of NTP which deals with adjusting the local system clock. The offset is the last offset given to the loop fil‐
               ter by the packet processing code. The frequency is the frequency error of the local clock in parts-per-million (ppm). The time_const controls the stiffness of the phase-lock loop  and  thus
               the  speed at which it can adapt to oscillator drift. The watchdog timer value is the number of seconds which have elapsed since the last sample offset was given to the loop filter. The one‐
               line and multiline options specify the format in which this information is to be printed, with multiline as the default.

       sysinfo Print a variety of system state variables, i.e., state related to the local server. All except the last four lines are described in the NTP Version 3  specification,  RFC-1305.   The  system
               flags show various system flags, some of which can be set and cleared by the enable and disable configuration commands, respectively. These are the auth, bclient, monitor, pll, pps and stats
               flags. See the ntpd documentation for the meaning of these flags. There are two additional flags which are read only, the kernel_pll and kernel_pps. These flags indicate the  synchronization
               status  when  the  precision time kernel modifications are in use. The kernel_pll indicates that the local clock is being disciplined by the kernel, while the kernel_pps indicates the kernel
               discipline is provided by the PPS signal.

               The stability is the residual frequency error remaining after the system frequency correction is applied and is intended for maintenance and debugging. In most architectures, this value will
               initially  decrease  from as high as 500 ppm to a nominal value in the range .01 to 0.1 ppm. If it remains high for some time after starting the daemon, something may be wrong with the local
               clock, or the value of the kernel variable tick may be incorrect.

               The broadcastdelay shows the default broadcast delay, as set by the broadcastdelay configuration command.

               The authdelay shows the default authentication delay, as set by the authdelay configuration command.


       sysstats
               Print statistics counters maintained in the protocol module.

       memstats
               Print statistics counters related to memory allocation code.

       iostats Print statistics counters maintained in the input-output module.

       timerstats
               Print statistics counters maintained in the timer/event queue support code.

       reslist Obtain and print the server's restriction list. This list is (usually) printed in sorted order and may help to understand how the restrictions are applied.

       ifstats List interface statistics for interfaces used by ntpd for network communication.

       ifreload
               Force rescan of current system interfaces. Outputs interface statistics for interfaces that could possibly change. Marks unchanged interfaces with ., added  interfaces  with  +  and  deleted
               interfaces with -.

       monlist [ version ]
               Obtain and print traffic counts collected and maintained by the monitor facility. The version number should not normally need to be specified.

       clkbug clock_peer_address [...]
               Obtain debugging information for a reference clock driver. This information is provided only by some clock drivers and is mostly undecodable without a copy of the driver source in hand.


RUNTIME CONFIGURATION REQUESTS
       All  requests  which  cause state changes in the server are authenticated by the server using a configured NTP key (the facility can also be disabled by the server by not configuring a key). The key
       number and the corresponding key must also be made known to ntpdc. This can be done using the keyid and passwd commands, the latter of which will prompt at the terminal for a password to use as  the
       encryption key. You will also be prompted automatically for both the key number and password the first time a command which would result in an authenticated request to the server is given. Authenti‐
       cation not only provides verification that the requester has permission to make such changes, but also gives an extra degree of protection again transmission errors.

       Authenticated requests always include a timestamp in the packet data, which is included in the computation of the authentication code. This timestamp is compared by the server to  its  receive  time
       stamp. If they differ by more than a small amount the request is rejected. This is done for two reasons. First, it makes simple replay attacks on the server, by someone who might be able to overhear
       traffic on your LAN, much more difficult. Second, it makes it more difficult to request configuration changes to your server from topologically remote hosts. While the reconfiguration facility  will
       work  well with a server on the local host, and may work adequately between time-synchronized hosts on the same LAN, it will work very poorly for more distant hosts. As such, if reasonable passwords
       are chosen, care is taken in the distribution and protection of keys and appropriate source address restrictions are applied, the run time reconfiguration facility should provide an  adequate  level
       of security.

       The following commands all make authenticated requests.


       addpeer peer_address [ keyid ] [ version ] [ minpoll# | prefer | iburst | burst | minpoll N | maxpoll N [...]  ]

       addpeer peer_address [ prefer | iburst | burst | minpoll N | maxpoll N | keyidN | version N [...]  ]
               Add  a  configured peer association at the given address and operating in symmetric active mode. Note that an existing association with the same peer may be deleted when this command is exe‐
               cuted, or may simply be converted to conform to the new configuration, as appropriate. If the keyid is nonzero, all outgoing packets to the remote server will have  an  authentication  field
               attached  encrypted with this key. If the value is 0 (or not given) no authentication will be done. If ntpdc's key number has not yet been set (e.g., by the keyid command), it will be set to
               this value. The version# can be 1 through 4 and defaults to 3. The remaining options are either a numeric value for minpoll or literals prefer, iburst, burst, minpoll N, keyid N, version  N,
               or maxpoll N (where N is a numeric value), and have the action as specified in the peer configuration file command of ntpd. See the Server Options page for further information. Each flag (or
               its absence) replaces the previous setting. The prefer keyword indicates a preferred peer (and thus will be used primarily for clock synchronisation if possible).  The  preferred  peer  also
               determines  the  validity  of  the  PPS signal - if the preferred peer is suitable for synchronisation so is the PPS signal. The dynamic keyword allows association configuration even when no
               suitable network interface is found at configuration time. The dynamic interface update mechanism may complete the configuration when new interfaces appear (e.g. WLAN/PPP  interfaces)  at  a
               later time and thus render the association operable.

       addserver peer_address [ keyid ] [ version ] [ minpoll# | prefer | iburst | burst | minpoll N | maxpoll N [...]  ]

       addserver peer_address [ prefer | iburst | burst | minpoll N | maxpoll N | keyidN | version N [...]  ]
               Identical to the addpeer command, except that the operating mode is client.

       broadcast peer_address [ keyid ] [ version ] [ prefer ]
               Identical to the addpeer command, except that the operating mode is broadcast. In this case a valid non-zero key identifier and key are required. The peer_address parameter can be the broad‐
               cast address of the local network or a multicast group address assigned to NTP. If a multicast address, a multicast-capable kernel is required.

       unconfig peer_address [...]
               This command causes the configured bit to be removed from the specified peer(s). In many cases this will cause the peer association to be deleted. When appropriate, however, the  association
               may persist in an unconfigured mode if the remote peer is willing to continue on in this fashion.

       fudge peer_address [ time1 ] [ time2 ] [ stratum ] [ refid ]
               This command provides a way to set certain data for a reference clock. See the source listing for further information.

       enable [ auth | bclient | calibrate | kernel | monitor | ntp | pps | stats]

       disable [ auth | bclient | calibrate | kernel | monitor | ntp | pps | stats]
               These commands operate in the same way as the enable and disable configuration file commands of ntpd. See the Miscellaneous Options page for further information.

       restrict address mask flag [ flag ]
               This command operates in the same way as the restrict configuration file commands of ntpd.

       unrestrict address mask flag [ flag ]
               Unrestrict the matching entry from the restrict list.

       delrestrict address mask [ ntpport ]
               Delete the matching entry from the restrict list.

       readkeys
               Causes  the  current  set  of  authentication  keys to be purged and a new set to be obtained by rereading the keys file (which must have been specified in the ntpd configuration file). This
               allows encryption keys to be changed without restarting the server.

       trustedkey keyid [...]

       untrustedkey keyid [...]
               These commands operate in the same way as the trustedkey and untrustedkey configuration file commands of ntpd.

       authinfo
               Returns information concerning the authentication module, including known keys and counts of encryptions and decryptions which have been done.

       traps   Display the traps set in the server. See the source listing for further information.

       addtrap [ address ] [ port ] [ interface ]
               Set a trap for asynchronous messages. See the source listing for further information.

       clrtrap [ address ] [ port ] [ interface]
               Clear a trap for asynchronous messages. See the source listing for further information.

       reset   Clear the statistics counters in various modules of the server. See the source listing for further information.


BUGS
       ntpdc is a crude hack. Much of the information it shows is deadly boring and could only be loved by its implementer. The program was designed so that new (and temporary) features were easy  to  hack
       in, at great expense to the program's ease of use. Despite this, the program is occasionally useful.


SEE ALSO
       ntpd(8)

       The official HTML documentation.

       This file was automatically generated from HTML source.




                                                                                                                                                                                                     ntpdc(8)
