VIRT-INSTALL(1)                                                                          Virtual Machine Manager                                                                          VIRT-INSTALL(1)

NAME
       virt-install - provision new virtual machines

SYNOPSIS
       virt-install [OPTION]...

DESCRIPTION
       virt-install is a command line tool for creating new KVM, Xen, or Linux container guests using the "libvirt" hypervisor management library.  See the EXAMPLES section at the end of this document
       to quickly get started.

       virt-install tool supports graphical installations using (for example) VNC or SPICE, as well as text mode installs over serial console. The guest can be configured to use one or more virtual
       disks, network interfaces, audio devices, physical USB or PCI devices, among others.

       The installation media can be held locally or remotely on NFS, HTTP, FTP servers. In the latter case "virt-install" will fetch the minimal files necessary to kick off the installation process,
       allowing the guest to fetch the rest of the OS distribution as needed. PXE booting, and importing an existing disk image (thus skipping the install phase) are also supported.

       Given suitable command line arguments, "virt-install" is capable of running completely unattended, with the guest 'kickstarting' itself too. This allows for easy automation of guest installs.

       Many arguments have sub options, specified like opt1=foo,opt2=bar, etc. Try --option=? to see a complete list of sub options associated with that argument, example: virt-install --disk=?

       Most options are not required. Minimum requirements are --name, --memory, guest storage (--disk or --filesystem), and an install option.

CONNECTING TO LIBVIRT
       -c URI
       --connect URI
           Connect to a non-default hypervisor. If this isn't specified, libvirt will try and choose the most suitable default.

           Some valid options here are:

           qemu:///system
               For creating KVM and QEMU guests to be run by the system libvirtd instance.  This is the default mode that virt-manager uses, and what most KVM users want.

           qemu:///session
               For creating KVM and QEMU guests for libvirtd running as the regular user.

           xen:///
               For connecting to Xen.

           lxc:///
               For creating linux containers

GENERAL OPTIONS
       General configuration parameters that apply to all types of guest installs.

       -n NAME
       --name NAME
           Name of the new guest virtual machine instance. This must be unique amongst all guests known to the hypervisor on the connection, including those not currently active. To re-define an
           existing guest, use the virsh(1) tool to shut it down ('virsh shutdown') & delete ('virsh undefine') it prior to running "virt-install".

       --memory OPTIONS
           Memory to allocate for the guest, in MiB. Sub options are available, like 'maxmemory' and 'hugepages'. This deprecates the -r/--ram option.

           Use --memory=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsMemoryAllocation>

       --memorybacking OPTIONS
           This option will influence how virtual memory pages are backed by host pages.

           Use --memorybacking=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsMemoryBacking>

       --arch ARCH
           Request a non-native CPU architecture for the guest virtual machine.  If omitted, the host CPU architecture will be used in the guest.

       --machine MACHINE
           The machine type to emulate. This will typically not need to be specified for Xen or KVM, but is useful for choosing machine types of more exotic architectures.

       --metadata OPT=VAL,[...]
           Specify metadata values for the guest. Possible options include name, uuid, title, and description. This option deprecates -u/--uuid and --description.

           Use --metadata=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsMetadata>

       --events OPT=VAL,[...]
           Specify events values for the guest. Possible options include on_poweroff, on_reboot, and on_crash.

           Use --events=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsEvents>

       --resource OPT=VAL,[...]
           Specify resource partitioning for the guest.

           Use --resource=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#resPartition>

       --vcpus OPTIONS
           Number of virtual cpus to configure for the guest. If 'maxvcpus' is specified, the guest will be able to hotplug up to MAX vcpus while the guest is running, but will startup with VCPUS.

           CPU topology can additionally be specified with sockets, cores, and threads.  If values are omitted, the rest will be autofilled preferring sockets over cores over threads.

           'cpuset' sets which physical cpus the guest can use. "CPUSET" is a comma separated list of numbers, which can also be specified in ranges or cpus to exclude. Example:

               0,2,3,5     : Use processors 0,2,3 and 5
               1-5,^3,8    : Use processors 1,2,4,5 and 8

           If the value 'auto' is passed, virt-install attempts to automatically determine an optimal cpu pinning using NUMA data, if available.

           Use --vcpus=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsCPUAllocation>

       --numatune OPTIONS
           Tune NUMA policy for the domain process. Example invocations

               --numatune 1,2,3,4-7
               --numatune 1-3,5,mode=preferred

           Specifies the numa nodes to allocate memory from. This has the same syntax as "--cpuset" option. mode can be one of 'interleave', 'preferred', or 'strict' (the default). See 'man 8 numactl'
           for information about each mode.

           Use --numatune=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsNUMATuning>

       --memtune OPTIONS
           Tune memory policy for the domain process. Example invocations

               --memtune 1000
               --memtune hard_limit=100,soft_limit=60,swap_hard_limit=150,min_guarantee=80

           Use --memtune=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsMemoryTuning>

       --blkiotune OPTIONS
           Tune blkio policy for the domain process. Example invocations

               --blkiotune 100
               --blkiotune weight=100,device_path=/dev/sdc,device_weight=200

           Use --blkiotune=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsBlockTuning>

       --cpu MODEL[,+feature][,-feature][,match=MATCH][,vendor=VENDOR]
           Configure the CPU model and CPU features exposed to the guest. The only required value is MODEL, which is a valid CPU model as known to libvirt.

           Libvirt's feature policy values force, require, optional, disable, or forbid, or with the shorthand '+feature' and '-feature', which equal 'force=feature' and 'disable=feature' respectively

           Some examples:

           --cpu core2duo,+x2apic,disable=vmx
               Expose the core2duo CPU model, force enable x2apic, but do not expose vmx

           --cpu host
               Expose the host CPUs configuration to the guest. This enables the guest to take advantage of many of the host CPUs features (better performance), but may cause issues if migrating the
               guest to a host without an identical CPU.

           --cpu host-model-only
               Expose the nearest host CPU model configuration to the guest.  It is the best CPU which can be used for a guest on any of the hosts.

           Use --cpu=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsCPU>

       --security type=TYPE[,label=LABEL][,relabel=yes|no]
           Configure domain security driver settings. Type can be either 'static' or 'dynamic'. 'static' configuration requires a security LABEL. Specifying LABEL without TYPE implies static
           configuration.

           To have libvirt automatically apply your static label, you must specify relabel=yes. Otherwise disk images must be manually labeled by the admin, including images that virt-install is asked
           to create.

           Use --security=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#seclabel>

       --features FEAT=on|off,...
           Set elements in the guests <features> XML on or off. Examples include acpi, apic, eoi, privnet, and hyperv features. Some examples:

           --features eoi=on
               Enable APIC PV EOI

           --features hyperv_vapic=on,hyperv_spinlocks=off
               Enable hypver VAPIC, but disable spinlocks

           --features kvm_hidden=on
               Allow the KVM hypervisor signature to be hidden from the guest

           --features pvspinlock=on
               Notify the guest that the host supports paravirtual spinlocks for example by exposing the pvticketlocks mechanism.

           Use --features=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsFeatures>

       --clock offset=OFFSET,TIMER_OPT=VAL,...
           Configure the guest's <clock> XML. Some supported options:

           --clock offset=OFFSET
               Set the clock offset, ex. 'utc' or 'localtime'

           --clock TIMER_present=no
               Disable a boolean timer. TIMER here might be hpet, kvmclock, etc.

           --clock TIMER_tickpolicy=VAL
               Set a timer's tickpolicy value. TIMER here might be rtc, pit, etc. VAL might be catchup, delay, etc. Refer to the libvirt docs for all values.

           Use --clock=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsTime>

       --pm OPTIONS
           Configure guest power management features. Example suboptions include suspend_to_mem=on|off and suspend_to_disk=on|off

           Use --pm=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsPowerManagement>

INSTALLATION OPTIONS
       --cdrom OPTIONS
           File or device used as a virtual CD-ROM device.  It can be path to an ISO image, or to a CDROM device. It can also be a URL from which to fetch/access a minimal boot ISO image. The URLs take
           the same format as described for the "--location" argument. If a cdrom has been specified via the "--disk" option, and neither "--cdrom" nor any other install option is specified, the
           "--disk" cdrom is used as the install media.

       -l LOCATION
       --location OPTIONS
           Distribution tree installation source. virt-install can recognize certain distribution trees and fetches a bootable kernel/initrd pair to launch the install.

           With libvirt 0.9.4 or later, network URL installs work for remote connections.  virt-install will download kernel/initrd to the local machine, and then upload the media to the remote host.
           This option requires the URL to be accessible by both the local and remote host.

           --location allows things like --extra-args for kernel arguments, and using --initrd-inject. If you want to use those options with CDROM media, you have a few options:

           * Run virt-install as root and do --location ISO

           * Mount the ISO at a local directory, and do --location DIRECTORY

           * Mount the ISO at a local directory, export that directory over local http, and do --location http://localhost/DIRECTORY

           The "LOCATION" can take one of the following forms:

           http://host/path
               An HTTP server location containing an installable distribution image.

           ftp://host/path
               An FTP server location containing an installable distribution image.

           nfs:host:/path or nfs://host/path
               An NFS server location containing an installable distribution image. This requires running virt-install as root.

           DIRECTORY
               Path to a local directory containing an installable distribution image. Note that the directory will not be accessible by the guest after initial boot, so the OS installer will need
               another way to access the rest of the install media.

           ISO Mount the ISO and probe the directory. This requires running virt-install as root, and has the same VM access caveat as DIRECTORY.

           Some distro specific url samples:

           Fedora/Red Hat Based
               http://download.fedoraproject.org/pub/fedora/linux/releases/21/Server/x86_64/os

           Debian
               http://ftp.us.debian.org/debian/dists/stable/main/installer-amd64/

           Ubuntu
               http://us.archive.ubuntu.com/ubuntu/dists/wily/main/installer-amd64/

           Suse
               http://download.opensuse.org/distribution/11.0/repo/oss/

           Mandriva
               ftp://ftp.uwsg.indiana.edu/linux/mandrake/official/2009.0/i586/

           Mageia
               ftp://distrib-coffee.ipsl.jussieu.fr/pub/linux/Mageia/distrib/1

       --pxe
           Use the PXE boot protocol to load the initial ramdisk and kernel for starting the guest installation process.

       --import
           Skip the OS installation process, and build a guest around an existing disk image. The device used for booting is the first device specified via "--disk" or "--filesystem".

       --livecd
           Specify that the installation media is a live CD and thus the guest needs to be configured to boot off the CDROM device permanently. It may be desirable to also use the "--disk none" flag in
           combination.

       -x EXTRA
       --extra-args OPTIONS
           Additional kernel command line arguments to pass to the installer when performing a guest install from "--location". One common usage is specifying an anaconda kickstart file for automated
           installs, such as --extra-args "ks=http://myserver/my.ks"

       --initrd-inject PATH
           Add PATH to the root of the initrd fetched with "--location". This can be used to run an automated install without requiring a network hosted kickstart file:

           --initrd-inject=/path/to/my.ks --extra-args "ks=file:/my.ks"

       --os-variant OS_VARIANT
           Optimize the guest configuration for a specific operating system (ex.  'fedora18', 'rhel7', 'winxp'). While not requires, specifying this options is HIGHLY RECOMMENDED, as it can greatly
           increase performance by specifying virtio among other guest tweaks.

           By default, virt-install will attempt to auto detect this value from the install media (currently only supported for URL installs). Autodetection can be disabled with the special value
           'none'. Autodetection can be forced with the special value 'auto'.

           Use the command "osinfo-query os" to get the list of the accepted OS variants.

       --boot BOOTOPTS
           Optionally specify the post-install VM boot configuration. This option allows specifying a boot device order, permanently booting off kernel/initrd with option kernel arguments, and enabling
           a BIOS boot menu (requires libvirt 0.8.3 or later)

           --boot can be specified in addition to other install options (such as --location, --cdrom, etc.) or can be specified on its own. In the latter case, behavior is similar to the --import
           install option: there is no 'install' phase, the guest is just created and launched as specified.

           Some examples:

           --boot cdrom,fd,hd,network,menu=on
               Set the boot device priority as first cdrom, first floppy, first harddisk, network PXE boot. Additionally enable BIOS boot menu prompt.

           --boot kernel=KERNEL,initrd=INITRD,kernel_args="console=/dev/ttyS0"
               Have guest permanently boot off a local kernel/initrd pair, with the specified kernel options.

           --boot kernel=KERNEL,initrd=INITRD,dtb=DTB
               Have guest permanently boot off a local kernel/initrd pair with an external device tree binary. DTB can be required for some non-x86 configurations like ARM or PPC

           --boot loader=BIOSPATH
               Use BIOSPATH as the virtual machine BIOS.

           --boot menu=on,useserial=on
               Enable the bios boot menu, and enable sending bios text output over serial console.

           --boot init=INITPATH
               Path to a binary that the container guest will init. If a root "--filesystem" has been specified, virt-install will default to /sbin/init, otherwise will default to /bin/sh.

           --boot uefi
               Configure the VM to boot from UEFI. In order for virt-install to know the correct UEFI parameters, libvirt needs to be advertising known UEFI binaries via domcapabilities XML, so this
               will likely only work if using properly configured distro packages.

           --boot loader=/.../OVMF_CODE.fd,loader_ro=yes,loader_type=pflash,nvram_template=/.../OVMF_VARS.fd
               Specify that the virtual machine use the custom OVMF binary as boot firmware, mapped as a virtual flash chip. In addition, request that libvirt instantiate the VM-specific UEFI varstore
               from the custom "/.../OVMF_VARS.fd" varstore template. This is the recommended UEFI setup, and should be used if --boot uefi doesn't know about your UEFI binaries.

           Use --boot=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsOS>

       --idmap OPTIONS
           If the guest configuration declares a UID or GID mapping, the 'user' namespace will be enabled to apply these.  A suitably configured UID/GID mapping is a pre-requisite to make containers
           secure, in the absence of sVirt confinement.

           --idmap can be specified to enable user namespace for LXC containers

           Example:
               --idmap uid_start=0,uid_target=1000,uid_count=10,gid_start=0,gid_target=1000,gid_count=10

           Use --idmap=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsOSContainer>

STORAGE OPTIONS
       --disk OPTIONS
           Specifies media to use as storage for the guest, with various options. The general format of a disk string is

               --disk opt1=val1,opt2=val2,...

           The simplest invocation to create a new 10G disk image and associated disk device:

               --disk size=10

           virt-install will generate a path name, and place it in the default image location for the hypervisor. To specify media, the command can either be:

               --disk /some/storage/path[,opt1=val1]...

           or explicitly specify one of the following arguments:

           path
               A path to some storage media to use, existing or not. Existing media can be a file or block device.

               Specifying a non-existent path implies attempting to create the new storage, and will require specifying a 'size' value. Even for remote hosts, virt-install will try to use libvirt
               storage APIs to automatically create the given path.

               If the hypervisor supports it, path can also be a network URL, like http://example.com/some-disk.img . For network paths, they hypervisor will directly access the storage, nothing is
               downloaded locally.

           pool
               An existing libvirt storage pool name to create new storage on. Requires specifying a 'size' value.

           vol An existing libvirt storage volume to use. This is specified as 'poolname/volname'.

           Other available options:

           device
               Disk device type. Value can be 'cdrom', 'disk', 'lun' or 'floppy'. Default is 'disk'. If a 'cdrom' is specified, and no install method is chosen, the cdrom is used as the install media.

           boot_order
               Guest installation with multiple disks will need this parameter to boot correctly after being installed. A boot_order parameter will take values 1,2,3,... Devices with lower value has
               higher priority.

           bus Disk bus type. Value can be 'ide', 'sata', 'scsi', 'usb', 'virtio' or 'xen'.  The default is hypervisor dependent since not all hypervisors support all bus types.

           removable
               Sets the removable flag (/sys/block/$dev/removable on Linux). Only used with QEMU and bus=usb. Value can be 'on' or 'off'.

           readonly
               Set drive as readonly (takes 'on' or 'off')

           shareable
               Set drive as shareable (takes 'on' or 'off')

           size
               size (in GiB) to use if creating new storage

           sparse
               whether to skip fully allocating newly created storage. Value is 'yes' or 'no'. Default is 'yes' (do not fully allocate) unless it isn't supported by the underlying storage type.

               The initial time taken to fully-allocate the guest virtual disk (sparse=no) will be usually balanced by faster install times inside the guest. Thus use of this option is recommended to
               ensure consistently high performance and to avoid I/O errors in the guest should the host filesystem fill up.

           backing_store
               Path to a disk to use as the backing store for the newly created image.

           cache
               The cache mode to be used. The host pagecache provides cache memory.  The cache value can be 'none', 'writethrough', 'directsync', 'unsafe' or 'writeback'.  'writethrough' provides read
               caching. 'writeback' provides read and write caching. 'directsync' bypasses the host page cache. 'unsafe' may cache all content and ignore flush requests from the guest.

           discard
               Whether discard (also known as "trim" or "unmap") requests are ignored or passed to the filesystem. The value can be either "unmap" (allow the discard request to be passed) or "ignore"
               (ignore the discard request). Since 1.0.6 (QEMU and KVM only)

           format
               Disk image format. For file volumes, this can be 'raw', 'qcow2', 'vmdk', etc. See format types in <http://libvirt.org/storage.html> for possible values. This is often mapped to the
               driver_type value as well.

               If not specified when creating file images, this will default to 'qcow2'.

               If creating storage, this will be the format of the new image. If using an existing image, this overrides libvirt's format auto-detection.

           driver_name
               Driver name the hypervisor should use when accessing the specified storage. Typically does not need to be set by the user.

           driver_type
               Driver format/type the hypervisor should use when accessing the specified storage. Typically does not need to be set by the user.

           io  Disk IO backend. Can be either "threads" or "native".

           error_policy
               How guest should react if a write error is encountered. Can be one of "stop", "ignore", or "enospace"

           serial
               Serial number of the emulated disk device. This is used in linux guests to set /dev/disk/by-id symlinks. An example serial number might be: WD-WMAP9A966149

           startup_policy
               It defines what to do with the disk if the source file is not accessible.  See possible values in <http://www.libvirt.org/formatdomain.html#elementsDisks>

           See the examples section for some uses. This option deprecates -f/--file, -s/--file-size, --nonsparse, and --nodisks.

           Use --disk=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsDisks>

       --filesystem
           Specifies a directory on the host to export to the guest. The most simple invocation is:

               --filesystem /source/on/host,/target/point/in/guest

           Which will work for recent QEMU and linux guest OS or LXC containers. For QEMU, the target point is just a mounting hint in sysfs, so will not be automatically mounted.

           The following explicit options can be specified:

           type
               The type or the source directory. Valid values are 'mount' (the default) or 'template' for OpenVZ templates.

           mode
               The access mode for the source directory from the guest OS. Only used with QEMU and type=mount. Valid modes are 'passthrough' (the default), 'mapped', or 'squash'. See libvirt domain XML
               documentation for more info.

           source
               The directory on the host to share.

           target
               The mount location to use in the guest.

           Use --filesystem=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsFilesystems>

NETWORKING OPTIONS
       -w OPTIONS
       --network OPTIONS
           Connect the guest to the host network. The value for "NETWORK" can take one of 4 formats:

           bridge=BRIDGE
               Connect to a bridge device in the host called "BRIDGE". Use this option if the host has static networking config & the guest requires full outbound and inbound connectivity  to/from the
               LAN. Also use this if live migration will be used with this guest.

           network=NAME
               Connect to a virtual network in the host called "NAME". Virtual networks can be listed, created, deleted using the "virsh" command line tool. In an unmodified install of "libvirt" there
               is usually a virtual network with a name of "default". Use a virtual network if the host has dynamic networking (eg NetworkManager), or using wireless. The guest will be NATed to the LAN
               by whichever connection is active.

           type=direct,source=IFACE[,source_mode=MODE]
               Direct connect to host interface IFACE using macvtap.

           user
               Connect to the LAN using SLIRP. Only use this if running a QEMU guest as an unprivileged user. This provides a very limited form of NAT.

           none
               Tell virt-install not to add any default network interface.

           If this option is omitted a single NIC will be created in the guest. If there is a bridge device in the host with a physical interface enslaved, that will be used for connectivity. Failing
           that, the virtual network called "default" will be used. This option can be specified multiple times to setup more than one NIC.

           Other available options are:

           model
               Network device model as seen by the guest. Value can be any nic model supported by the hypervisor, e.g.: 'e1000', 'rtl8139', 'virtio', ...

           mac Fixed MAC address for the guest; If this parameter is omitted, or the value "RANDOM" is specified a suitable address will be randomly generated. For Xen virtual machines it is required
               that the first 3 pairs in the MAC address be the sequence '00:16:3e', while for QEMU or KVM virtual machines it must be '52:54:00'.

           filterref
               Controlling firewall and network filtering in libvirt. Value can be any nwfilter defined by the "virsh" 'nwfilter' subcommands. Available filters can be listed by running 'virsh
               nwfilter-list', e.g.: 'clean-traffic', 'no-mac-spoofing', ...

           virtualport_type
               The type of virtual port profile, one the following values

               "802.Qbg"
                   The following additional parameters are accepted

                   virtualport_managerid
                       The VSI Manager ID identifies the database containing the VSI type and instance definitions. This is an integer value and the value 0 is reserved.

                   virtualport_typeid
                       The VSI Type ID identifies a VSI type characterizing the network access. VSI types are typically managed by network administrator.  This is an integer value.

                   virtualport_typeidversion
                       The VSI Type Version allows multiple versions of a VSI Type. This is an integer value.

                   virtualport_instanceid
                       The VSI Instance ID Identifier is generated when a VSI instance (i.e. a virtual interface of a virtual machine) is created. This is a globally unique identifier.

               "802.Qbh"
                   The following additional parameters are accepted

                   virtualport_profileid
                       The profile ID contains the name of the port profile that is to be applied to this interface. This name is resolved by the port profile database into the network parameters from
                       the port profile, and those network parameters will be applied to this interface.

               "openvswitch"
                   The following additional parameters are accepted

                   virtualport_profileid
                       The OpenVSwitch port profile for the interface

                   virtualport_interfaceid
                       A UUID to uniquely identify the interface. If omitted one will be generated automatically

               "midonet"
                   The following additional parameters are accepted

                   virtualport_interfaceid
                       A UUID identifying the port in the network to which the interface will be bound

           Use --network=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsNICS>

           This option deprecates -m/--mac, -b/--bridge, and --nonetworks

GRAPHICS OPTIONS
       If no graphics option is specified, "virt-install" will try to select the appropriate graphics if the DISPLAY environment variable is set, otherwise '--graphics none' is used.

       --graphics TYPE,opt1=arg1,opt2=arg2,...
           Specifies the graphical display configuration. This does not configure any virtual hardware, just how the guest's graphical display can be accessed.  Typically the user does not need to
           specify this option, virt-install will try and choose a useful default, and launch a suitable connection.

           General format of a graphical string is

               --graphics TYPE,opt1=arg1,opt2=arg2,...

           For example:

               --graphics vnc,password=foobar

           The supported options are:

           type
               The display type. This is one of:

               vnc

               Setup a virtual console in the guest and export it as a VNC server in the host. Unless the "port" parameter is also provided, the VNC server will run on the first free port number at
               5900 or above. The actual VNC display allocated can be obtained using the "vncdisplay" command to "virsh" (or virt-viewer(1) can be used which handles this detail for the use).

               spice

               Export the guest's console using the Spice protocol. Spice allows advanced features like audio and USB device streaming, as well as improved graphical performance.

               Using spice graphic type will work as if those arguments were given:

                   --video qxl --channel spicevmc

               none

               No graphical console will be allocated for the guest. Guests will likely need to have a text console configured on the first serial port in the guest (this can be done via the
               --extra-args option). The command 'virsh console NAME' can be used to connect to the serial device.

           port
               Request a permanent, statically assigned port number for the guest console. This is used by 'vnc' and 'spice'

           tlsport
               Specify the spice tlsport.

           listen
               Address to listen on for VNC/Spice connections. Default is typically 127.0.0.1 (localhost only), but some hypervisors allow changing this globally (for example, the qemu driver default
               can be changed in /etc/libvirt/qemu.conf).  Use 0.0.0.0 to allow access from other machines. This is use by 'vnc' and 'spice'

           keymap
               Request that the virtual VNC console be configured to run with a specific keyboard layout. If the special value 'local' is specified, virt-install will attempt to configure to use the
               same keymap as the local system. A value of 'none' specifically defers to the hypervisor. Default behavior is hypervisor specific, but typically is the same as 'local'. This is used by
               'vnc'

           password
               Request a VNC password, required at connection time. Beware, this info may end up in virt-install log files, so don't use an important password. This is used by 'vnc' and 'spice'

           Use --graphics=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsGraphics>

           This deprecates the following options: --vnc, --vncport, --vnclisten, -k/--keymap, --sdl, --nographics

       --noautoconsole
           Don't automatically try to connect to the guest console. The default behaviour is to launch virt-viewer(1) to display the graphical console, or to run the "virsh" "console" command to
           display the text console. Use of this parameter will disable this behaviour.

VIRTUALIZATION OPTIONS
       Options to override the default virtualization type choices.

       -v
       --hvm
           Request the use of full virtualization, if both para & full virtualization are available on the host. This parameter may not be available if connecting to a Xen hypervisor on a machine
           without hardware virtualization support. This parameter is implied if connecting to a QEMU based hypervisor.

       -p
       --paravirt
           This guest should be a paravirtualized guest. If the host supports both para & full virtualization, and neither this parameter nor the "--hvm" are specified, this will be assumed.

       --container
           This guest should be a container type guest. This option is only required if the hypervisor supports other guest types as well (so for example this option is the default behavior for LXC and
           OpenVZ, but is provided for completeness).

       --virt-type
           The hypervisor to install on. Example choices are kvm, qemu, or xen.  Available options are listed via 'virsh capabilities' in the <domain> tags.

           This deprecates the --accelerate option, which is now the default behavior. To install a plain QEMU guest, use '--virt-type qemu'

DEVICE OPTIONS
       --controller OPTIONS
           Attach a controller device to the guest. TYPE is one of: ide, fdc, scsi, sata, virtio-serial, or usb.

           Controller also supports the special values usb2 and usb3 to specify which version of the USB controller should be used (version 2 or 3).

           model
               Controller model.  These may vary according to the hypervisor and its version.  Most commonly used models are e.g. auto, virtio-scsi for the scsi controller, ehci or none for the usb
               controller.  For full list and further details on controllers/models, see "http://libvirt.org/formatdomain.html#elementsControllers".

           address
               Controller address, current PCI of form 'bus:domain:slot.function'.

           index
               A decimal integer describing in which order the bus controller is encountered, and to reference the controller bus.

           master
               Applicable to USB companion controllers, to define the master bus startport.

           Examples:

           --controller usb,model=ich9-ehci1,address=0:0:4.0,index=0
               Adds a ICH9 EHCI1 USB controller on PCI address 0:0:4.0

           --controller usb,model=ich9-uhci2,address=0:0:4.7,index=0,master=2
               Adds a ICH9 UHCI2 USB companion controller for the previous master controller, ports start from port number 2.

               The parameter multifunction='on' will be added automatically to the proper device (if needed).  This applies to all PCI devices.

           Use --controller=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsControllers>

       --input OPTIONS
           Attach an input device to the guest. Example input device types are mouse, tablet, or keyboard.

           Use --input=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsInput>

       --hostdev OPTIONS
       --host-device OPTIONS
           Attach a physical host device to the guest. Some example values for HOSTDEV:

           --hostdev pci_0000_00_1b_0
               A node device name via libvirt, as shown by 'virsh nodedev-list'

           --hostdev 001.003
               USB by bus, device (via lsusb).

           --hostdev 0x1234:0x5678
               USB by vendor, product (via lsusb).

           --hostdev 1f.01.02
               PCI device (via lspci).

           Use --hostdev=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsHostDev>

       --sound MODEL
           Attach a virtual audio device to the guest. MODEL specifies the emulated sound card model. Possible values are ich6, ich9, ac97, es1370, sb16, pcspk, or default. 'default' will try to pick
           the best model that the specified OS supports.

           This deprecates the old --soundhw option.

           Use --sound=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsSound>

       --watchdog MODEL[,action=ACTION]
           Attach a virtual hardware watchdog device to the guest. This requires a daemon and device driver in the guest. The watchdog fires a signal when the virtual machine appears to hung. ACTION
           specifies what libvirt will do when the watchdog fires. Values are

           reset
               Forcefully reset the guest (the default)

           poweroff
               Forcefully power off the guest

           pause
               Pause the guest

           none
               Do nothing

           shutdown
               Gracefully shutdown the guest (not recommended, since a hung guest probably won't respond to a graceful shutdown)

           MODEL is the emulated device model: either i6300esb (the default) or ib700.  Some examples:

           Use the recommended settings:

           --watchdog default

           Use the i6300esb with the 'poweroff' action

           --watchdog i6300esb,action=poweroff

           Use --watchdog=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsWatchdog>

       --parallel OPTIONS
       --serial OPTIONS
           Specifies a serial device to attach to the guest, with various options. The general format of a serial string is

               --serial type,opt1=val1,opt2=val2,...

           --serial and --parallel devices share all the same options, unless otherwise noted. Some of the types of character device redirection are:

           --serial pty
               Pseudo TTY. The allocated pty will be listed in the running guests XML description.

           --serial dev,path=HOSTPATH
               Host device. For serial devices, this could be /dev/ttyS0. For parallel devices, this could be /dev/parport0.

           --serial file,path=FILENAME
               Write output to FILENAME.

           --serial pipe,path=PIPEPATH
               Named pipe (see pipe(7))

           --serial tcp,host=HOST:PORT,mode=MODE,protocol=PROTOCOL
               TCP net console. MODE is either 'bind' (wait for connections on HOST:PORT) or 'connect' (send output to HOST:PORT), default is 'bind'. HOST defaults to '127.0.0.1', but PORT is required.
               PROTOCOL can be either 'raw' or 'telnet' (default 'raw'). If 'telnet', the port acts like a telnet server or client.  Some examples:

               Wait for connections on any address, port 4567:

               --serial tcp,host=0.0.0.0:4567

               Connect to localhost, port 1234:

               --serial tcp,host=:1234,mode=connect

               Wait for telnet connection on localhost, port 2222. The user could then connect interactively to this console via 'telnet localhost 2222':

               --serial tcp,host=:2222,mode=bind,protocol=telnet

           --serial udp,host=CONNECT_HOST:PORT,bind_host=BIND_HOST:BIND_PORT
               UDP net console. HOST:PORT is the destination to send output to (default HOST is '127.0.0.1', PORT is required). BIND_HOST:BIND_PORT is the optional local address to bind to (default
               BIND_HOST is 127.0.0.1, but is only set if BIND_PORT is specified). Some examples:

               Send output to default syslog port (may need to edit /etc/rsyslog.conf accordingly):

               --serial udp,host=:514

               Send output to remote host 192.168.10.20, port 4444 (this output can be read on the remote host using 'nc -u -l 4444'):

               --serial udp,host=192.168.10.20:4444

           --serial unix,path=UNIXPATH,mode=MODE
               Unix socket, see unix(7). MODE has similar behavior and defaults as --serial tcp,mode=MODE

           Use --serial=? or --parallel=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsCharSerial> and
           <http://libvirt.org/formatdomain.html#elementsCharParallel>

       --channel
           Specifies a communication channel device to connect the guest and host machine. This option uses the same options as --serial and --parallel for specifying the host/source end of the
           channel. Extra 'target' options are used to specify how the guest machine sees the channel.

           Some of the types of character device redirection are:

           --channel SOURCE,target_type=guestfwd,target_address=HOST:PORT
               Communication channel using QEMU usermode networking stack. The guest can connect to the channel using the specified HOST:PORT combination.

           --channel SOURCE,target_type=virtio[,name=NAME]
               Communication channel using virtio serial (requires 2.6.34 or later host and guest). Each instance of a virtio --channel line is exposed in the guest as /dev/vport0p1, /dev/vport0p2,
               etc. NAME is optional metadata, and can be any string, such as org.linux-kvm.virtioport1.  If specified, this will be exposed in the guest at /sys/class/virtio-ports/vport0p1/NAME

           --channel spicevmc,target_type=virtio[,name=NAME]
               Communication channel for QEMU spice agent, using virtio serial (requires 2.6.34 or later host and guest). NAME is optional metadata, and can be any string, such as the default
               com.redhat.spice.0 that specifies how the guest will see the channel.

           Use --channel=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsCharChannel>

       --console
           Connect a text console between the guest and host. Certain guest and hypervisor combinations can automatically set up a getty in the guest, so an out of the box text login can be provided
           (target_type=xen for xen paravirt guests, and possibly target_type=virtio in the future).

           Example:

           --console pty,target_type=virtio
               Connect a virtio console to the guest, redirected to a PTY on the host.  For supported guests, this exposes /dev/hvc0 in the guest. See
               http://fedoraproject.org/wiki/Features/VirtioSerial for more info. virtio console requires libvirt 0.8.3 or later.

           Use --console=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsCharConsole>

       --video OPTIONS
           Specify what video device model will be attached to the guest. Valid values for VIDEO are hypervisor specific, but some options for recent kvm are cirrus, vga, qxl, or vmvga (vmware).

           Use --video=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsVideo>

       --smartcard MODE[,OPTIONS]
           Configure a virtual smartcard device.

           Mode is one of host, host-certificates, or passthrough. Additional options are:

           type
               Character device type to connect to on the host. This is only applicable for passthrough mode.

           An example invocation:

           --smartcard passthrough,type=spicevmc
               Use the smartcard channel of a SPICE graphics device to pass smartcard info to the guest

           Use --smartcard=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsSmartcard>

       --redirdev BUS[,OPTIONS]
           Add a redirected device.

           type
               The redirection type, currently supported is tcp or spicevmc.

           server
               The TCP server connection details, of the form 'server:port'.

           Examples of invocation:

           --redirdev usb,type=tcp,server=localhost:4000
               Add a USB redirected device provided by the TCP server on 'localhost' port 4000.

           --redirdev usb,type=spicevmc
               Add a USB device redirected via a dedicated Spice channel.

           Use --redirdev=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsRedir>

       --memballoon MODEL
           Attach a virtual memory balloon device to the guest. If the memballoon device needs to be explicitly disabled, MODEL='none' is used.

           MODEL is the type of memballoon device provided. The value can be 'virtio', 'xen' or 'none'.  Some examples:

           Use the recommended settings:

           --memballoon virtio

           Do not use memballoon device:

           --memballoon none

           Use --memballoon=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsMemBalloon>

       --tpm TYPE[,OPTIONS]
           Configure a virtual TPM device.

           Type must be passthrough. Additional options are:

           model
               The device model to present to the guest operating system. Model must be tpm-tis.

           An example invocation:

           --tpm passthrough,model=tpm-tis
               Make the host's TPM accessible to a single guest.

           --tpm /dev/tpm
               Convenience option for passing through the hosts TPM.

           Use --tpm=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsTpm>

       --rng TYPE[,OPTIONS]
           Configure a virtual RNG device.

           Type can be random or egd.

           If the specified type is random then these values must be specified:

           backend_device
               The device to use as a source of entropy.

           Whereas, when the type is egd, these values must be provided:

           backend_host
               Specify the host of the Entropy Gathering Daemon to connect to.

           backend_service
               Specify the port of the Entropy Gathering Daemon to connect to.

           backend_type
               Specify the type of the connection: tcp or udp.

           backend_mode
               Specify the mode of the connection.  It is either 'bind' (wait for connections on HOST:PORT) or 'connect' (send output to HOST:PORT).

           backend_connect_host
               Specify the remote host to connect to when the specified backend_type is udp and backend_mode is bind.

           backend_connect_service
               Specify the remote service to connect to when the specified backend_type is udp and backend_mode is bind.

           An example invocation:

           --rng egd,backend_host=localhost,backend_service=8000,backend_type=tcp
               Connect to localhost to the TCP port 8000 to get entropy data.

           --rng /dev/random
               Use the /dev/random device to get entropy data, this form implicitly uses the "random" model.

               Use --rng=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsRng>

       --panic OPTS
           Attach a panic notifier device to the guest. For the recommended settings, use:

           --panic default

           Use --panic=? to see a list of all available sub options. Complete details at <http://libvirt.org/formatdomain.html#elementsPanic>

MISCELLANEOUS OPTIONS
       -h
       --help
           Show the help message and exit

       --version
           Show program's version number and exit

       --autostart
           Set the autostart flag for a domain. This causes the domain to be started on host boot up.

       --print-xml [STEP]
           Print the generated XML of the guest, instead of defining it. By default this WILL do storage creation (can be disabled with --dry-run). This option implies --quiet.

           If the VM install has multiple phases, by default this will print all generated XML. If you want to print a particular step, use --print-xml 2 (for the second phase XML).

       --noreboot
           Prevent the domain from automatically rebooting after the install has completed.

       --wait WAIT
           Amount of time to wait (in minutes) for a VM to complete its install.  Without this option, virt-install will wait for the console to close (not necessarily indicating the guest has
           shutdown), or in the case of --noautoconsole, simply kick off the install and exit. Any negative value will make virt-install wait indefinitely, a value of 0 triggers the same results as
           noautoconsole. If the time limit is exceeded, virt-install simply exits, leaving the virtual machine in its current state.

       --dry-run
           Proceed through the guest creation process, but do NOT create storage devices, change host device configuration, or actually teach libvirt about the guest.  virt-install may still fetch
           install media, since this is required to properly detect the OS to install.

       --check
           Enable or disable some validation checks. Some examples are warning about using a disk that's already assigned to another VM (--check path_in_use=on|off), or warning about potentially
           running out of space during disk allocation (--check disk_size=on|off). Most checks are performed by default.

       -q
       --quiet
           Only print fatal error messages.

       -d
       --debug
           Print debugging information to the terminal when running the install process.  The debugging information is also stored in "~/.cache/virt-manager/virt-install.log" even if this parameter is
           omitted.

EXAMPLES
       Install a Fedora 20 KVM guest with virtio accelerated disk/network, creating a new 10GiB qcow2 file, installing from media in the hosts CDROM drive. This will use Spice graphics by default, and
       launch autolaunch a graphical client.

         # virt-install \
              --connect qemu:///system \
              --virt-type kvm \
              --name demo \
              --memory 500 \
              --disk size=10 \
              --cdrom /dev/cdrom \
              --os-variant fedora13

       Install a Fedora 9 plain QEMU guest, using LVM partition, virtual networking, booting from PXE, using VNC server/viewer, with virtio-scsi disk

         # virt-install \
              --connect qemu:///system \
              --name demo \
              --memory 500 \
              --disk path=/dev/HostVG/DemoVM,bus=scsi \
              --controller virtio-scsi \
              --network network=default \
              --virt-type qemu
              --graphics vnc \
              --os-variant fedora9

       Run a Live CD image under Xen fullyvirt, in diskless environment

         # virt-install \
              --hvm \
              --name demo \
              --memory 500 \
              --disk none \
              --livecd \
              --graphics vnc \
              --cdrom /root/fedora7live.iso

       Run /usr/bin/httpd in a linux container guest (LXC). Resource usage is capped at 512 MiB of ram and 2 host cpus:

         # virt-install \
               --connect lxc:/// \
               --name httpd_guest \
               --memory 512 \
               --vcpus 2 \
               --init /usr/bin/httpd

       Start a linux container guest(LXC) with a private root filesystem, using /bin/sh as init.  Container's root will be under host dir /home/LXC.  The host dir "/home/test" will be mounted at "/mnt"
       dir inside container:

         # virt-install \
               --connect lxc:/// \
               --name container \
               --memory 128 \
               --filesystem /home/LXC,/ \
               --filesystem /home/test,/mnt \
               --init /bin/sh

       Install a paravirtualized Xen guest, 500 MiB of RAM, a 5 GiB of disk, and Fedora Core 6 from a web server, in text-only mode, with old style --file options:

         # virt-install \
              --paravirt \
              --name demo \
              --memory 500 \
              --disk /var/lib/xen/images/demo.img,size=6 \
              --graphics none \
              --location http://download.fedora.redhat.com/pub/fedora/linux/core/6/x86_64/os/

       Create a guest from an existing disk image 'mydisk.img' using defaults for the rest of the options.

         # virt-install \
              --name demo \
              --memory 512 \
              --disk /home/user/VMs/mydisk.img \
              --import

       Start serial QEMU ARM VM, which requires specifying a manual kernel.

         # virt-install \
              --name armtest \
              --memory 1024 \
              --arch armv7l --machine vexpress-a9 \
              --disk /home/user/VMs/myarmdisk.img \
              --boot kernel=/tmp/my-arm-kernel,initrd=/tmp/my-arm-initrd,dtb=/tmp/my-arm-dtb,kernel_args="console=ttyAMA0 rw root=/dev/mmcblk0p3" \
              --graphics none

BUGS
       Please see http://virt-manager.org/page/BugReporting

COPYRIGHT
       Copyright (C) Red Hat, Inc, and various contributors.  This is free software. You may redistribute copies of it under the terms of the GNU General Public License
       "http://www.gnu.org/licenses/gpl.html". There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       virsh(1), "virt-clone(1)", "virt-manager(1)", the project website "http://virt-manager.org"

1.3.2                                                                                           2017-08-31                                                                                VIRT-INSTALL(1)
