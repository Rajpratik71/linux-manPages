APT-FAST(8)                                                       apt-fast Manual                                                      APT-FAST(8)

NAME
       apt-fast - shellscript wrapper for apt-get or aptitude to speed up downloads

SYNOPSIS
       apt-fast [apt-get options and arguments]
       apt-fast [aptitude options and arguments]
       apt-fast  { { install | upgrade | dist-upgrade | full-upgrade | build-dep | download | source } [ -y | --yes | --assume-yes | --assume-no ]
       <package1> <package2> ... | clean }

DESCRIPTION
       apt-fast is a shellscript wrapper for apt-get or aptitude that can drastically improve APT download times by downloading packages in paral‐
       lel, with multiple connections per package.
       It uses aria2c(1) as default download accelerator.

       For  every  command  or  option you can use either apt-get(8) or aptitude(1) syntax, depending which package manager you have selected with
       _APTMGR configuration item. See apt-fast.conf(5) for detailed description of configuration items.

       Commands listed here use download accelerator to retrieve new packages or influence  apt-fast  in  different  ways.  See  documentation  of
       selected package manager to get overview of all commands available.

       install <package1> <package2> ...
               Install one or more packages. The packages should be listed after the “install” command.

       upgrade
              Upgrade  currently installed packages to newest or pinned versions. Under no circumstances are currently installed packages removed,
              or packages not already installed retrieved and installed.

       dist-upgrade
              Same as upgrade command, but currently installed packages can be removed, or packages not already installed retrieved and installed.

       full-upgrade
              Same as dist-upgrade command.

       build-dep <package1> <package2> ...
              Install build dependencies of one or more packages. The packages should be listed after the “build-dep” command.

       download <package1> <package2> ...
              Download packages to current working directory. It depends on download helper if already downloaded packages are recognised.

       source <package1> <package2> ...
              Download source packages to current working directory and extract source archives. It depends on download helper  if  already  down‐
              loaded source packages are recognised.

       clean  Clean package cache (configuration item APTCACHE) and temporary download directory (configuration item DLDIR). Also remove temporary
              download list file (configuration item DLLIST).

OPTIONS
       Options listed here influence apt-fast behavior. See documentation of selected package manager to get overview of all options available.

       -y, --yes, --assume-yes
              Automatic "yes" to prompts; assume "yes" as answer to all prompts and run non-interactively. Sets DOWNLOADBEFORE configuration  item
              to "true".

       --assume-no
              Automatic "no" to all prompts. Unsets DOWNLOADBEFORE configuration item.

FILES
       /etc/apt-fast.conf
              Configuration file. See apt-fast.conf(5) for detailed description.

       /tmp/apt-fast.list
              Temporary download list file. Configuration item: DLLIST

       /var/cache/apt/apt-file/
              Temporary download location where download accelerator retrieves packages before apt-fast moves them to package cache. Configuration
              item: DLDIR

BUGS
       Use Launchpad bug tracker to report package related bugs (please add debconf related information with 'debconf-show apt-fast'):
       https://bugs.launchpad.net/apt-fast/+filebug

       To report bugs upstream use GitHub issue tracker:
       https://github.com/ilikenwf/apt-fast/issues/new

SEE ALSO
       apt-fast.conf(5)
       apt-get(8), aptitude(8), aria2c(1),

apt-fast 1.9                                                        2017-11-20                                                         APT-FAST(8)
