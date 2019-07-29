DEBSNAP(1)                                                      DebSnap User Manual                                                     DEBSNAP(1)

NAME
       debsnap - retrieve old snapshots of Debian packages

SYNOPSIS
       debsnap [options] package [version]

       debsnap [-h | --help] [--version]

DESCRIPTION
       debsnap is a tool to help with retrieving snapshots of old packages from a daily archive repository.

       The only publicly available snapshot archive is currently located at http://snapshot.debian.org

       By  default,  debsnap  will download all the available versions for package that are found in the snapshot archive.  If a version is speci‐
       fied, only that particular version will be downloaded, if available.

OPTIONS
       The following options are available:

       -d destination, --destdir destination
              Directory to place retrieved packages.

       -f, --force
              Force writing into an existing destination.  By default debsnap will insist the destination directory does not exist yet  unless  it
              is explicitly specified to be '.' (the current working directory).  This is to avoid files being accidentally overwritten by what is
              fetched from the archive and to provide a guarantee for other scripts that only the files fetched will be present there upon comple‐
              tion.

       -v, --verbose
              Report  on  the  debsnap  configuration  being  used and progress during the download operation.  Please always use this option when
              reporting bugs.

       --list Don't dwnload but just list versions.

       --binary
              Download binary packages instead of source packages.

       -a, --architecture
              Specify architecture of downloaded binary packages. Implies --binary.  This can be given multiple times in order to download  binary
              packages for multiple architectures.

       --first
              Specify  the minimum version of a package which will be downloaded.  Any versions which compare larger than this, according to dpkg,
              will be considered for download.  May be used in combination with --last.

       --last Specify the maximum version of a package which will be downloaded.  Any package versions which compare less than this, according  to
              dpkg, will be considered for download.  May be used in combination with --first.

       -h, --help
              Show a summary of these options.

       --version
              Show the version of debsnap.

CONFIGURATION OPTIONS
       debsnap may also be configured through the use of the following options in the devscripts configuration files:

       DEBSNAP_VERBOSE
              Same as the command line option --verbose.  Set to yes to enable.

       DEBSNAP_DESTDIR
              Set a default path for the destination directory.  If unset ./source-<package_name> will be used.  The command line option --destdir
              will override this.

       DEBSNAP_BASE_URL
              The base url for the snapshots archive.

              If unset this defaults to http://snapshot.debian.org

EXIT STATUS
       debsnap will return an exit status of 0 if all operations succeeded, 1 if a fatal error occurred, and 2 if some packages failed to be down‐
       loaded  but operations otherwise succeeded as expected.  In some cases packages may fail to be downloaded because they are no longer avail‐
       able on the snapshot mirror, so any caller should expect this may occur in normal use.

EXAMPLES
       debsnap -a amd64 xterm 256-1
              Download the binary package of a specific xterm version for amd64 architecture.

       debsnap -a armel xterm
              Download binary packages for all versions of xterm for armel architecture.

       debsnap --binary xterm 256-1
              Download binary packages for a specific xterm version but for all architectures.

       debsnap --binary xterm
              Download binary packages for all versions of xterm for all architectures.

       aptitude search '~i' -F '%p %V' | while read pkg ver; do debsnap -a $(dpkg-architecture -qDEB_HOST_ARCH) -a all $pkg $ver; done
              Download binary packages of all packages that are installed on the system.

FILES
       /etc/devscripts.conf
              Global devscripts configuration options.  Will override hardcoded defaults.

       ~/.devscripts
              Per-user configuration options.  Will override any global configuration.

SEE ALSO
       devscripts(1), devscripts.conf(5), git-debimport(1)

AUTHORS
       David Paleino <dapal@debian.org>

COPYRIGHT
       Copyright © 2010 David Paleino

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3  or  (at
       your option) any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

BUGS
   Reporting bugs
       The program is part of the devscripts package.  Please report bugs using `reportbug devscripts`

Debian devscripts                                                  July 3, 2010                                                         DEBSNAP(1)
