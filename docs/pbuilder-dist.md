PBUILDER-DIST(1)                                              General Commands Manual                                             PBUILDER-DIST(1)

NAME
       pbuilder-dist, cowbuilder-dist - multi-distribution pbuilder/cowbuilder wrapper

SYNOPSIS
       pbuilder-dist distribution [architecture] operation [options] [...]

       cowbuilder-dist distribution [architecture] operation [options] [...]

DESCRIPTION
       pbuilder-dist is a wrapper that makes it easy to use pbuilder with many different versions of Ubuntu and/or Debian.

       It  is common to symlink this script in order to give it many names in the form of pbuilder-distribution or pbuilder-distribution-architec‐
       ture, like for example pbuilder-feisty, pbuilder-sid, pbuilder-gutsy-i386, etc.

       The same applies to cowbuilder-dist, which uses cowbuilder. The main difference between both is that pbuilder compresses the created chroot
       as a a tarball, thus using less disc space but needing to uncompress (and possibly compress) its contents again on each run, and cowbuilder
       doesn't do this.

USAGE
       There are many arguments listed on the synopsis; each of them, if used, has to be used exactly in the same order as it appears  there.   In
       case  you  renamed the script to pbuilder-distribution, do not use the distribution parameter; same with i386 / amd64 if the name also con‐
       tains -architecture.

       distribution
              Replace this with the codename of the version of Ubuntu or Debian you want to use.

       architecture
              This optional parameter will attempt to construct a chroot in a foreign architecture.  For some architecture pairs (e.g. i386 on  an
              amd64  install),  the  chroot  will be created natively.  For others (e.g. armel on an i386 install), qemu-user-static will be used.
              Note that some combinations (e.g. amd64 on an i386 install) require special separate kernel handling, and may  break  in  unexpected
              ways.

       operation
              Replace  this  with  the  action you want pbuilder to do (create, update, build, clean, login or execute).  If you don't specify any
              action, but the next argument is a .dsc file, it will assume that it should build.  Check its manpage for more details.

       [...]
              Replace this with other parameters, if needed.  For example, if build is the option, you will need to also specify a .dsc file. As a
              special feature, if you specify a .dsc file you can skip the build option and this script will automatically assume that building is
              the action you want to do.

OPTIONS
       --main-only (deprecated: mainonly)
              If you specify this option, only packages from the main (in Debian) or main and restricted (in Ubuntu) components will be  used.  By
              default, all official components are enabled. This only has effect when creating a new environment.

       --debug-echo
              The  generated  pbuilder/cowbuilder  command  will  be  printed to the standard output instead of being executed. This is useful for
              debugging.

       --buildresult DIRECTORY (pbuilder-dist only)
              If this option is specified, the resultant files of the pbuilder build are placed in DIRECTORY.

       --release-only
              Only use the release pocket.  Default for development releases.

       --security-only
              Only use the release and security pockets.  Suitable environment for preparing security updates.

       --updates-only
              Only use the release, security, and updates pocket.  Not the proposed-updates pocket.

EXAMPLES
       pbuilder-dist gutsy create
              Creates a pbuilder environment for Ubuntu Gutsy, with all components enabled.

       pbuilder-sid --main-only create
              Creates a pbuilder environment for Debian Sid, with only the main component.

       pbuilder-feisty build ./sample_1.0-0ubuntu1.dsc
              Builds the specified package on an already existing Ubuntu Feisty environment.

       pbuilder-dist feisty withlog build ./sample_1.0-0ubuntu1.dsc
              Same as above, but stores pbuilder's output on a file.

       pbuilder-etch i386 update
              Updates an existing i386-architecture Debian Etch environment on an amd64 system.

       cowbuilder-experimental create
              Creates a cowbuilder environment for Debian Experimental.

FILES AND ENVIRONMENT VARIABLES
       By default, pbuilder-dist will store all the files it generates in ~/pbuilder/. This can be changed by setting the PBUILDFOLDER environment
       variable. If the directory doesn't exist, it will be created on the run.

       A file with the log of the last operation, called last_operation.log, will be saved in the results subdirectory of each build environment.

       The default authentication method is sudo. You can change this by setting the PBUILDAUTH variable.

       By  default,  pbuilder-dist  use the master Debian and Ubuntu mirrors.  The pbuilder MIRRORSITE and OTHERMIRROR variables are supported, as
       are  the  standard   ubuntu-dev-tools   variables:   UBUNTUTOOLS_DEBIAN_MIRROR,   PBUILDER_DIST_DEBIAN_MIRROR,   UBUNTUTOOLS_DEBSEC_MIRROR,
       PBUILDER_DIST_DEBSEC_MIRROR,        UBUNTUTOOLS_UBUNTU_MIRROR,       PBUILDER_DIST_UBUNTU,       UBUNTUTOOLS_UBUNTU_PORTS_MIRROR,       and
       PBUILDER_DIST_UBUNTU_PORTS_MIRROR.  See ubuntu-dev-tools (5) for details.

       You may also want to know that pbuilder-dist exports DIST and ARCH environment variables to the invoked process, containing the name of the
       distribution and the architecture targeted by the current build. You can make use of them, for example, in pbuilderrc.

BUGS
       If   you   experience   any   problem   with   this  script  contact  me  on  rainct@ubuntu.com  or  file  a  bug  at  https://bugs.launch‐
       pad.net/ubuntu/+source/ubuntu-dev-tools.

       Please ensure first that the problem is really this script and not an issue with pbuilder or cowbuilder themselves.

SEE ALSO
       pbuilder(1), pbuilderrc(5), cowbuilder(1), ubuntu-dev-tools(5).

AUTHORS
       pbuilder-dist and this manual  page  were  written  by  Siegfried-A.  Gevatter  <rainct@ubuntu.com>,  with  contributions  from  Iain  Lane
       <iain@orangesquash.org.uk>, Emmet Hikory <persia@ubuntu.com> and others.

       pbuilder-dist is released under the GNU General Public License, version 2 or later.

ubuntu-dev-tools                                                 January 10, 2008                                                 PBUILDER-DIST(1)
