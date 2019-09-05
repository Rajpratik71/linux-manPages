MK-SBUILD(1)                                                  General Commands Manual                                                 MK-SBUILD(1)

NAME
       mk-sbuild - creates chroots via schroot and sbuild

SYNOPSIS
       mk-sbuild [options...] <release>

DESCRIPTION
       mk-sbuild creates chroots via schroot and sbuild.

OPTIONS
       Listed below are the command line options for mk-sbuild:

       --arch=ARCH
              What architecture to select (defaults to the native architecture).

       --target=ARCH
              Set up the chroot as a cross-building environment targeting the specified architecture.

       --name=NAME
              Base name for the schroot (arch is appended).

       --personality=PERSONALITY
              What personality to use (defaults to match --arch).

       --debug
              Turn on script debugging.

       --skip-updates
              Do not include the -updates pocket in the installed sources.list.

       --skip-proposed
              Do not include the -proposed pocket in the installed sources.list.

       --source-template=FILE
              Use FILE as the sources.list template (defaults to $HOME/.mk-sbuild.sources).

       --debootstrap-mirror=URL
              Use  URL as the debootstrap source (defaults to http://ports.ubuntu.com where appropriate, official Ubuntu repositories for the sup‐
              ported architectures).

       --debootstrap-include=alpha,beta
              Pass along a comma separated list of packages to debootstrap's --include argument. See debootstrap (8) for more details.

       --debootstrap-exclude=alpha,beta
              Pass along a comma separated list of packages to debootstrap's --exclude argument.  WARNING: be careful using this option as you can
              end up excluding essential package. See debootstrap (8) for more details.

       --debootstrap-keyring=keyring
              Pass along the path to a gpg keyring file to debootsrap's --keyring argument. See debootstrap (8) for more details.

       --debootstrap-no-check-gpg
              Disable  checking  gpg  signatures of downloaded Release files by using debootstrap's --no-check-gpg option. See debootstrap (8) for
              more details.

       --distro=DISTRO
              Enable distro-specific logic.  When not provided, the distribution is determined from release.  Currently  known  distros:  "debian"
              and "ubuntu".

       --vg=VOLUME_GROUP
              Specify  a  volume  group,  and  subsequently use a default SCHROOT_TYPE of "lvm-snapshot" rather than "directory" (via overlayfs or
              aufs) mounts.

       --type=SHROOT_TYPE
              Specify a SCHROOT_TYPE.  Supported values are "directory" (default if --vg not specified), "lvm-snapshot" (default  if  --vg  speci‐
              fied), "btrfs-snapshot", and "file".

ENVIRONMENT VARIABLES
       LV_SIZE
              Size of source LVs (defaults to 5G).

       SNAPSHOT_SIZE
              Size of snapshot LVs (defaults to 4G).

       SCHROOT_CONF_SUFFIX
              Lines to append to schroot entries.

       SCHROOT_PROFILE
              Profile to use with schroot. (defaults to sbuild)

       SKIP_UPDATES
              Do not include the -updates pocket (same as --skip-updates)

       SKIP_PROPOSED
              Do not include the -proposed pocket (same as --skip-proposed)

       DEBOOTSTRAP_MIRROR
              Mirror location (same as --debootstrap-mirror)

       DEBOOTSTRAP_INCLUDE
              Comma separated list of packages to include when bootstrapping (same as --debootstrap-include)

       DEBOOTSTRAP_EXCLUDE
              Comma separated list of packages to exclude when bootstrapping (same as --debootstrap-exclude; see warning above)

       DEBOOTSTRAP_KEYRING
              Keyring file to use for checking gpg signatures of retrieved release files (same as --debootstrap-keyring)

       DEBOOTSTRAP_NO_CHECK_GPG
              Disable gpg verification of retrieved release files (same as --debootstrap-no-check-gpg)

       SOURCE_CHROOTS_DIR
              Use SOURCE_CHROOTS_DIR as home of schroot source directories.  (default /var/lib/schroot/chroots)

       SOURCE_CHROOTS_TGZ
              Use SOURCE_CHROOTS_TGZ as home of schroot source tarballs.  (default /var/lib/schroot/tarballs)

       CHROOT_SNAPSHOT_DIR
              Use CHROOT_SNAPSHOT_DIR as home of mounted btrfs snapshots.  (default /var/lib/schroot/snapshots)

FILES
       $HOME/.mk-sbuild.rc
              Sourced for environment variables (defined above).

       $HOME/.mk-sbuild.sources[.$DISTRO]
              Can  contain  a customized sources.list.  It will be read when creating the schroot.  If a file with ".ubuntu" or ".debian" is found
              (as appropriate) it will use used instead.  See sources.list (5) for more details on the format.

       $HOME/.mk-sbuild.schroot.conf[.$SCHROOT_TYPE]
              Can contain a customized configuration section to be inserted into  /etc/schroot/schroot.conf.   If  a  file  with  ".lvm-snapshot",
              ".directory", ".file", or "btrfs-snapshot" is found (as appropriate) that file will use used instead.  See schroot.conf (5) for more
              details on the format.

USING THE CHROOTS
       To CHANGE the golden image: sudo schroot -c ${SCHROOT_NAME}-source -u root

       To ENTER an image snapshot: schroot -c $SCHROOT_NAME

       To BUILD within a snapshot: sbuild -A -d $SCHROOT_NAME $PACKAGE*.dsc

       for example, to update the packages in a sid-amd64 golden image:
              schroot -c sid-amd64-source -u root -- sh -c "apt-get -qq update && apt-get -qy upgrade && apt-get clean" </dev/null

SEE ALSO
       sbuild-setup(7), sources.list(5), schroot.conf(5), https://help.ubuntu.com/community/SbuildLVMHowto

AUTHOR
       mk-sbuild was written by Kees Cook <kees@ubuntu.com>.  This man page  was  written  by  Ryan  Kavanagh  <ryanakca@kubuntu.org>.   Both  are
       released under the GNU General Public License, version 3 or later.

ubuntu-dev-tools                                                 09 February 2010                                                     MK-SBUILD(1)
