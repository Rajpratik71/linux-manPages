tcpflow(1)                                                         tcpflow 1.4.5                                                        tcpflow(1)

NAME
       tcpflow - TCP flow recorder

SYNOPSIS
       tcpflow [-aBcCDhpsvVZ] [-b max_bytes] [-d debug_level] [-[eE] scanner] [-f max_fds] [-F[ctTXMkmg]] [-i iface] [-L semlock] [-m min_bytes]
       [-o outdir] [-r file1.pcap] [-R file0.pcap] [-Sname=value] [-T[filename template]] [-wfile] [-x scanner] [-X file.xml] [expression]

DESCRIPTION
       tcpflow is a program that captures data transmitted as part of TCP connections (flows), and stores the data in a way that is convenient for
       protocol analysis or debugging.  Rather than showing packet-by-packet information, tcpflow reconstructs the actual data streams and stores
       each flow in a separate file for later analysis.  tcpflow understands TCP sequence numbers and will correctly reconstruct data streams
       regardless of retransmissions or out-of-order delivery. tcpflow provides control over filenames for automatic binning of connections by
       protocol, IP adress or connection number, and has a sophisticated plug-in system for decompressing compressed HTTP connections, undoing
       MIME encoding, or calling user-provided programs for post-processing.

       By default tcpflow stores all captured data in files that have names of the form:

            192.168.101.102.02345-010.011.012.013.45103

       ...where the contents of the above file would be data transmitted from host 192.168.101.102 port 2345, to host 10.11.12.13 port 45103.

       If you want to simply process a few hundred thousand packets and see what you have, try this:

            tcpflow -a -o outdir -Fk -r packets.pcap

       This will cause tcpflow to perform (-a) all processing, store the output in a directory called outdir, bin the output in directories of
       1000 connections each, and read its input from the file packets.pcap. More sophisticiated processing is possible, of course.

OPTIONS
       -a     Enable all processing. Same as -e all.

       -B     Force binary output even when printing to console with -C or -c.

       -b max_bytes
              Specifies the maximum size of a captured flow.  Any bytes beyond max_bytes from the first byte captured will be discarded.  The
              default is to store an unlimited number of bytes per flow. Note: previous versions of tcpflow could only store a maximum of 4GiB per
              flow, but version 1.4 and above can really store an unlimited amount of bytes.  Good thing that modern disks are so big, eh?

       -c     Console print.  Print the contents of packets to stdout as they are received, without storing any captured data to files (implies

       -C     Console print without the packet source and destination details being printed.  Print the contents of packets to stdout as they are
              received, without storing any captured data to files (implies -e When outputting to the console each flow will be output in differ‐
              ent colors (blue for client to server flows, red for server to client flows, green for undecided flows).  -s ).

       -D     Console output should be in hex.

       -d     Debug level.  Set the level of debugging messages printed to stderr to debug_level.  Higher numbers produce more messages.  -d 0
              causes completely silent operation.  -d 1 , the default, produces minimal status messages.  -d 10 produces verbose output equivalent
              to -v .  Numbers higher than 10 can produce a large amount of debugging information useful only to developers.

       -E name
              Disable all scanners and then enable scanner name

       -e name
              Enable scanner name.

       -e all Enables all scanners. Same as -a

       -e http
              Perform HTTP post-processing ("After" processing). If the output file is

                   208.111.153.175.00080-192.168.001.064.37314,

              Then the post-processing will create the files:

                   208.111.153.175.00080-192.168.001.064.37314-HTTP
                   208.111.153.175.00080-192.168.001.064.37314-HTTPBODY

              If the HTTPBODY was compressed with GZIP, you may get a third file as well:
                   208.111.153.175.00080-192.168.001.064.37314-HTTPBODY-GZIP

              Additional information about these streams, such as their MD5 hash value, is also written to the DFXML file

       -F[format]
              Specifies format for output filenames. Format specifiers: c appends the connection counter to ALL filenames.  t prepends each file‐
              name with a Unix timestamp.  T prepends each filename with an ISO-8601 timestamp.  X Do not output any files (other than the
              report.xml report files).

       -FM    Include MD5 of each flow in the DFXML output.

       -FX    Suppresses file output entirely (DFXML file is still produced).

       -Fk    bin output in 1K directories

       -Fm    bin output in 1M directories (2 levels)

       -Fg    bin output in 1G directories (3 levels) -T[format] Specifies an arbitrary template for filenames.  %A expands to source IP address.
              %a expands to source IP port.  %B expands to destination IP address.  %a expands to destination IP port.  %T expands to timestamp in
              ISO8601 format.  %t expands to timestamp in Unix time_t format.  %V expands to "--" if a VLAN is present.  %v expands to the VLAN
              number if a VLAN is present.  %C expands to "c" if the connection count>0.  %c expands to the connection count if the connection
              count>0.  %# always expands to the connection count.  %% prints a "%".

       -fmax_fds
              Max file descriptors used.  Limit the number of file descriptors used by tcpflow to max_fds.  Higher numbers use more system
              resources, but usually perform better.  If the underlying operating system supports the setrlimit() system call, the OS will be
              asked to enforce the requested limit.  The default is for tcpflow to use the maximum number of file descriptors allowed by the OS.
              The -v option will report how many file descriptors tcpflow is using.

       -h     Help.  Print usage information and exit.

       -hh    More help.  Print more usage information and exit.

       -i iface
              Interface name.  Capture packets from the network interface named iface.  If no interface is specified with -i , a reasonable
              default will be used by libpcap automatically.

       -L semlock_name
              Specifies that semlock_name should be used as a Unix semaphore to prevent two different copies of tcpflow running in two different
              processes but outputing to the same standard output from printing on top of each other. This is an application of Unix named sema‐
              phores; bet you have never seen one before.

       -l     Treat the following arguments as filenames with an assumed -r command before each one.  This allows you to read a lot of files at
              once with shell globbing. For example, to process all of the pcap files in the current directory, use this:

                   tcpflow -o out -a -l *.pcap

       -J     Output flow information to console in multiple colors. NOTE: This option was changed from tcpflow 1.3.

       -m min_size
              Forces a new connection output file when there is a skip in the TCP session of min_size bytes or more.

       -o outdir
              Specifies the output directory where the transcript files will be written.

       -P     No purge. Normally tcpflow removes connections from the hash table after the connection is closed with a FIN. This conserves memory
              but takes additional CPU time. Selecting this option causes the std::tr1:unordered_map to grow without bounds, as tcpflow did prior
              to version 1.1. That makes tcpflow run faster if there are less than 10 million connections, but can lead to out-of-memory errors.

       -p     No promiscuous mode.  Normally, tcpflow attempts to put the network interface into promiscuous mode before capturing packets.  The
              -p option tells tcpflow not to put the interface into promiscuous mode.  Note that it might already be in promiscuous mode for some
              other reason.

       -q     Quiet mode --- don't print warnings. Currently the only warning that tcpflow prints is a warning when more than 10,000 files are
              created that the user should have provided the -Fk, -Fm, or -Fg options. We might have other warnings in the future.

       -r     Read from file.  Read packets from file, which was created using the -w option of tcpdump(1).  This option may be repeated any num‐
              ber of times. Standard input is used if file is "-".  Note that for this option to be useful, tcpdump's -s option should be used to
              set the snaplen to the MTU of the interface (e.g., 1500) while capturing packets.

       -R     Read from a file, but only to complete TCP flows. This option is used when tcpflow is used to process a series of files that are
              captured over time.  For each time period n, file  filen.pcap should be processed with  R -r filen.pcap, while file(n-1).pcap should
              be processed with R -R file(n-1).pcap.

       -Sname=value
              Sets a name parameter to be equal to value for a plug-in.  Use -hh to find out all of the settable parameters.

       -s     Strip non-printables.  Convert all non-printable characters to the "." character before printing packets to the console or storing
              them to a file.

       -V     Print the version number and exit.

       -v     Verbose operation.  Verbosely describe tcpflow's operation.  Equivalent to  -d 10.

       -w filename.pcap
              Write packets that were not processed to filename.pcap. Typically this will be UDP packets.

       -X filename.xml
              Write a DFXML report file to filename.xml. The file contains a record of every tcp connection, how the tcpflow program was compiled,
              and the computer on which tcpflow was run.

       -Z     Don't decompress gzip-compressed streams.

EXAMPLES
       To record all packets arriving at or departing from sundown and extract all of the HTTP attachments:
              tcpflow -e scan_http -o outdir host sundown

       To record traffic between helios and either hot or ace and bin the results into 1000 files per directory and calculate the MD5 of each
       flow:
              tcpflow -X report.xml -e scan_md5 -o outdir -Fk host helios and \( hot or ace \)

BUGS
       Please send bug reports to simsong@acm.org.

       tcpflow currently does not understand IP fragments.  Flows containing IP fragments will not be recorded correctly.

AUTHORS
       Originally by Jeremy Elson <jelson@circlemud.org>.  Substantially modified and maintained by Simson L. Garfinkel <simsong@acm.org>.  Net‐
       work visualization code by Michael Shick <mike@shick.in>

       The current version of this software is available at
              http://www.digitalcorpora.org/downloads/tcpflow/

       An announcement mailing list for this program is at:
              http://groups.google.com/group/tcpflow-users

SEE ALSO
       tcpdump(1), nit(4P), bpf(4), pcap(3), pcap-savefile(5), pcap-filter(7)

tcpflow 1.4.5                                                       2013-04-13                                                          tcpflow(1)
