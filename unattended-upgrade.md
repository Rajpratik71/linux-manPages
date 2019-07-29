unattended-upgrade(8)                                                                   System Manager's Manual                                                                  unattended-upgrade(8)

NAME
       unattended-upgrade - automatic installation of security (and other) upgrades

SYNOPSIS
       unattended-upgrade [options]

DESCRIPTION
       This  program can download and install security upgrades automatically and unattended, taking care to only install packages from the configured APT source, and checking for dpkg prompts about
       configuration file changes. All output is logged to /var/log/unattended-upgrades/*.log.

       This script is the backend for the APT::Periodic::Unattended-Upgrade option and designed to be run from cron (e.g. via /etc/cron.daily/apt).

OPTIONS
       unattended-upgrade accepts the following options:

       -h, --help
              help output

       -d, --debug
              extra debug output into /var/log/unattended-upgrades.log

       --dry-run
              Just simulate installing updates, do not actually do it

CONFIGURATION
       The configuration is done via the apt configuration mechanism. The default configuration file can be found at /etc/apt/apt.conf.d/50unattended-upgrades

AUTHORS
       unattended-upgrade is written by Michael Vogt <mvo@ubuntu.com>

       This manual page was originally written by Michael Vogt <mvo@ubuntu.com>

COPYRIGHT
       Copyright  (C)  2005-2009 Canonical

       There is NO warranty.  You may redistribute this software under the terms of  the  GNU General  Public License.  For more information about these matters, see the files named COPYING.

                                                                                              May 4, 2009                                                                        unattended-upgrade(8)
