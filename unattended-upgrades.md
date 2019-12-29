
unattended-upgrade(8)                   System Manager's Manual                  unattended-upgrade(8)

NAME
       unattended-upgrade - automatic installation of security (and other) upgrades

SYNOPSIS
       unattended-upgrade [options]

DESCRIPTION
       This  program  can  download and install security upgrades automatically and unattended, taking
       care to only install packages from the configured APT source, and  checking  for  dpkg  prompts
       about  configuration  file  changes.  All  operations  are  logged  to  /var/log/unattended-up‐
       grades/unattended-upgrades.log  and  the  package  manager   (dpkg)   output   is   logged   to
       /var/log/unattended-upgrades/unattended-upgrades-dpkg.log

       This  script is the backend for the APT::Periodic::Unattended-Upgrade option and designed to be
       run periodically by APT's systemd service (apt-daily-upgrade.service) or from  cron  (e.g.  via
       /etc/cron.daily/apt).

OPTIONS
       unattended-upgrade accepts the following options:

       -h, --help
              help output

       -d, --debug
              extra debug output into /var/log/unattended-upgrades/unattended-upgrades.log

       --apt-debug
              detailed APT/LibAPT output for debugging

       -v, --verbose
              show verbose output

       --dry-run
              Just simulate installing updates, do not actually do it

       --minimal-upgrade-steps
              perform upgrade in minimal steps (cancel with SIGINT). This is the default now.

       --no-minimal-upgrade-steps
              do not perform upgrade in minimal steps

CONFIGURATION
       The  configuration  is done via the apt configuration mechanism. The default configuration file
       can be found at /etc/apt/apt.conf.d/50unattended-upgrades

AUTHORS
       unattended-upgrade is written by Michael Vogt <mvo@ubuntu.com>

       This manual page was originally written by Michael Vogt <mvo@ubuntu.com>

COPYRIGHT
       Copyright  (C)  2005-2009 Canonical

       There is NO warranty.  You may redistribute this software under the terms of  the  GNU  General
       Public License.  For more information about these matters, see the files named COPYING.

                                             March 1, 2019                       unattended-upgrade(8)
