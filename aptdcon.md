APTDCON(1)                                    User manual                                   APTDCON(1)

NAME
       aptdcon - command line client for aptdaemon

SYNOPSIS
       aptdcon [OPTIONS]

DESCRIPTION
       aptdcon allows to perform package management tasks, e.g. installing or removing software, using
       aptdaemon. There isn't any need to be root to run this programme.

OPTIONS
       -v, --version
              Show the version number of the aptdcon.

       -h, --help
              Show information about the usage of the command.

       -d, --debug
              Show additional information on the command line.

       -i, --install PACKAGES
              Install the list of PACKAGES. If you want to install more than one package you  have  to
              put the package names into quotation marks.

       --reinstall PACKAGES
              Reinstall  the list of PACKAGES. If you want to reinstall more than one package you have
              to put the package names into quotation marks.

       -r, --remove PACKAGES
              Remove the list of PACKAGES. If you want to remove more than one package you have to put
              the package names into quotation marks.

       -p, --purge PACKAGES
              Purge  the  list of PACKAGES. If you want to purge more than one package you have to put
              the package names into quotation marks.

       -u, --upgrade PACKAGES
              Upgrade the list of PACKAGES. If you want to upgrade more than one package you  have  to
              put the package names into quotation marks.

       --upgrade-system
              Upgrade the whole system.

       --fix-install
              Try to complete a previously cancelled installation by calling "dpkg --configure -a".

       --fix-depends
              Try to resolve unsatisified dependencies. Attention: Currently you don't get a confirma‐
              tion of the changes, which makes this method quite dangerous since it could remove a lot
              of packages.

       --add-vendor-key PUBLIC_KEY_FILE
              Install the PUBLIC_KEY_FILE to authenticate and trust packages singed by the vendor.

       --add-vendor-key-from-keyserver PUBLIC_KEY_ID
              Download  and install the PUBLIC_KEY_ID to authenticate and trust packages singed by the
              vendor. Requires the --keyserver to be set.

       --key-server KEYSERVER
              Download vendor keys from the given KEYSERVER.

       --remove-vendor-key FINGERPRINT
              Remove the vendor key of the given FINGERPRINT to no longer  trust  packages  from  this
              vendor.

       --add-repository ´DEB_LINE´
              Allow  to install software from the repository specified by the given DEB_LINE. You have
              to put quotation marks around the DEB_LINE  since  it  normally  contains  spaces:  ´deb
              http://ftp.de.debian.org/debian unstable main´

       --sources-file SOURCES_FILE
              Specify  an  alternative  sources  file  to  which the new repository should be written.
              SOURCES_FILE should be only the basename: backports.list

       --list-trusted-vendors
              Show all trusted software vendors and theirs keys.

       --hide-terminal
              Do not attach to the interactive terminal of the underlying dpkg call.

       --allow-unauthenticated
              Allow to install packages which are not from a trusted vendor.

EXAMPLES
       The following command will install the package xterm and remove the package eterm in  the  same
       run:
              $ aptdcon --install "xterm" --remove "eterm"

       To  handle  more  than one package the names have to be put into quotation marks. The following
       command will install xterm and eterm:
              $ aptdcon --install "xterm eterm"

       The following command will add the backport repository to the sources.list in a  separate  file
       /etc/apt/sources.list.d/backports.list :
              $ aptdcon --sources-file backports.list \
                  --add-repostiry "deb http://archive.backports.org/debian stable main"

DIAGNOSTICS
       By  default aptdaemon logs to the syslog facility AptDaemon. Furthermore you can use the -d op‐
       tion to get additional information on the command line.

HOMEPAGE
       https://launchpad.net/aptdaemon

BUGS
       You can report bugs at the  Launchpad  site  of  aptdaemon:  https://bugs.launchpad.net/aptdae‐
       mon/+filebug

AUTHOR
       Sebastian Heinlein <devel at glatzor dot de>

SEE ALSO
       aptd(1), org.debian.apt(7), org.debian.apt.transaction(7)

aptdaemon                                    December 2009                                  APTDCON(1)
