SURICATA(1)                                                          Suricata                                                          SURICATA(1)

NAME
       suricata - Suricata

SYNOPSIS
       suricata [OPTIONS] [BPF FILTER]

DESCRIPTION
       Suricata is a high performance Network IDS, IPS and Network Security Monitoring engine. Open Source and owned by a community run non-profit
       foundation, the Open Information Security Foundation (OISF).

OPTIONS
       -h     Display a brief usage overview.

       -V     Displays the version of Suricata.

       -c <path>
              Path to configuration file.

       -T     Test configuration.

       -v     The -v option enables more verbosity of Suricata's output. Supply multiple times for more verbosity.

       -r <path>
              Run in pcap offline mode (replay mode) reading files from pcap file. If <path> specifies a directory, all files  in  that  directory
              will be processed in order of modified time maintaining flow state between files.

       --pcap-file-continuous
              Used  with  the  -r option to indicate that the mode should stay alive until interrupted. This is useful with directories to add new
              files and not reset flow state between files.

       --pcap-file-delete
              Used with the -r option to indicate that the mode should delete pcap files after they have  been  processed.  This  is  useful  with
              pcap-file-continuous  to  continuously feed files to a directory and have them cleaned up when done. If this option is not set, pcap
              files will not be deleted after processing.

       -i <interface>
              After the -i option you can enter the interface card you would like to use to sniff packets from.  This option will try to  use  the
              best capture method available.

       --pcap[=<device>]
              Run in PCAP mode. If no device is provided the interfaces provided in the pcap section of the configuration file will be used.

       --af-packet[=<device>]
              Enable  capture  of packet using AF_PACKET on Linux. If no device is supplied, the list of devices from the af-packet section in the
              yaml is used.

       -q <queue id>
              Run inline of the NFQUEUE queue ID provided. May be provided multiple times.

       -s <filename.rules>
              With the -s option you can set a file with signatures, which will be loaded together with the rules set in the yaml.

       -S <filename.rules>
              With the -S option you can set a file with signatures, which will be loaded exclusively, regardless of the rules set in the yaml.

       -l <directory>
              With the -l option you can set the default log directory. If you already have the default-log-dir set in yaml, it will not  be  used
              by Suricata if you use the -l option. It will use the log dir that is set with the -l option. If you do not set a directory with the
              -l option, Suricata will use the directory that is set in yaml.

       -D     Normally if you run Suricata on your console, it keeps your console occupied. You can not use it for other purposes,  and  when  you
              close  the  window,  Suricata stops running.  If you run Suricata as daemon (using the -D option), it runs at the background and you
              will be able to use the console for other tasks without disturbing the engine running.

       --runmode <runmode>
              With the --runmode option you can set the runmode that you would like to use. This command line option can override the yaml runmode
              option.

              Runmodes are: workers, autofp and single.

              For more information about runmodes see Runmodes in the user guide.

       -F <bpf filter file>
              Use BPF filter from file.

       -k [all|none]
              Force (all) the checksum check or disable (none) all checksum checks.

       --user=<user>
              Set the process user after initialization. Overrides the user provided in the run-as section of the configuration file.

       --group=<group>
              Set the process group to group after initialization. Overrides the group provided in the run-as section of the configuration file.

       --pidfile <file>
              Write  the  process  ID  to file. Overrides the pid-file option in the configuration file and forces the file to be written when not
              running as a daemon.

       --init-errors-fatal
              Exit with a failure when errors are encountered loading signatures.

       --disable-detection
              Disable the detection engine.

       --dump-config
              Dump the configuration loaded from the configuration file to the terminal and exit.

       --build-info
              Display the build information the Suricata was built with.

       --list-app-layer-protos
              List all supported application layer protocols.

       --list-keywords=[all|csv|<kword>]
              List all supported rule keywords.

       --list-runmodes
              List all supported run modes.

       --set <key>=<value>
              Set a configuration value. Useful for overriding basic configuration parameters in the configuration. For  example,  to  change  the
              default log directory:

                 --set default-log-dir=/var/tmp

       --engine-analysis
              Print  reports on analysis of different sections in the engine and exit. Please have a look at the conf parameter engine-analysis on
              what reports can be printed

       --unix-socket=<file>
              Use file as the Suricata unix control socket. Overrides the filename provided in the unix-command section of the configuration file.

       --pcap-buffer-size=<size>
              Set the size of the PCAP buffer (0 - 2147483647).

       --netmap[=<device>]
              Enable capture of packet using NETMAP on FreeBSD or Linux. If no device is supplied, the list of devices from the netmap section  in
              the yaml is used.

       --pfring[=<device>]
              Enable PF_RING packet capture. If no device provided, the devices in the Suricata configuration will be used.

       --pfring-cluster-id <id>
              Set the PF_RING cluster ID.

       --pfring-cluster-type <type>
              Set the PF_RING cluster type (cluster_round_robin, cluster_flow).

       -d <divert-port>
              Run inline using IPFW divert mode.

       --dag <device>
              Enable packet capture off a DAG card. If capturing off a specific stream the stream can be select using a device name like "dag0:4".
              This option may be provided multiple times read off multiple devices and/or streams.

       --napatech
              Enable packet capture using the Napatech Streams API.

       --mpipe
              Enable packet capture using the TileGX mpipe interface.

       --erf-in=<file>
              Run in offline mode reading the specific ERF file (Endace extensible record format).

       --simulate-ips
              Simulate IPS mode when running in a non-IPS mode.

OPTIONS FOR DEVELOPERS
       -u     Run the unit tests and exit. Requires that Suricata be compiled with --enable-unittests.

       -U, --unittest-filter=REGEX
              With the -U option you can select which of the unit tests you want to run. This option uses REGEX. Example of use:  suricata  -u  -U
              http

       --list-unittests
              List all unit tests.

       --fatal-unittests
              Enables fatal failure on a unit test error. Suricata will exit instead of continuing more tests.

       --unittests-coverage
              Display unit test coverage report.

SIGNALS
       Suricata will respond to the following signals:

       SIGUSR2
              Causes Suricata to perform a live rule reload.

       SIGHUP Causes Suricata to close and re-open all log files. This can be used to re-open log files after they may have been moved away by log
              rotation utilities.

FILES AND DIRECTORIES
       /usr/local/etc/suricata/suricata.yaml
              Default location of the Suricata configuration file.

       /usr/local/var/log/suricata
              Default Suricata log directory.

BUGS
       Please visit Suricata's support page for information about submitting bugs or feature requests.

NOTES
       · Suricata Home Page
            https://suricata-ids.org/

       · Suricata Support Page
            https://suricata-ids.org/support/

COPYRIGHT
       2016, OISF

4.1.4                                                              Apr 30, 2019                                                        SURICATA(1)
