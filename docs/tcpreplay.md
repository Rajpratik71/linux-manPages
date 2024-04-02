TCPREPLAY(1)                                                    Programmer's Manual                                                   TCPREPLAY(1)

NAME
       tcpreplay - Replay network traffic stored in pcap files

SYNOPSIS
       tcpreplay [-flag [value]]... [--opt-name [[=| ]value]]...
               <pcap_file(s)>

       tcpreplay is a tool for replaying network traffic from files saved with tcpdump or other tools which write pcap(3) files.

DESCRIPTION
       This  manual  page  briefly  documents the tcpreplay command.  The basic operation of tcpreplay is to resend  all  packets  from  the input
       file(s) at the speed at which they were recorded, or a specified data rate, up to as fast as the hardware is capable.

       Optionally, the traffic can be split between two interfaces, written to files, filtered and edited in various ways, providing the means  to
       test firewalls, NIDS and other network devices.

       For more details, please see the Tcpreplay Manual at: http://tcpreplay.synfin.net/trac/wiki/manual

OPTIONS
       -d number, --dbug=number
              Enable  debugging output.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The value of
              number is constrained to being:
                  in the range  0 through 5
              The default number for this option is:
                   0

              If configured with --enable-debug, then you can specify a verbosity level for debugging output.  Higher numbers increase verbosity.

       -q, --quiet
              Quiet mode.

              Print nothing except the statistics at the end of the run

       -T string, --timer=string
              Select packet timing mode: select, ioport, rdtsc, gtod, nano, abstime.  This option may appear up to 1 times.  The default string
              for this option is:
                   gtod

              Allows you to select the packet timing method to use:

              nano - Use nanosleep() API

              select - Use select() API

              ioport - Write to the i386 IO Port 0x80

              rdtsc - Use the x86/x86_64/PPC RDTSC

              gtod [default] - Use a gettimeofday() loop

              abstime - Use OS X's AbsoluteTime API

       --sleep-accel=number
              Reduce the amount of time to sleep by specified usec.  This option takes an integer number as its argument.  The default number for
              this option is:
                   0

              Reduce the amount of time we would normally sleep between two packets by the specified number of usec.  This provides a "fuzz fac‐
              tor" to compensate for running on a non-RTOS and other processes using CPU time.  Default is disabled.

       --rdtsc-clicks=number
              Specify the RDTSC clicks/usec.  This option may appear up to 1 times.  This option takes an integer number as its argument.  The
              default number for this option is:
                   0

              Override the calculated number of RDTSC clicks/usec which is often the speed of the CPU in Mhz.  Only useful if you specified
              --timer=rdtsc

       -v, --verbose
              Print decoded packets via tcpdump to STDOUT.  This option may appear up to 1 times.

       -A string, --decode=string
              Arguments passed to tcpdump decoder.  This option may appear up to 1 times.  This option must appear in combination with the follow‐
              ing options: verbose.

              When enabling verbose mode (-v) you may also specify one or more additional  arguments to pass to tcpdump to modify the way packets
              are decoded.  By default, -n and -l are used.   Be  sure  to quote the arguments like: -A "-axxx" so that they are not interpreted
              by tcpreplay.   Please see the tcpdump(1) man page for a complete list of options.

       -K, --enable-file-cache
              Enable caching of packets to internal memory.  This option must appear in combination with the following options: loop.

              Cache pcap file(s) the first time they are cached in RAM so that subsequent loops don't incurr any disk I/O latency in order to
              increase performance.  Make sure you have enough free RAM to store the entire pcap file(s) in memory or the system will swap and
              performance will suffer.

       --preload-pcap
              Preloads packets into RAM before sending.

              This option loads the specified pcap(s) into RAM before starting to send in order to improve replay performance while introducing a
              startup performance hit.  Preloading can be used with or without --loop and implies --enable-file-cache.

       -c string, --cachefile=string
              Split traffic via a tcpprep cache file.  This option may appear up to 1 times.

       -i string, --intf1=string
              Server/primary traffic output interface.  This option may appear up to 1 times.

       -I string, --intf2=string
              Client/secondary traffic output interface.  This option may appear up to 1 times.  This option must appear in combination with the
              following options: cachefile.

       --listnics
              List available network interfaces and exit.

       -l number, --loop=number
              Loop through the capture file X times.  This option may appear up to 1 times.  This option takes an integer number as its argument.
              The value of number is constrained to being:
                  greater than or equal to 0
              The default number for this option is:
                   1

       --pktlen
              Override the snaplen and use the actual packet len.  This option may appear up to 1 times.

              By default, tcpreplay will send packets based on the size of the "snaplen" stored in the pcap file which is usually the correct
              thing to do.  However, occasionally, tools will store more bytes then told to.  By specifying this option, tcpreplay will ignore the
              snaplen field and instead try to send packets based on the original packet length.  Bad things may happen if you specify this
              option.

       -L number, --limit=number
              Limit the number of packets to send.  This option may appear up to 1 times.  This option takes an integer number as its argument.
              The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   -1

              By default, tcpreplay will send all the packets.  Alternatively, you can specify a maximum number of packets to send.

       -x string, --multiplier=string
              Modify replay speed to a given multiple.  This option may appear up to 1 times.  This option must not appear in combination with any
              of the following options: pps, mbps, oneatatime, topspeed.

              Specify a floating point value to modify the packet replay speed.  Examples:
                      2.0 will replay traffic at twice the speed captured
                      0.7 will replay traffic at 70% the speed captured

       -p number, --pps=number
              Replay packets at a given packets/sec.  This option may appear up to 1 times.  This option must not appear in combination with any
              of the following options: multiplier, mbps, oneatatime, topspeed.  This option takes an integer number as its argument.

       -M string, --mbps=string
              Replay packets at a given Mbps.  This option may appear up to 1 times.  This option must not appear in combination with any of the
              following options: multiplier, pps, oneatatime, topspeed.

              Specify a floating point value for the Mbps rate that tcpreplay should send packets at.

       -t, --topspeed
              Replay packets as fast as possible.  This option must not appear in combination with any of the following options: mbps, multiplier,
              pps, oneatatime.

       -o, --oneatatime
              Replay one packet at a time for each user input.  This option must not appear in combination with any of the following options:
              mbps, pps, multiplier, topspeed.

              Allows you to step through one or more packets at a time.

       --pps-multi=number
              Number of packets to send for each time interval.  This option must appear in combination with the following options: pps.  This
              option takes an integer number as its argument.  The value of number is constrained to being:
                  greater than or equal to 1
              The default number for this option is:
                   1

              When trying to send packets at very high rates, the time between each packet can be so short that it is impossible to accurately
              sleep for the required period of time.  This option allows you to send multiple packets at a time, thus allowing for longer sleep
              times which can be more accurately implemented.

       -P, --pid
              Print the PID of tcpreplay at startup.

       --stats=number
              Print statistics every X seconds.  This option takes an integer number as its argument.  The value of number is constrained to
              being:
                  greater than or equal to 1

              Note that this is very much a "best effort" and long delays between sending packets may cause equally long delays between printing
              statistics.

       -V, --version
              Print version information.

       -h, --less-help
              Display less usage information and exit.

       -H, --help
              Display usage information and exit.

       -!, --more-help
              Extended usage information passed thru pager.

       - [rcfile], --save-opts[=rcfile]
              Save the option state to rcfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.

       - rcfile, --load-opts=rcfile, --no-load-opts
              Load options from rcfile.  The no-load-opts form will disable the loading of earlier RC/INI files.  --no-load-opts is handled early,
              out of order.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc
       file is "$$/", unless that is a directory.  In that case, the file ".tcpreplayrc" is searched for within that directory.

SIGNALS
       tcpreplay understands the following signals:

       SIGUSR1 Suspend tcpreplay

       SIGCONT Restart tcpreplay

SEE ALSO
       tcpreplay-edit(1), tcpdump(1), tcpprep(1), tcprewrite(1), libnet(3)

BUGS
       tcpreplay can only send packets as fast as your computer's interface, processor, disk and system bus will allow.

       Packet timing at high speeds is a black art and very OS/CPU dependent.

       Replaying captured traffic may simulate odd or broken conditions on your network and cause all sorts of problems.

       In most cases, you can not replay traffic back to/at a server.

       Some operating systems by default do not allow for forging source MAC addresses.  Please consult your operating system's documentation and
       the tcpreplay FAQ if you experience this issue.

AUTHOR
       Copyright 2000-2010 Aaron Turner

       For support please use the tcpreplay-users@lists.sourceforge.net mailing list.

       The latest version of this software is always available from: http://tcpreplay.synfin.net/

       Released under the Free BSD License.

       This manual page was AutoGen-erated from the tcpreplay option definitions.

(tcpreplay )                                                        2010-04-04                                                        TCPREPLAY(1)
