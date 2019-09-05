PSADWATCHD(8)                                                 System Manager's Manual                                                PSADWATCHD(8)

NAME
       psadwatchd - checks to make sure kmsgsd and psad are running.

SYNOPSIS
       psadwatchd [options]

DESCRIPTION
       psadwatchd  checks  on  an interval of every five seconds to make sure that kmsgsd and psad are running on the box.  If either of the other
       two daemons have died, psadwatchd will restart the daemon and notify each  email  address  listed  in  the  EMAIL_ADDRESSES  variable  (see
       /etc/psad/psad.conf)  that  the daemon has been restarted.  psadwatchd uses the psad.conf configuration file which by default is located at
       /etc/psad/psad.conf, but a different path can be specified on the command line.

OPTIONS
       -c <config-file>
              Specify path to config file instead of using the default configuration file /etc/psad/psad.conf.

       -D     Dump the configuration values that psadwatchd derives from /etc/psad/psad.conf (or other override files) on STDERR.

       -h     Display usage information and exit.

       -O <config-file>
              Override config variable values that are normally read from the /etc/psad/psad.conf file with values from the specified file.   Mul‐
              tiple override config files can be given as a comma separated list.

SEE ALSO
       psad(8), kmsgsd(8),

AUTHOR
       Michael Rash (mbr@cipherdyne.org)

       This manual page was written by Daniel Gubser <daniel.gubser@gutreu.ch> for the Debian GNU/Linux system (but may be used by others).

DISTRIBUTION
       psad is distributed under the GNU General Public License (GPL), and the latest version may be downloaded from http://www.cipherdyne.org

Debian GNU/Linux                                                    March 2009                                                       PSADWATCHD(8)
