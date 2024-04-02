LIVE-BUILD(7)                                                   Debian Live Project                                                  LIVE-BUILD(7)

NAME
       live-build - the Debian Live tool suite

SYNOPSIS
       lb COMMAND [-h|--help] [-u|--usage] [-v|--version] [--breakpoints] [--conffile] [--debug] [--force] [--quiet] [--verbose]

DESCRIPTION
       live-build  is  a  set  of scripts to build Debian Live system images. The idea behind live-build is a tool suite that uses a configuration
       directory to completely automate and customize all aspects of building a Live image.

       The COMMAND is a name of a live-build command (see below).

       More documentation about how to  use  live-build  is  available  in  the  individual  manpages  for  each  helper  and  in  the  manual  at
       <http://live.debian.net/manual/>.

OPTIONS
   Shared live-build options
       The following command line options are supported by all live-build programs.

       -h, --help
           display help and exit.

       -u, --usage
           show usage and exit.

       -v, --version
           output version information and exit.

   Common live-build options
       The  following  command line options are supported by most live-build programs. See the man page of each program for a complete explanation
       of what each option does.

       --breakpoints
           run with breakpoints.

       --conffile
           use custom configuration file.

       --debug
           show debug information.

       --force
           force helper execution, even if stage file exists.

       --quiet
           be quiet.

       --verbose
           be verbose.

LIVE-BUILD COMMANDS
       We divide live-build into high level ("porcelain") commands and low level ("plumbing") commands.

       Here is the complete list of all available live-build commands. See their man pages for additional documentation.

HIGH-LEVEL COMMANDS (PORCELAIN)
       We separate the porcelain commands into the main commands and some ancillary user utilities.

   Main porcelain commands
       lb_config(1)
           create configuration for live-build

       lb_bootstrap(1)
           create the first stage by bootstrapping a basic debian system

       lb_chroot(1)
           create the second stage by customizing the chroot

       lb_binary(1)
           create the third stage by generating a binary image

       lb_source(1)
           create the optional fourth stage by generating a source image

       lb_clean(1)
           clean up system build directories

   Ancillary Commands
       lb(1)
           generic live-build wrapper

       lb_build(1)
           alias for all stages

       lb_local(1)
           helper for using a local live-build

       lb_testroot(1)
           ensure that a system is built as root

LOW-LEVEL COMMANDS (PLUMBING)
       The actual work of live-build is implemented in the low-level commands, called plumbing. They are not supposed to be  used  by  end  users,
       they  should stick with porcelains as they ensure that all the different plumbing commands are executed in the right order. However, if you
       intend to reuse live-build commands in your own scripts, then the plumbings might be of interest for you.

       Note that the interface (set of options and the semantics) to these low-level commands are meant to be a lot  more  stable  than  Porcelain
       level commands. The interface to Porcelain commands on the other hand are subject to change in order to improve the end user experience.

   Bootstrap commands
       lb_bootstrap_cache(1)
           cache bootstrap stage

       lb_bootstrap_cdebootstrap(1)
           bootstrap a Debian system with cdebootstrap(1)

       lb_bootstrap_copy(1)
           bootstrap by copying the host system

       lb_bootstrap_debootstrap(1)
           bootstrap a Debian system with debootstrap(8)

   Chroot commands
       lb_chroot_apt(1)
           manage /etc/apt/apt.conf

       lb_chroot_cache(1)
           cache chroot stage

       lb_chroot_debianchroot(1)
           manage /etc/debian_chroot

       lb_chroot_devpts(1)
           mount /dev/pts

       lb_chroot_dpkg(1)
           manage /sbin/dpkg

       lb_chroot_hacks(1)
           execute hacks in chroot

       lb_chroot_hostname(1)
           manage /bin/hostname

       lb_chroot_hosts(1)
           manage /etc/hosts

       lb_chroot_install-packages(1)
           install queued packages into chroot

       lb_chroot_interactive(1)
           make build interactive

       lb_chroot_linux-image(1)
           manage /etc/kernel-img.conf

       lb_chroot_hooks(1)
           execute local hooks in chroot

       lb_chroot_local-includes(1)
           copy local files into chroot

       lb_chroot_packages(1)
           queue install of packages into chroot

       lb_chroot_local-patches(1)
           apply local patches against chroot

       lb_chroot_local-preseed(1)
           use debconf local preseeding file

       lb_chroot_packagelists(1)
           queue install of package lists into chroot

       lb_chroot_proc(1)
           mount /proc

       lb_chroot_resolv(1)
           manage /etc/resolv.conf

       lb_chroot_selinuxfs(1)
           mount /selinux

       lb_chroot_archives(1)
           manage /etc/apt/sources.list

       lb_chroot_sysfs(1)
           mount /sys

       lb_chroot_sysv-rc(1)
           manage /usr/sbin/policy-rc.d

       lb_chroot_task-lists(1)
           install task lists into chroot

   Binary commands
       lb_binary_chroot(1)
           copy chroot into chroot

       lb_binary_debian-installer(1)
           install debian-installer into binary

       lb_binary_disk(1)
           install disk information into binary

       lb_binary_grub(1)
           installs grub into binary

       lb_binary_grub2(1)
           installs grub2 into binary

       lb_binary_includes(1)
           copy files into binary

       lb_binary_iso(1)
           build iso binary image

       lb_binary_linux-image(1)
           install linux-image into binary

       lb_binary_local-hooks(1)
           execute local hooks in binary

       lb_binary_local-includes(1)
           copy files into binary

       lb_binary_local-packagelists(1)
           install local package lists into binary

       lb_binary_manifest(1)
           create manifest

       lb_binary_checksums(1)
           create binary checksums (md5, sha1, and/or sha256)

       lb_binary_memtest(1)
           installs a memtest into binary

       lb_binary_net(1)
           build netboot binary image

       lb_binary_rootfs(1)
           build rootfs image

       lb_binary_silo(1)
           installs silo into binary

       lb_binary_syslinux(1)
           installs syslinux into binary

       lb_binary_tar(1)
           build harddisk binary image

       lb_binary_hdd(1)
           build binary hdd image

       lb_binary_virtual-hdd(1)
           build binary virtual-hdd image

       lb_binary_win32-loader(1)
           installs win32-loader into binary

       lb_binary_yaboot(1)
           installs yaboot into binary

   Source commands
       lb_source_debian(1)
           download sources

       lb_source_debian-live(1)
           copy debian-live config into source

       lb_source_disk(1)
           install disk information into source

       lb_source_iso(1)
           build iso source image

       lb_source_checksums(1)
           create source checksums (md5, sha1, and/or sha256)

       lb_source_net(1)
           build source net image

       lb_source_tar(1)
           build source tarball

       lb_source_hdd(1)
           build source hdd image

       lb_source_virtual-hdd(1)
           build source virtual-hdd image

CONFIG FILES
       Many  live-build  commands  make  use of files in the config/ directory to control what they do. Besides the common config/common, which is
       used by all live-build commands, some additional files can be used to configure the behavior of specific live-build commands.  These  files
       are  typically  named config/stage or config/stage_helper (where "stage" of course, is replaced with the name of the stage that they belong
       to, and "helper" with the name of the helper).

       For example, lb_bootstrap_debootstrap uses files named config/bootstrap and config/bootstrap_debootstrap to read the options it  will  use.
       See  the  man  pages  of  individual commands for details about the names and formats of the files they use. Generally, these files contain
       variables with values assigned, one variable per line. Some programs in live-build use pairs of values or slightly more  complicated  vari‐
       able assignments.

       Note  that  live-build  will respect environment variables which are present in the context of the shell it is running. If variables can be
       read from config files, then they override environment variables, and if command line options are used, they override  values  from  config
       files. If no value for a given variable can be found and thus is unset, live-build will automatically set it to the default value.

       In  some  rare  cases,  you may want to have different versions of these files for different architectures or distributions. If files named
       config/stage.arch or config/stage_helper.arch, and config/stage.dist or config/stage_helper.dist exist, where "arch" is  the  same  as  the
       output  of "dpkg --print-architecture" and "dist" is the same as the codename of the target distribution, then they will be used in prefer‐
       ence to other, more general files.

       All config files are shell scripts which are sourced by a live-build program. That means they have to follow the normal shell  syntax.  You
       can also put comments in these files; lines beginning with "#" are ignored.

FILES
       /etc/live/build.conf

       /etc/live/build.d/

SEE ALSO
       live-boot(7)

       live-config(7)

       This program is a part of live-build.

HOMEPAGE
       More  information  about live-build and the Debian Live project can be found on the homepage at <http://live.debian.net/> and in the manual
       at <http://live.debian.net/manual/>.

BUGS
       Bugs can be reported by submitting a bugreport for the live-build package in the Debian Bug Tracking System at <http://bugs.debian.org/> or
       by writing a mail to the Debian Live mailing list at <debian-live@lists.debian.org>.

AUTHOR
       live-build was written by Daniel Baumann <daniel@debian.org> for the Debian project.

3.0~a57-1                                                           2012-08-10                                                       LIVE-BUILD(7)
