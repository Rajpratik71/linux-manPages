DENYHOSTS(8)                                                       User Commands                                                      DENYHOSTS(8)

NAME
       DenyHosts - version: 2.10

DESCRIPTION
       DenyHosts  is a python program that automatically blocks ssh attacks by adding entries to /etc/hosts.deny.  DenyHosts will also inform sys‐
       tem administrators about offending hosts, attacked users and suspicious logins.

       Usage: /usr/sbin/denyhosts [-f logfile | --file=logfile] [ -c configfile | --config=configfile] [-i | --ignore] [-n | --noemail]  [--purge]
       [--migrate] [--daemon] [--sync] [--version]

       --file:
              The name of log file to parse

       --config: The configuration file to use, typically /etc/denyhosts.conf

       --ignore: Ignore last processed offset (start processing from beginning)

       --noemail: Do not send an email report

       --unlock: if lockfile exists, remove it and run as normal

       --migrate: migrate your HOSTS_DENY file so that it is suitable for --purge

       --purge: expire entries older than your PURGE_DENY setting

       --purge-all: expire all entries immediately

       --purgeip: remove specified IP address from blocked list

       --daemon: run DenyHosts in daemon mode

       --foreground: run DenyHosts in foreground mode

       --sync: run DenyHosts synchronization mode

       --version: Prints the version of DenyHosts and exits

       Note: multiple --file args can be processed.  If multiple files are provided, --ignore is implied

       Note: in a Debian system, the default running mode is daemon mode and the configuration file is /etc/denyhosts.conf

   When run in --daemon mode the following flags are ignored:
       --file, --purge, --migrate, --sync, --verbose

SEE ALSO
       Please refer to http://denyhost.sourceforge.net/faq.html for full documentation.

AUTHOR
       DenyHosts was written by Phil Schwartz <phil_schwartz@users.sourceforge.net>

       This manual page was written by Marco Bertorello <marco@bertorello.ns0.it> for the Debian project (but may be used by others).

DenyHosts version: 2.10                                            February 2015                                                      DENYHOSTS(8)
