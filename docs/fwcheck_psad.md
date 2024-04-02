FWCHECK_PSAD(8)                                               System Manager's Manual                                              FWCHECK_PSAD(8)

NAME
       fwcheck_psad - look for iptables rules that log and block unwanted packets.

SYNOPSIS
       fwcheck_psad [options]

DESCRIPTION
       fwcheck_psad  parses the iptables ruleset on the underlying system to see if iptables has been configured to log and block unwanted packets
       by default. This program is called by psad , but can also be executed manually from the command line.

OPTIONS
        --config
              Specify path to the psad configuration file. By default this is /etc/psad/psad.conf.

        --fw-file
              Allow the user to analyze a specific rulset from a file rather than the local policy.

        --fw-analyze
              Analyze the local iptables ruleset and exit.

        --no-fw-search-all
              Look for specific log prefix defined through the FW_MSG_SEARCH variable(s) in the configuration file.

        --Lib-dir
              Specify path to psad lib directory.

        --help
              Display the help message.

SEE ALSO
       iptables(8), psad(8)

AUTHOR
       Michael Rash <mbr@cipherdyne.org>

BUGS
       Send bug reports to mbr@cipherdyne.org.  Suggestions and/or comments are always welcome as well.

DISTRIBUTION
       psad is distributed under the GNU General Public License (GPL), and the latest version may be downloaded from: http://www.cipherdyne.org/

Debian GNU/Linux                                                     Aug, 2008                                                     FWCHECK_PSAD(8)
