MII-DIAG(8)                                                                                System Manager's Manual                                                                                MII-DIAG(8)



NAME
       mii-diag - Network adapter control and monitoring

SYNOPSIS
       mii-diag [options]<interface>

DESCRIPTION
       This manual page documents briefly the mii-diag network adapter control and monitoring command.  Addition documentation is available from http://scyld.com/diag/index.html.


       This  mii-diag  command configures, controls and monitors the transceiver management registers for network interfaces, and configures driver operational parameters.  For transceiver control mii-diag
       uses the Media Independent Interface (MII) standard (thus the command name).  It also has additional Linux-specific controls to communicate parameters such as  message  enable  settings  and  buffer
       sizes to the underlying device driver.

       The  MII standard defines registers that control and report network transceiver capabilities, link settings and errors.  Examples are link speed, duplex, capabilities advertised to the link partner,
       status LED indications and link error counters.


OPTIONS
       The mii-diag command supports both single character and long option names.  Short options use a single dash (´-´) in front of the option character.  For options without parameters, multiple  options
       may  be concatenated after a single dash.  Long options are prefixed by two dashes (´--´), and may be abbreviated with a unique prefix.  A long option may take a parameter of the form --arg=param or
       --arg param.


       A summary of options is as follows.


       -A, --advertise <speed|setting>
               -F, --fixed-speed <speed|setting>

              Speed is one of: 100baseT4, 100baseTx, 100baseTx-FD, 100baseTx-HD, 10baseT, 10baseT-FD, 10baseT-HD.  For more precise control an explicit numeric register setting is also allowed.



       -a, --all-interfaces
              Show the status of all interfaces.  This option is not recommended with any other option, especially ones that change settings.


       -s,--status
              Return exit status 2 if there is no link beat.


       -D     Increase the debugging level.  This may be used to understand the actions the command is taking.


       -g, --read-parameters
              Show driver-specific parameters.


       -G, --set-parameters value[,value...]
              Set driver-specific parameters.  Set a adapter-specific parameters.  Parameters are comma separated, with missing elements retaining the existing value.


       -v     Increase the verbosity level.  Additional "-v" options increase the level further.


       -V     Show the program version information.


       -w, --watch
              Continuously monitor the transceiver and report changes.


       -?     Emit usage information.


DESCRIPTION
       Calling the command with just the interface name produces extensive output describing the transceiver capabilities, configuration and current status.


       The '--monitor' option allows scripting link beat changes.

       This option is similar to --watch, but with lower overhead and simplified output.  It polls the interface only once a second and the output format is a single line per link change with  three  fixed
       words
         <unknown|down||negotiating|up> <STATUS> <PARTNER-CAP>

       Example output:  mii-diag --monitor eth0
          down         0x7809 0x0000
          negotiating  0x7829 0x45e1
          up           0x782d 0x45e1
          down         0x7809 0x0000


       This may be used as
         mii-diag --monitor eth0 |
           while read linkstatus bmsr linkpar; do
            case $linkstatus in
               up)   ifup eth0 ;;
               down) ifdown eth0 ;;
            esac
           done


       It may be useful to shorten the DHCP client daemon timeout if it does not receive an address by adding the following setting to /etc/sysconfig/network: DHCPCDARGS="-t 3"


SEE ALSO
       ether-wake(8),net-diag(8),mii-tool(8).
       Addition documentation is available from http://scyld.com/diag/index.html.


KNOWN BUGS
       The --all-interfaces option is quirky.  There are very few settings that are usefully applied to all interfaces.


AUTHOR
       The manual pages, diagnostic commands, and many of the underlying Linux network drivers were written by Donald Becker for the Scyld Beowulf(™) cluster system.




Scyld Beowulf™                                                                                September 9, 2003                                                                                   MII-DIAG(8)
