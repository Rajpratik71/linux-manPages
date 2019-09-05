sniffjoke(1)                                                  General Commands Manual                                                 sniffjoke(1)

NAME
       Sniffjoke 0.4.2 usage

SYNOPSIS
       sniffjoke [OPTION]...

DESCRIPTION
       This software is a single peer sniffer obfuscator. when you start SniffJoke from your network privileges, the outgoing internet connections
       became scattered with fake data - without interfere with your sessions - and confusing the sniffers in the network  when  their  algorithms
       try to follow your stream.

       The options usefull when sniffjoke is started (by hand or by init script)

SNIFFJOKE OPTIONS
       --location <name> specify the network environment (suggested) [default: generic]. use the script "sniffjoke-autotest" for the generation of
       the correct environment. eg: in your office, in your home, for every friend where you connect your computer, you need  a  different  'loca‐
       tion'.  the first time you need to use sniffjoke from a location, you run the autotest and automatically are checked the different combina‐
       tions of available plugins+scrambles.

       --dir <name> specify the base directory where the location resides  [default:  /usr/local/var/sniffjoke/]  [using  both  location  and  dir
       defaults, the configuration status will not be saved]

       --user <username> downgrade priviledge to the specified user [default: nobody]

       --gw-mac-addr  <XX:YY:KK:PP:00:RR>  specify  the  default  gateway mac address. by default is not required, because SniffJoke use some auto
       detection commands in order to acquire the local network informations. In some distribution, a fatal exception is triggered when tried,  in
       those case this option became mandatory for the correct execution of SniffJoke.

       --group <groupname> downgrade priviledge to the specified group [default: nogroup]

       --whitelist inject evasion packets only in the specified ip addresses. blacklist and whitelist are mutually exclusive.

       --blacklist inject evasion packet in all session excluding the blacklisted ip address. blacklist and whitelist are mutually exclusive.

       --start  if  present, evasion is activated immediatly [default: not present], for start/stop/reconfigure sniffjoke while running, use snif‐
       fjokectl

       --debug <level 1-6> set up verbosity level [default: 2] 1: suppress log, 2: common, 3: verbose, 4: debug, 5: session 6: packets

       --foreground execute sniffjoke with foreground logging [default:background]

       --admin <ip>[:port] specify administration IP address [default: 127.0.0.1:8844]

       --force force restart (usable when another sniffjoke service is running)

       --version show sniffjoke version

       --help show a command line options resume

       When sniffjoke is running, it keeps on memory the configuration settings and dump them in a binary file, sniffjoke run under chroot  direc‐
       tory and inside that there are files usefull for sniffjoke and for the user.

       When sniffjoke is running, you should send commands using sniffjokect.

   SEMI-SECRET OPTION
       This semi-secret option is used in testing within sniffjoke-autotest

       --only-plugin plugin_name.so,SINGLESCRAMBLEUSED

   [*] DEFAULTS:
       The  default  values  are hardcoded in the software, passed at compile time from the building script, maybe a distribution-specific package
       will contain different paths.

AUTHOR
       Claudio Agosti <vecna@delirandom.net>, Giovanni Pellerano <giovanni.pellerano@evilaliv3.org>

REPORTING BUGS
       Report bugs to <sniffjoke-team@delirandom.net>.

COPYRIGHT
       Copyright (GPL) 2008,2009,2010,2011 Claudio Agosti & Giovanni Pellerano.
       This is free software; see the source for copying conditions.  There is NO  warranty;  not even for MERCHANTABILITY or FITNESS FOR  A  PAR‐
       TICULAR PURPOSE.

SEE ALSO
       http://www.delirandom.net/sniffjoke

       sniffjokectl(1) sniffjoke-autotest(1)

                                                                                                                                      sniffjoke(1)
