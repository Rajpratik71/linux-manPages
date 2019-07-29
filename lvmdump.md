LVMDUMP(8)                                                    System Manager's Manual                                                   LVMDUMP(8)

NAME
       lvmdump — create lvm2 information dumps for diagnostic purposes

SYNOPSIS
       lvmdump [-a] [-c] [-d directory] [-h] [-l] [-m] [-p] [-s] [-u]

DESCRIPTION
       lvmdump is a tool to dump various information concerning LVM2.  By default, it creates a tarball suitable for submission along with a prob‐
       lem report.

       The content of the tarball is as follows:
       - dmsetup info
       - table of currently running processes
       - recent entries from /var/log/messages (containing system messages)
       - complete lvm configuration and cache (content of /etc/lvm)
       - list of device nodes present under /dev
       - list of files present /sys/block
       - list of files present /sys/devices/virtual/block
       - if enabled with -m, metadata dump will be also included
       - if enabled with -a, debug output of vgscan, pvscan and list of all available volume groups, physical volumes and logical volumes will  be
       included
       - if enabled with -c, cluster status info
       - if enabled with -l, lvmetad state if running
       - if enabled with -p, lvmpolld state if running
       - if enabled with -s, system info and context
       - if enabled with -u, udev info and context

OPTIONS
       -a     Advanced collection.  WARNING: if lvm is already hung, then this script may hang as well if -a is used.

       -c     If clvmd is running, gather cluster data as well.

       -d directory
              Dump  into  a  directory instead of tarball By default, lvmdump will produce a single compressed tarball containing all the informa‐
              tion. Using this option, it can be instructed to only produce the raw dump tree, rooted in directory.

       -h     Print help message

       -l     Include lvmetad(8) daemon dump if it is running. The dump contains cached information that is currently stored in lvmetad: VG  meta‐
              data, PV metadata and various mappings in between these metadata for quick access.

       -m     Gather LVM metadata from the PVs This option generates a 1:1 dump of the metadata area from all PVs visible to the system, which can
              cause the dump to increase in size considerably.  However, the metadata dump may represent a valuable diagnostic resource.

       -p     Include lvmpolld(8) daemon dump if it is running. The dump contains all in-progress operation currently monitored by the daemon  and
              partial history for all yet uncollected results of polling operations already finished including reason.

       -s     Gather system info and context. Currently, this encompasses info gathered by calling lsblk command and various systemd info and con‐
              text: overall state of systemd units present in the system, more detailed status of units controlling LVM functionality and the con‐
              tent of systemd journal for current boot.

       -u     Gather udev info and context: /etc/udev/udev.conf file, udev daemon version (output of 'udevadm info --version' command), udev rules
              currently used in the system (content of /lib/udev/rules.d and /etc/udev/rules.d directory), list of files  in  /lib/udev  directory
              and dump of current udev database content (the output of 'udevadm info --export-db' command).

ENVIRONMENT VARIABLES
       LVM_BINARY
              The LVM2 binary to use.  Defaults to "lvm".  Sometimes you might need to set this to "/sbin/lvm.static", for example.

       DMSETUP_BINARY
              The dmsetup binary to use.  Defaults to "dmsetup".

SEE ALSO
       lvm(8)

Red Hat, Inc.                                           LVM TOOLS 2.02.168(2) (2016-11-30)                                              LVMDUMP(8)
