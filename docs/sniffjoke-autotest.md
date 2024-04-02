sniffjoke-autotest(1)                                         General Commands Manual                                        sniffjoke-autotest(1)

NAME
       Sniffjoke Autotest Suite 0.4.2 usage

SYNOPSIS
       sniffjoke-autotest [OPTION]...

DESCRIPTION
       This  script  runs plugins test along different destinations OS to determinate the selection of plugins that correctly works in the current
       location.

       it's required a LOCATION name, eg: office, home, nickhome, starbucks...

       sniffjoke-autotest will generate the best plugins_enabled.conf usable in this environment at the end of the tests (that  include  continuos
       restarting  of  sniffjoke  with  different  options) will be created a new directory describing your location. after you will customize the
       options

       sniffjoke-autotest verify every IP/TCP options implemented in sniffjoke, checking if your ISP filter  them  or  not.  Is  generated  iptcp-
       options.conf containing these information.

       The options usefull when sniffjoke is started (by hand or by init script)

SNIFFJOKE-AUTOTEST OPTIONS
       -h show a command line options resume

       -l <location> accept a name for the currently profiling environment [required]

       -n <number> set the number of test replicas [default: 1]

ERRORS, BUGS, ISSUE
       Sometime sniffjoke-autotest simply exit with the message: Something in the network is not going well, and will not be a SniffJoke fault

       I  suggest  to  copy  paste  the previously executed sniffjoke command line, adding the option "--foreground" and see by hand which kind of
       exception is triggered.

DEPENDENCIES
        pub   1024D/7D9E677D 2011-05-21
              Key fingerprint = F37C 2042 5052 27E2 2FD7  D511 947F 574B 7D9E 677D
        uid                  SniffJoke project (http://www.delirandom.net/sniffjoke)

       sniffjoke-autotest reports some URLs, message and info retrivered from delirandom.net, in order to authenticate these message, in  a  shell
       script,  is  downloaded  the  public  key  of the project, because the communications will be accepted only if verified by GnuPG signature.
       Inside sniffjoke-autotest is hardcoded the fingerprint.

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

       sniffjoke(1) sniffjoke-autotest(1)

                                                                                                                             sniffjoke-autotest(1)
