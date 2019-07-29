UPDATE-MANAGER(8)                                             System Manager's Manual                                            UPDATE-MANAGER(8)

NAME
       update-manager - graphical management of software packages updates

SYNOPSIS
       update-manager [options]

DESCRIPTION
       Update-manager  is a frontend for the apt package management system. It allows you to perform some actions of the command line tool apt-get
       in a graphical environment.

       Update-manager is especially designed for upgrading your system, or migrating your system towards a more recent version.

OPTIONS
       For a daily use, you may launch update-manager with no options so that your system is just upgraded.

       For migration purposes, update-manager accepts some options:

       -h, --help
              Show a similar help message

       -V, --version
              Show version

       --data-dir=DATA_DIR
              Directory that contains the data files

       -c, --check-dist-upgrades
              Check if a new distribution release is available

       -d, --devel-release
              If using the latest supported release, upgrade to the development release

       -p, --proposed
              Upgrade using the latest proposed version of the release upgrader

       --no-focus-on-map
              Do not focus on map when starting

       -s, --sandbox
              Test the upgrade with a sandbox aufs overlay, without changing the filesystem.

ACTIONS PERFORMED DURING AN UPGRADE TO A NEW VERSION
       * eventually reinstall the package ubuntu-desktop

       * switch to an updated sources.list entries

       * adds the default user to new groups if needed

SEE ALSO
       Synaptic, sources.list, aptitude

AUTHORS
       update-manager was developed by Michael Vogt <mvo@ubuntu.com> with various contributors (see AUTHORS file)

       This manual page was originally written by Bruno Mangin and Michael Vogt <mvo@ubuntu.com>.

COPYRIGHT
       Copyright  (C)  2006-2007 Canonical

       There is NO warranty.  You may redistribute this software under the terms of  the  GNU General  Public License.  For more information about
       these matters, see the files named COPYING.

                                                                  April 15, 2010                                                 UPDATE-MANAGER(8)
