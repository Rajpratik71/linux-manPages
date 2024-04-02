DEBIRF(1)                                                          User Commands                                                         DEBIRF(1)

NAME
       debirf - build an initrd to boot a full Debian system entirely from RAM

SYNOPSIS
       debirf <subcommand> [options] [args]

DESCRIPTION
       debirf (DEBian on Initial Ram Filesystem) is a set of tools designed to create and prepare a kernel and initial ram filesystem that can run
       a full-blown Debian environment entirely from RAM.

       debirf has various subcommands (see SUBCOMMANDS) which act on a specified debirf profile (see PROFILES).

       The debirf system is outlined at:

          http://cmrg.fifthhorseman.net/wiki/debirf

EXAMPLES
       Make a stock debirf rescue image using the default settings:
        $ tar xzf /usr/share/doc/debirf/example-profiles/rescue.tgz
        $ debirf make rescue

       Make a debirf rescue image, specifying the mirror and a local HTTP proxy:
        $ tar xzf /usr/share/doc/debirf/example-profiles/rescue.tgz
        $ DEBIRF_MIRROR=http://ftp.debian.org/debian http_proxy=http://127.0.0.1:3128/ debirf make rescue

SUBCOMMANDS
       debirf takes various subcommands:

       make [options] PROFILE
              Create a debirf system based on profile PROFILE.  This will create the root for the profile, run all modules on the root,  and  then
              generate the kernel image (see KERNEL) and debirf initramfs.  This subcommand takes various options (see OPTIONS).

       enter PROFILE
              Chroot into root of profile PROFILE, with full profile environment.

       makeiso PROFILE
              Create  a  bootable  CD-ROM  image  from the kernel and initramfs in PROFILE.  This requires a bootloader to be available.  If grub-
              mkrescue (in the grub-common package on debian) is available, it will be used.  Otherwise, isolinux (from the syslinux-common  pack‐
              age)  is  used if it is available.  You may use the DEBIRF_ISO_BOOTLOADER environment variable to specify a preference manually (see
              below).

       help   Output a brief usage summary.

OPTIONS (for make subcommand only)
       -c, --check-vars
              check variables before make

       -n, --new
              create new root, even if old one exists

       -o, --overwrite
              debootstrap on top of old root if it exists

       -s, --skip
              skip debootstrap step altogether if old root exists

       -r, --root-build
              use real chroot to build instead of fakechroot (requires superuser privileges or CAP_SYS_CHROOT)

       -w, --no-warning
              skip superuser warning

       -i, --initrd-only
              remake initramfs from existing root (skip debootstrap and module stages)

       -k, --kernel-deb=KERNEL
              install KERNEL .deb, instead of default kernel

PROFILES
       A debirf profile is a directory containing a debirf.conf config file and a modules sub-directory (see MODULES).

MODULES
       Modules are used to configure the debirf system, and can be used to extend the capabilities of debirf.  Modules are bash shell scripts that
       are  executed  in  alpha-numeric order by run-parts in a chroot in the debirf root during the module stage of the debirf build.  The module
       stage is right after the debirf debootstrap stage, and right before the initramfs archive is created.  All shell variables  beginning  with
       "DEBIRF_", including those defined in the debirf.conf file, are available to the modules.

       NOTE: Some modules are more important to the proper functioning of debirf than others, and the ordering of modules is important.  Some mod‐
       ules may depend on certain other modules having already been, or not yet been, run.  For instance, the module that cleans  the  debirf  apt
       cache ("z1_clean_root") should be the last module run at the end of the module stage.

KERNEL
       The  debirf  "install-kernel" module will try to pick the most up-to-date kernel for the suite you are installing (versions 2.6 only), with
       the arch determined by the kernel running on the host build system.

FUNCTIONS
       A set of pre-defined bash shell functions are available to the modules to fasciliate configuring the debirf system:

       debirf_exec <command>
              Execute <command> within debirf root (DEBIRF_ROOT) with chroot.

       msg <message>
              Output a message to standard out during the build process.

       failure <message> <exit-code>
              Cause debirf script to fail with <exit-code>, and <message> to stderr.

       debirf_info_sh <message>
              Write one line of sh code to the debirf.info file on the debirf root.

       debirf_info_comment <message>
              Write one line of comment to the debirf.info file on the debirf root.

ENVIRONMENT
       The following environment variables are used by debirf:

       DEBIRF_LABEL
              debirf label (default: debirf)

       DEBIRF_BUILDD
              where to build the debirf (default: ./)

       DEBIRF_ARCH
              architecture to build (default is the architecture of the build machine)

       DEBIRF_SUITE
              suite to build from (default determined from lsb_release, otherwise "sid")

       DEBIRF_DISTRO
              distro for suite (default determined from lsb_release, otherwise "debian")

       DEBIRF_MIRROR
              mirror to pull suite (default determined by DEBIRF_DISTRO)

       DEBIRF_KEYRING
              keyring to verify debootstrap (default determined by DEBIRF_DISTRO)

       DEBIRF_KERNEL_FLAVOR
              the flavor of kernel debirf should install.  Supply everything from a typical debian package name after the  version  number.   e.g.
              486, vserver-686-bigmem, openvz-amd64. (default chosen based on currently-running kernel)

       DEBIRF_ISO_BOOTLOADER
              whether to use "grub" or "isolinux" as the El Torito bootloader for debirf makeiso.  if not specified, "grub" is the default.

FILES
       $DEBIRF_PROFILE/debirf.conf
              Debirf profile configuration file.  Contains values for the various debirf environment variables (see ENVIRONMENT).  Variables spec‐
              ified in the debirf.conf override those specified on the command line.

       $DEBIRF_ROOT/etc/debirf/debirf.info
              File that stores various information about the debirf build.  This is a bash-sourceable file.

AUTHOR
       Written by Jameson Rollins and Daniel Kahn Gillmor.

BUGS
       Debirf does not work as a non-privileged user across different versions of libc.  In particular, this means that you probably won't be able
       to   build   an   image   from   a  different  version  of  the  operating  system  than  you're  using  without  building  as  root.  (see
       http://bugs.debian.org/650242)

       Please report bugs in debirf via the debian BTS: http://bugs.debian.org/

COPYRIGHT
       Copyright © 2007-2011 Jameson Rollins and Daniel Kahn Gillmor
       This  is  free  software.   You   may   redistribute   copies   of   it   under   the   terms   of   the   GNU   General   Public   License
       <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       /usr/share/doc/debirf/README, debootstrap(8), fakechroot(1)

debirf 0.32                                                          Dec 2011                                                            DEBIRF(1)
