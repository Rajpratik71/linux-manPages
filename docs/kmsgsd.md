KMSGSD(8)                                                     System Manager's Manual                                                    KMSGSD(8)

NAME
       kmsgsd - separates iptables messages from all other kernel messages.

SYNOPSIS
       kmsgsd

DESCRIPTION
       kmsgsd  reads  messages  from  the  /var/lib/psad/psadfifo  named  pipe  and prints any firewall related log messages to the psad data file
       "/var/log/psad/fwdata".  psad cannot detect port scans or other suspect traffic without kmsgsd running on the  machine.   kmsgsd  uses  the
       psad.conf configuration file which by default is located at /etc/psad/psad.conf, but a different path can be specified on the command line.

OPTIONS
       -c <config-file>
              Specify path to config file instead of using the default configuration file /etc/psad/psad.conf.

       -D     Dump the configuration values that kmsgd derives from /etc/psad/psad.conf (or other override files) on STDERR.

       -h     Display usage information and exit.

       -O <config-file>
              Override  config variable values that are normally read from the /etc/psad/psad.conf file with values from the specified file.  Mul‐
              tiple override config files can be given as a comma separated list.

SEE ALSO
       psad(8), psadwatchd(8),

AUTHOR
       Michael Rash (mbr@cipherdyne.org)

       This manual page was written by Daniel Gubser <daniel.gubser@gutreu.ch> for the Debian GNU/Linux system (but may be used by others).

DISTRIBUTION
       psad is distributed under the GNU General Public License (GPL), and the latest version may be downloaded from http://www.cipherdyne.org

Debian GNU/Linux                                                   November 2002                                                         KMSGSD(8)
