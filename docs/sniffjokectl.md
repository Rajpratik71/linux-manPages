sniffjokectl(1)                                               General Commands Manual                                              sniffjokectl(1)

NAME
       Sniffjoke CTL 0.4.2 usage

SYNOPSIS
       sniffjokectl [OPTION]... [COMMAND]

DESCRIPTION
       sniffjokectl is the sniffjoke manager, controller, client, whaterver.

       When sniffjoke is running, you should send commands as command line arguments

SNIFFJOKECTL OPTIONS
       --address <ip>[:port] specify administration IP address [default: 127.0.0.1:8844]

       --version show sniffjoke version

       --timeout set milliseconds timeout when contacting SniffJoke service [default: 500]

       --help show this help

SNIFFJOKECTL COMMANDS
       start start sniffjoke hijacking/injection

       stop stop sniffjoke (sniffjoke will work in passive mode, like in pause)

       quit stop sniffjoke, save config, abort the service

       saveconf dump config file

       stat get statistics about sniffjoke configuration and network

       info get massive info about sniffjoke internet stats

       showport show TCP ports strongness of injection

       debug [1-6] change the log debug level

       Those commands are used and accepted only when sniffjoke is running and the "client instance" is listening and reachable in the UDP port.

       When you start sniffjoke you could set your port rules and save the configuration with saveconf.

       When you than restart sniffjoke, using the same --chroot-dir, the previous configurations are reloaded.

AUTHOR
       Claudio Agosti <vecna@delirandom.net>, Giovanni Pellerano <giovanni.pellerano@evilaliv3.org>

REPORTING BUGS
       Report bugs to <sniffjoke-team@delirandom.net>.

COPYRIGHT
       Copyright (GPL) 2008,2009,2010,2011 Claudio Agosti & Giovanni Pellerano.
       This  is  free software; see the source for copying conditions.  There is NO  warranty;  not even for MERCHANTABILITY or FITNESS FOR A PAR‐
       TICULAR PURPOSE.

SEE ALSO
       http://www.delirandom.net/sniffjoke

       sniffjoke(1) sniffjoke-autotest(1)

                                                                                                                                   sniffjokectl(1)
