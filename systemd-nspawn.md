SYSTEMD-NSPAWN(1)                                                                               systemd-nspawn                                                                              SYSTEMD-NSPAWN(1)



NAME
       systemd-nspawn - Spawn a namespace container for debugging, testing and building

SYNOPSIS
       systemd-nspawn [OPTIONS...] [COMMAND [ARGS...]]

       systemd-nspawn -b [OPTIONS...] [ARGS...]

DESCRIPTION
       systemd-nspawn may be used to run a command or OS in a light-weight namespace container. In many ways it is similar to chroot(1), but more powerful since it fully virtualizes the file system
       hierarchy, as well as the process tree, the various IPC subsystems and the host and domain name.

       systemd-nspawn limits access to various kernel interfaces in the container to read-only, such as /sys, /proc/sys or /sys/fs/selinux. Network interfaces and the system clock may not be changed from
       within the container. Device nodes may not be created. The host system cannot be rebooted and kernel modules may not be loaded from within the container.

       Note that even though these security precautions are taken systemd-nspawn is not suitable for fully secure container setups. Many of the security features may be circumvented and are hence primarily
       useful to avoid accidental changes to the host system from the container.

       In contrast to chroot(1) systemd-nspawn may be used to boot full Linux-based operating systems in a container.

       Use a tool like dnf(8), debootstrap(8), or pacman(8) to set up an OS directory tree suitable as file system hierarchy for systemd-nspawn containers.

       Note that systemd-nspawn will mount file systems private to the container to /dev, /run and similar. These will not be visible outside of the container, and their contents will be lost when the
       container exits.

       Note that running two systemd-nspawn containers from the same directory tree will not make processes in them see each other. The PID namespace separation of the two containers is complete and the
       containers will share very few runtime objects except for the underlying file system. Use machinectl(1)'s login command to request an additional login prompt in a running container.

       systemd-nspawn implements the Container Interface[1] specification.

       As a safety check systemd-nspawn will verify the existence of /usr/lib/os-release or /etc/os-release in the container tree before starting the container (see os-release(5)). It might be necessary to
       add this file to the container tree manually if the OS of the container is too old to contain this file out-of-the-box.

OPTIONS
       If option -b is specified, the arguments are used as arguments for the init binary. Otherwise, COMMAND specifies the program to launch in the container, and the remaining arguments are used as
       arguments for this program. If -b is not used and no arguments are specified, a shell is launched in the container.

       The following options are understood:

       -D, --directory=
           Directory to use as file system root for the container.

           If neither --directory=, nor --image= is specified the directory is determined by searching for a directory named the same as the machine name specified with --machine=. See machinectl(1)
           section "Files and Directories" for the precise search path.

           If neither --directory=, --image=, nor --machine= are specified, the current directory will be used. May not be specified together with --image=.

       --template=
           Directory or "btrfs" subvolume to use as template for the container's root directory. If this is specified and the container's root directory (as configured by --directory=) does not yet exist
           it is created as "btrfs" subvolume and populated from this template tree. Ideally, the specified template path refers to the root of a "btrfs" subvolume, in which case a simple copy-on-write
           snapshot is taken, and populating the root directory is instant. If the specified template path does not refer to the root of a "btrfs" subvolume (or not even to a "btrfs" file system at all),
           the tree is copied, which can be substantially more time-consuming. Note that if this option is used the container's root directory (in contrast to the template directory!) must be located on a
           "btrfs" file system, so that the "btrfs" subvolume may be created. May not be specified together with --image= or --ephemeral.

           Note that this switch leaves host name, machine ID and all other settings that could identify the instance unmodified.

       -x, --ephemeral
           If specified, the container is run with a temporary "btrfs" snapshot of its root directory (as configured with --directory=), that is removed immediately when the container terminates. This
           option is only supported if the root file system is "btrfs". May not be specified together with --image= or --template=.

           Note that this switch leaves host name, machine ID and all other settings that could identify the instance unmodified.

       -i, --image=
           Disk image to mount the root directory for the container from. Takes a path to a regular file or to a block device node. The file or block device must contain either:

           ·   An MBR partition table with a single partition of type 0x83 that is marked bootable.

           ·   A GUID partition table (GPT) with a single partition of type 0fc63daf-8483-4772-8e79-3d69d8477de4.

           ·   A GUID partition table (GPT) with a marked root partition which is mounted as the root directory of the container. Optionally, GPT images may contain a home and/or a server data partition
               which are mounted to the appropriate places in the container. All these partitions must be identified by the partition types defined by the Discoverable Partitions Specification[2].

           Any other partitions, such as foreign partitions, swap partitions or EFI system partitions are not mounted. May not be specified together with --directory=, --template= or --ephemeral.

       -b, --boot
           Automatically search for an init binary and invoke it instead of a shell or a user supplied program. If this option is used, arguments specified on the command line are used as arguments for the
           init binary. This option may not be combined with --share-system.

       -u, --user=
           After transitioning into the container, change to the specified user-defined in the container's user database. Like all other systemd-nspawn features, this is not a security feature and provides
           protection against accidental destructive operations only.

       -M, --machine=
           Sets the machine name for this container. This name may be used to identify this container during its runtime (for example in tools like machinectl(1) and similar), and is used to initialize the
           container's hostname (which the container can choose to override, however). If not specified, the last component of the root directory path of the container is used, possibly suffixed with a
           random identifier in case --ephemeral mode is selected. If the root directory selected is the host's root directory the host's hostname is used as default instead.

       --uuid=
           Set the specified UUID for the container. The init system will initialize /etc/machine-id from this if this file is not set yet.

       --slice=
           Make the container part of the specified slice, instead of the default machine.slice. This is only applies if the machine is run in its own scope unit, i.e. if --keep-unit is not used.

       --property=
           Set a unit property on the scope unit to register for the machine. This only applies if the machine is run in its own scope unit, i.e. if --keep-unit is not used. Takes unit property assignments
           in the same format as systemctl set-property. This is useful to set memory limits and similar for machines.

       --private-users=
           Enables user namespacing. If enabled, the container will run with its own private set of Unix user and group ids (UIDs and GIDs). Takes none, one or two colon-separated parameters: the first
           parameter specifies the first host UID to assign to the container, the second parameter specifies the number of host UIDs to assign to the container. If the second parameter is omitted, 65536
           UIDs are assigned. If the first parameter is also omitted (and hence no parameter passed at all), the first UID assigned to the container is read from the owner of the root directory of the
           container's directory tree. By default, no user namespacing is applied.

           Note that user namespacing currently requires OS trees that are prepared for the UID shift that is being applied: UIDs and GIDs used for file ownership or in file ACL entries must be shifted to
           the container UID base that is used during container runtime.

           It is recommended to assign at least 65536 UIDs to each container, so that the usable UID range in the container covers 16 bit. For best security, do not assign overlapping UID ranges to
           multiple containers. It is hence a good idea to use the upper 16 bit of the host 32-bit UIDs as container identifier, while the lower 16 bit encode the container UID used.

           When user namespaces are used, the GID range assigned to each container is always chosen identical to the UID range.

       --private-network
           Disconnect networking of the container from the host. This makes all network interfaces unavailable in the container, with the exception of the loopback device and those specified with
           --network-interface= and configured with --network-veth. If this option is specified, the CAP_NET_ADMIN capability will be added to the set of capabilities the container retains. The latter may
           be disabled by using --drop-capability=.

       --network-interface=
           Assign the specified network interface to the container. This will remove the specified interface from the calling namespace and place it in the container. When the container terminates, it is
           moved back to the host namespace. Note that --network-interface= implies --private-network. This option may be used more than once to add multiple network interfaces to the container.

       --network-macvlan=
           Create a "macvlan" interface of the specified Ethernet network interface and add it to the container. A "macvlan" interface is a virtual interface that adds a second MAC address to an existing
           physical Ethernet link. The interface in the container will be named after the interface on the host, prefixed with "mv-". Note that --network-macvlan= implies --private-network. This option may
           be used more than once to add multiple network interfaces to the container.

       --network-ipvlan=
           Create an "ipvlan" interface of the specified Ethernet network interface and add it to the container. An "ipvlan" interface is a virtual interface, similar to a "macvlan" interface, which uses
           the same MAC address as the underlying interface. The interface in the container will be named after the interface on the host, prefixed with "iv-". Note that --network-ipvlan= implies
           --private-network. This option may be used more than once to add multiple network interfaces to the container.

       -n, --network-veth
           Create a virtual Ethernet link ("veth") between host and container. The host side of the Ethernet link will be available as a network interface named after the container's name (as specified
           with --machine=), prefixed with "ve-". The container side of the Ethernet link will be named "host0". Note that --network-veth implies --private-network.

       --network-veth-extra=
           Adds an additional virtual Ethernet link between host and container. Takes a colon-separated pair of host interface name and container interface name. The latter may be omitted in which case the
           container and host sides will be assigned the same name. This switch is independent of --network-veth, and -- in contrast -- may be used multiple times, and allows configuration of the network
           interface names. Note that --network-bridge= has no effect on interfaces created with --network-veth-extra=.

       --network-bridge=
           Adds the host side of the Ethernet link created with --network-veth to the specified bridge. Note that --network-bridge= implies --network-veth. If this option is used, the host side of the
           Ethernet link will use the "vb-" prefix instead of "ve-".

       -p, --port=
           If private networking is enabled, maps an IP port on the host onto an IP port on the container. Takes a protocol specifier (either "tcp" or "udp"), separated by a colon from a host port number
           in the range 1 to 65535, separated by a colon from a container port number in the range from 1 to 65535. The protocol specifier and its separating colon may be omitted, in which case "tcp" is
           assumed. The container port number and its colon may be omitted, in which case the same port as the host port is implied. This option is only supported if private networking is used, such as
           with --network-veth or --network-bridge=.

       -Z, --selinux-context=
           Sets the SELinux security context to be used to label processes in the container.

       -L, --selinux-apifs-context=
           Sets the SELinux security context to be used to label files in the virtual API file systems in the container.

       --capability=
           List one or more additional capabilities to grant the container. Takes a comma-separated list of capability names, see capabilities(7) for more information. Note that the following capabilities
           will be granted in any way: CAP_CHOWN, CAP_DAC_OVERRIDE, CAP_DAC_READ_SEARCH, CAP_FOWNER, CAP_FSETID, CAP_IPC_OWNER, CAP_KILL, CAP_LEASE, CAP_LINUX_IMMUTABLE, CAP_NET_BIND_SERVICE,
           CAP_NET_BROADCAST, CAP_NET_RAW, CAP_SETGID, CAP_SETFCAP, CAP_SETPCAP, CAP_SETUID, CAP_SYS_ADMIN, CAP_SYS_CHROOT, CAP_SYS_NICE, CAP_SYS_PTRACE, CAP_SYS_TTY_CONFIG, CAP_SYS_RESOURCE, CAP_SYS_BOOT,
           CAP_AUDIT_WRITE, CAP_AUDIT_CONTROL. Also CAP_NET_ADMIN is retained if --private-network is specified. If the special value "all" is passed, all capabilities are retained.

       --drop-capability=
           Specify one or more additional capabilities to drop for the container. This allows running the container with fewer capabilities than the default (see above).

       --kill-signal=
           Specify the process signal to send to the container's PID 1 when nspawn itself receives SIGTERM, in order to trigger an orderly shutdown of the container. Defaults to SIGRTMIN+3 if --boot is
           used (on systemd-compatible init systems SIGRTMIN+3 triggers an orderly shutdown). Takes a signal name like "SIGHUP", "SIGTERM" or similar as argument.

       --link-journal=
           Control whether the container's journal shall be made visible to the host system. If enabled, allows viewing the container's journal files from the host (but not vice versa). Takes one of "no",
           "host", "try-host", "guest", "try-guest", "auto". If "no", the journal is not linked. If "host", the journal files are stored on the host file system (beneath /var/log/journal/machine-id) and
           the subdirectory is bind-mounted into the container at the same location. If "guest", the journal files are stored on the guest file system (beneath /var/log/journal/machine-id) and the
           subdirectory is symlinked into the host at the same location.  "try-host" and "try-guest" do the same but do not fail if the host does not have persistent journalling enabled. If "auto" (the
           default), and the right subdirectory of /var/log/journal exists, it will be bind mounted into the container. If the subdirectory does not exist, no linking is performed. Effectively, booting a
           container once with "guest" or "host" will link the journal persistently if further on the default of "auto" is used.

       -j
           Equivalent to --link-journal=try-guest.

       --read-only
           Mount the root file system read-only for the container.

       --bind=, --bind-ro=
           Bind mount a file or directory from the host into the container. Takes one of: a path argument — in which case the specified path will be mounted from the host to the same path in the
           container —, or a colon-separated pair of paths — in which case the first specified path is the source in the host, and the second path is the destination in the container —, or a
           colon-separated triple of source path, destination path and mount options. Mount options are comma-separated and currently, only "rbind" and "norbind" are allowed. Defaults to "rbind". Backslash
           escapes are interpreted, so "\:" may be used to embed colons in either path. This option may be specified multiple times for creating multiple independent bind mount points. The --bind-ro=
           option creates read-only bind mounts.

       --tmpfs=
           Mount a tmpfs file system into the container. Takes a single absolute path argument that specifies where to mount the tmpfs instance to (in which case the directory access mode will be chosen as
           0755, owned by root/root), or optionally a colon-separated pair of path and mount option string that is used for mounting (in which case the kernel default for access mode and owner will be
           chosen, unless otherwise specified). This option is particularly useful for mounting directories such as /var as tmpfs, to allow state-less systems, in particular when combined with --read-only.
           Backslash escapes are interpreted in the path, so "\:" may be used to embed colons in the path.

       --overlay=, --overlay-ro=
           Combine multiple directory trees into one overlay file system and mount it into the container. Takes a list of colon-separated paths to the directory trees to combine and the destination mount
           point.

           Backslash escapes are interpreted in the paths, so "\:" may be used to embed colons in the paths.

           If three or more paths are specified, then the last specified path is the destination mount point in the container, all paths specified before refer to directory trees on the host and are
           combined in the specified order into one overlay file system. The left-most path is hence the lowest directory tree, the second-to-last path the highest directory tree in the stacking order. If
           --overlay-ro= is used instead of --overlay=, a read-only overlay file system is created. If a writable overlay file system is created, all changes made to it are written to the highest directory
           tree in the stacking order, i.e. the second-to-last specified.

           If only two paths are specified, then the second specified path is used both as the top-level directory tree in the stacking order as seen from the host, as well as the mount point for the
           overlay file system in the container. At least two paths have to be specified.

           For details about overlay file systems, see overlayfs.txt[3]. Note that the semantics of overlay file systems are substantially different from normal file systems, in particular regarding
           reported device and inode information. Device and inode information may change for a file while it is being written to, and processes might see out-of-date versions of files at times. Note that
           this switch automatically derives the "workdir=" mount option for the overlay file system from the top-level directory tree, making it a sibling of it. It is hence essential that the top-level
           directory tree is not a mount point itself (since the working directory must be on the same file system as the top-most directory tree). Also note that the "lowerdir=" mount option receives the
           paths to stack in the opposite order of this switch.

       --setenv=
           Specifies an environment variable assignment to pass to the init process in the container, in the format "NAME=VALUE". This may be used to override the default variables or to set additional
           variables. This parameter may be used more than once.

       --share-system
           Allows the container to share certain system facilities with the host. More specifically, this turns off PID namespacing, UTS namespacing and IPC namespacing, and thus allows the guest to see
           and interact more easily with processes outside of the container. Note that using this option makes it impossible to start up a full Operating System in the container, as an init system cannot
           operate in this mode. It is only useful to run specific programs or applications this way, without involving an init system in the container. This option implies --register=no. This option may
           not be combined with --boot.

       --register=
           Controls whether the container is registered with systemd-machined(8). Takes a boolean argument, which defaults to "yes". This option should be enabled when the container runs a full Operating
           System (more specifically: an init system), and is useful to ensure that the container is accessible via machinectl(1) and shown by tools such as ps(1). If the container does not run an init
           system, it is recommended to set this option to "no". Note that --share-system implies --register=no.

       --keep-unit
           Instead of creating a transient scope unit to run the container in, simply register the service or scope unit systemd-nspawn has been invoked in with systemd-machined(8). This has no effect if
           --register=no is used. This switch should be used if systemd-nspawn is invoked from within a service unit, and the service unit's sole purpose is to run a single systemd-nspawn container. This
           option is not available if run from a user session.

       --personality=
           Control the architecture ("personality") reported by uname(2) in the container. Currently, only "x86" and "x86-64" are supported. This is useful when running a 32-bit container on a 64-bit host.
           If this setting is not used, the personality reported in the container is the same as the one reported on the host.

       -q, --quiet
           Turns off any status output by the tool itself. When this switch is used, the only output from nspawn will be the console output of the container OS itself.

       --volatile, --volatile=MODE
           Boots the container in volatile mode. When no mode parameter is passed or when mode is specified as yes, full volatile mode is enabled. This means the root directory is mounted as a mostly
           unpopulated "tmpfs" instance, and /usr from the OS tree is mounted into it, read-only (the system thus starts up with read-only OS resources, but pristine state and configuration, any changes to
           the either are lost on shutdown). When the mode parameter is specified as state, the OS tree is mounted read-only, but /var is mounted as a "tmpfs" instance into it (the system thus starts up
           with read-only OS resources and configuration, but pristine state, and any changes to the latter are lost on shutdown). When the mode parameter is specified as no (the default), the whole OS
           tree is made available writable.

           Note that setting this to yes or state will only work correctly with operating systems in the container that can boot up with only /usr mounted, and are able to populate /var automatically, as
           needed.

       --settings=MODE
           Controls whether systemd-nspawn shall search for and use additional per-container settings from .nspawn files. Takes a boolean or the special values override or trusted.

           If enabled (the default), a settings file named after the machine (as specified with the --machine= setting, or derived from the directory or image file name) with the suffix .nspawn is searched
           in /etc/systemd/nspawn/ and /run/systemd/nspawn/. If it is found there, its settings are read and used. If it is not found there, it is subsequently searched in the same directory as the image
           file or in the immediate parent of the root directory of the container. In this case, if the file is found, its settings will be also read and used, but potentially unsafe settings are ignored.
           Note that in both these cases, settings on the command line take precedence over the corresponding settings from loaded .nspawn files, if both are specified. Unsafe settings are considered all
           settings that elevate the container's privileges or grant access to additional resources such as files or directories of the host. For details about the format and contents of .nspawn files,
           consult systemd.nspawn(5).

           If this option is set to override, the file is searched, read and used the same way, however, the order of precedence is reversed: settings read from the .nspawn file will take precedence over
           the corresponding command line options, if both are specified.

           If this option is set to trusted, the file is searched, read and used the same way, but regardless of being found in /etc/systemd/nspawn/, /run/systemd/nspawn/ or next to the image file or
           container root directory, all settings will take effect, however, command line arguments still take precedence over corresponding settings.

           If disabled, no .nspawn file is read and no settings except the ones on the command line are in effect.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXAMPLES
       Example 1. Download a Fedora image and start a shell in it

           # machinectl pull-raw --verify=no http://ftp.halifax.rwth-aachen.de/fedora/linux/releases/21/Cloud/Images/x86_64/Fedora-Cloud-Base-20141203-21.x86_64.raw.xz
           # systemd-nspawn -M Fedora-Cloud-Base-20141203-21

       This downloads an image using machinectl(1) and opens a shell in it.

       Example 2. Build and boot a minimal Fedora distribution in a container

           # dnf -y --releasever=23 --installroot=/srv/mycontainer --disablerepo='*' --enablerepo=fedora --enablerepo=updates install systemd passwd dnf fedora-release vim-minimal
           # systemd-nspawn -bD /srv/mycontainer

       This installs a minimal Fedora distribution into the directory /srv/mycontainer/ and then boots an OS in a namespace container in it.

       Example 3. Spawn a shell in a container of a minimal Debian unstable distribution

           # debootstrap --arch=amd64 unstable ~/debian-tree/
           # systemd-nspawn -D ~/debian-tree/

       This installs a minimal Debian unstable distribution into the directory ~/debian-tree/ and then spawns a shell in a namespace container in it.

       Example 4. Boot a minimal Arch Linux distribution in a container

           # pacstrap -c -d ~/arch-tree/ base
           # systemd-nspawn -bD ~/arch-tree/

       This installs a minimal Arch Linux distribution into the directory ~/arch-tree/ and then boots an OS in a namespace container in it.

       Example 5. Boot into an ephemeral "btrfs" snapshot of the host system

           # systemd-nspawn -D / -xb

       This runs a copy of the host system in a "btrfs" snapshot which is removed immediately when the container exits. All file system changes made during runtime will be lost on shutdown, hence.

       Example 6. Run a container with SELinux sandbox security contexts

           # chcon system_u:object_r:svirt_sandbox_file_t:s0:c0,c1 -R /srv/container
           # systemd-nspawn -L system_u:object_r:svirt_sandbox_file_t:s0:c0,c1 -Z system_u:system_r:svirt_lxc_net_t:s0:c0,c1 -D /srv/container /bin/sh

EXIT STATUS
       The exit code of the program executed in the container is returned.

SEE ALSO
       systemd(1), systemd.nspawn(5), chroot(1), dnf(8), debootstrap(8), pacman(8), systemd.slice(5), machinectl(1), btrfs(8)

NOTES
        1. Container Interface
           http://www.freedesktop.org/wiki/Software/systemd/ContainerInterface

        2. Discoverable Partitions Specification
           http://www.freedesktop.org/wiki/Specifications/DiscoverablePartitionsSpec/

        3. overlayfs.txt
           https://www.kernel.org/doc/Documentation/filesystems/overlayfs.txt



systemd 228                                                                                                                                                                                 SYSTEMD-NSPAWN(1)
