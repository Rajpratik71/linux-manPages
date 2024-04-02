virt-v2v(1)                                                                               Virtualization Support                                                                              virt-v2v(1)

NAME
       virt-v2v - Convert a guest to use KVM

SYNOPSIS
        virt-v2v -ic vpx://vcenter.example.com/Datacenter/esxi vmware_guest

        virt-v2v -ic vpx://vcenter.example.com/Datacenter/esxi vmware_guest \
          -o rhev -os rhev.nfs:/export_domain --network rhevm

        virt-v2v -i libvirtxml guest-domain.xml -o local -os /var/tmp

        virt-v2v -i disk disk.img -o local -os /var/tmp

        virt-v2v -i disk disk.img -o glance

        virt-v2v -ic qemu:///system qemu_guest --in-place

DESCRIPTION
       Virt-v2v converts guests from a foreign hypervisor to run on KVM.  It can read Linux and Windows guests running on VMware, Xen, Hyper-V and some other hypervisors, and convert them to KVM
       managed by libvirt, OpenStack, oVirt, Red Hat Enterprise Virtualisation (RHEV) or several other targets.

       There is also a companion front-end called virt-p2v(1) which comes as an ISO, CD or PXE image that can be booted on physical machines to virtualize those machines (physical to virtual, or p2v).

       This manual page documents the rewritten virt-v2v included in libguestfs ≥ 1.28.

INPUT AND OUTPUT MODES
                                 ┌────────────┐  ┌─────────▶ -o null
        -i disk ────────────┐    │            │ ─┘┌───────▶ -o local
        -i ova  ──────────┐ └──▶ │ virt-v2v   │ ──┘┌───────▶ -o qemu
                          └────▶ │ conversion │ ───┘┌────────────┐
        VMware─▶┌────────────┐   │ server     │ ────▶ -o libvirt │─▶ KVM
        Xen ───▶│ -i libvirt ──▶ │            │     │  (default) │
        ... ───▶│  (default) │   │            │ ──┐ └────────────┘
                └────────────┘   │            │ ─┐└──────▶ -o glance
        -i libvirtxml ─────────▶ │            │ ┐└─────────▶ -o rhev
                                 └────────────┘ └──────────▶ -o vdsm

       Virt-v2v has a number of possible input and output modes, selected using the -i and -o options.  Only one input and output mode can be selected for each run of virt-v2v.

       -i disk is used for reading from local disk images (mainly for testing).

       -i libvirt is used for reading from any libvirt source.  Since libvirt can connect to many different hypervisors, it is used for reading guests from VMware, RHEL 5 Xen and more.  The -ic option
       selects the precise libvirt source.

       -i libvirtxml is used to read from libvirt XML files.  This is the method used by virt-p2v(1) behind the scenes.

       -i ova is used for reading from a VMware ova source file.

       -o glance is used for writing to OpenStack Glance.

       -o libvirt is used for writing to any libvirt target.  Libvirt can connect to local or remote KVM hypervisors.  The -oc option selects the precise libvirt target.

       -o local is used to write to a local disk image with a local libvirt configuration file (mainly for testing).

       -o qemu writes to a local disk image with a shell script for booting the guest directly in qemu (mainly for testing).

       -o rhev is used to write to a RHEV-M / oVirt target.  -o vdsm is only used when virt-v2v runs under VDSM control.

       --in-place instructs virt-v2v to customize the guest OS in the input virtual machine, instead of creating a new VM in the target hypervisor.

EXAMPLES
   Convert from VMware vCenter server to local libvirt
       You have a VMware vCenter server called "vcenter.example.com", a datacenter called "Datacenter", and an ESXi hypervisor called "esxi".  You want to convert a guest called "vmware_guest" to run
       locally under libvirt.

        virt-v2v -ic vpx://vcenter.example.com/Datacenter/esxi vmware_guest

       In this case you will most likely have to run virt-v2v as "root", since it needs to talk to the system libvirt daemon and copy the guest disks to /var/lib/libvirt/images.

       For more information see "INPUT FROM VMWARE VCENTER SERVER" below.

   Convert from VMware to RHEV-M/oVirt
       This is the same as the previous example, except you want to send the guest to a RHEV-M Export Storage Domain which is located remotely (over NFS) at "rhev.nfs:/export_domain".  If you are
       unclear about the location of the Export Storage Domain you should check the settings on your RHEV-M management console.  Guest network interface(s) are connected to the target network called
       "rhevm".

        virt-v2v -ic vpx://vcenter.example.com/Datacenter/esxi vmware_guest \
          -o rhev -os rhev.nfs:/export_domain --network rhevm

       In this case the host running virt-v2v acts as a conversion server.

       Note that after conversion, the guest will appear in the RHEV-M Export Storage Domain, from where you will need to import it using the RHEV-M user interface.  (See "OUTPUT TO RHEV").

   Convert disk image to OpenStack glance
       Given a disk image from another hypervisor that you want to convert to run on OpenStack (only KVM-based OpenStack is supported), you can do:

        virt-v2v -i disk disk.img -o glance

       To control the name of the image in Glance, use the -on option.

   Convert disk image to disk image
       Given a disk image from another hypervisor that you want to convert to run on KVM, you have two options.  The simplest way is to try:

        virt-v2v -i disk disk.img -o local -os /var/tmp

       where virt-v2v guesses everything about the input disk.img and (in this case) writes the converted result to /var/tmp.

       A more complex method is to write some libvirt XML describing the input guest (if you can get the source hypervisor to provide you with libvirt XML, then so much the better).  You can then do:

        virt-v2v -i libvirtxml guest-domain.xml -o local -os /var/tmp

       Since guest-domain.xml contains the path(s) to the guest disk image(s) you do not need to specify the name of the disk image on the command line.

       To convert a local disk image and immediately boot it in local qemu, do:

        virt-v2v -i disk disk.img -o qemu -os /var/tmp --qemu-boot

SUPPORT MATRIX
   Hypervisors (Input)
       VMware ESXi
           Must be managed by VMware vCenter ≥ 5.0.  Unmanaged, direct input from ESXi is not supported.

       OVA exported from VMware
           OVAs from other hypervisors will not work.

       RHEL 5 Xen
       Citrix Xen
           Citrix Xen has not been recently tested.

       Hyper-V
           Not recently tested.  Requires that you export the disk or use virt-p2v(1) on Hyper-V.

       Direct from disk images
           Only disk images exported from supported hypervisors, and using container formats supported by qemu.

       Physical machines
           Using the virt-p2v(1) tool.

   Hypervisors (Output)
       QEMU and KVM only.

   Virtualization management systems (Output)
       OpenStack Glance
       Red Hat Enterprise Virtualization (RHEV) 2.2 and up
       Local libvirt
           And hence virsh(1), virt-manager(1), and similar tools.

       Local disk

   Guests
       Red Hat Enterprise Linux 3, 4, 5, 6, 7
       CentOS 3, 4, 5, 6, 7
       Scientific Linux 3, 4, 5, 6, 7
       Oracle Linux
       Fedora
       SLES 10 and up
       OpenSUSE 10 and up
       Windows XP to Windows 8.1 / Windows Server 2012 R2
           We use Windows internal version numbers, see https://en.wikipedia.org/wiki/List_of_Microsoft_Windows_versions

           Currently NT 5.2 to NT 6.3 are supported.

           See "WINDOWS" below for additional notes on converting Windows guests.

   Guest firmware
       BIOS or UEFI for all guest types (but see "UEFI" below).

OPTIONS
       --help
           Display help.

       -b ...
       --bridge ...
           See --network below.

       --compressed
           Write a compressed output file.  This is only allowed if the output format is qcow2 (see -of below), and is equivalent to the -c option of qemu-img(1).

       --dcpath Folder/Datacenter
           NB: You don't need to use this parameter if you have libvirt ≥ 1.2.20.

           For VMware vCenter, override the "dcPath=..." parameter used to select the datacenter.  Virt-v2v can usually calculate this from the "vpx://" URI, but if it gets it wrong, then you can
           override it using this setting.  Go to your vCenter web folder interface, eg.  "https://vcenter.example.com/folder" (without a trailing slash), and examine the "dcPath=" parameter in the
           URLs that appear on this page.

       --debug-gc
           Debug garbage collection and memory allocation.  This is only useful when debugging memory problems in virt-v2v or the OCaml libguestfs bindings.

       --debug-overlays
           Save the overlay file(s) created during conversion.  This option is only used for debugging virt-v2v and may be removed in a future version.

       -i disk
           Set the input method to disk.

           In this mode you can read a virtual machine disk image with no metadata.  virt-v2v tries to guess the best default metadata.  This is usually adequate but you can get finer control (eg. of
           memory and vCPUs) by using -i libvirtxml instead.  Only guests that use a single disk can be imported this way.

       -i libvirt
           Set the input method to libvirt.  This is the default.

           In this mode you have to specify a libvirt guest name or UUID on the command line.  You may also specify a libvirt connection URI (see -ic).

       -i libvirtxml
           Set the input method to libvirtxml.

           In this mode you have to pass a libvirt XML file on the command line.  This file is read in order to get metadata about the source guest (such as its name, amount of memory), and also to
           locate the input disks.  See "MINIMAL XML FOR -i libvirtxml OPTION" below.

       -i local
           This is the same as -i disk.

       -i ova
           Set the input method to ova.

           In this mode you can read a VMware ova file.  Virt-v2v will read the ova manifest file and check the vmdk volumes for validity (checksums) as well as analyzing the ovf file, and then convert
           the guest.  See "INPUT FROM VMWARE OVA" below

       -ic libvirtURI
           Specify a libvirt connection URI to use when reading the guest.  This is only used when -i libvirt.

           Only local libvirt connections, VMware vCenter connections, or RHEL 5 Xen remote connections can be used.  Other remote libvirt connections will not work in general.

           See also "INPUT FROM VMWARE VCENTER SERVER", "INPUT FROM RHEL 5 XEN" below.

       -if format
           For -i disk only, this specifies the format of the input disk image.  For other input methods you should specify the input format in the metadata.

       --in-place
           Do not create an output virtual machine in the target hypervisor.  Instead, adjust the guest OS in the source VM to run in the input hypervisor.

           This mode is meant for integration with other toolsets, which take the responsibility of converting the VM configuration, providing for rollback in case of errors, transforming the storage,
           etc.

           Conflicts with all -o * options.

       --machine-readable
           This option is used to make the output more machine friendly when being parsed by other programs.  See "MACHINE READABLE OUTPUT" below.

       -n in:out
       -n out
       --network in:out
       --network out
       -b in:out
       -b out
       --bridge in:out
       --bridge out
           Map network (or bridge) called "in" to network (or bridge) called "out".  If no "in:" prefix is given, all other networks (or bridges) are mapped to "out".

           See "NETWORKS AND BRIDGES" below.

       --no-copy
           Don't copy the disks.  Instead, conversion is performed (and thrown away), and metadata is written, but no disks are created.  See also discussion of -o null below.

           This is useful in two cases: Either you want to test if conversion is likely to succeed, without the long copying process.  Or you are only interested in looking at the metadata.

           This option is not compatible with -o libvirt since it would create a faulty guest (one with no disks).

           This option is not compatible with -o glance for technical reasons.

       --no-trim all
       --no-trim mp[,mp...]
           By default virt-v2v runs fstrim(8) to reduce the amount of data that needs to be copied.  This is known to break some buggy bootloaders causing boot failures after conversion (see for
           example https://bugzilla.redhat.com/show_bug.cgi?id=1141145#c27).

           You can use --no-trim all to disable all trimming.  Note this will greatly increase the amount of data that has to be copied and can make virt-v2v run much more slowly.

           You can also disable trimming on selected filesystems only (specified by a comma-separated list of their mount point(s) in the guest).  Typically you would use --no-trim /boot to work around
           the grub bug mentioned above.

           You can also disable trimming on partitions using the libguestfs naming scheme for devices, eg: --no-trim /dev/sdb2 means do not trim the second partition on the second block device.  Use
           virt-filesystems(1) to list filesystem names in a guest.

       -o disk
           This is the same as -o local.

       -o glance
           Set the output method to OpenStack Glance.  In this mode the converted guest is uploaded to Glance.  You can control the image name by setting the -on option.

       -o libvirt
           Set the output method to libvirt.  This is the default.

           In this mode, the converted guest is created as a libvirt guest.  You may also specify a libvirt connection URI (see -oc).

           See "OUTPUT TO LIBVIRT" below.

       -o local
           Set the output method to local.

           In this mode, the converted guest is written to a local directory specified by -os /dir (the directory must exist).  The converted guest's disks are written as:

            /dir/name-sda
            /dir/name-sdb
            [etc]

           and a libvirt XML file is created containing guest metadata:

            /dir/name.xml

           where "name" is the guest name.

       -o null
           Set the output method to null.

           The guest is converted and copied (unless you also specify --no-copy), but the results are thrown away and no metadata is written.

       -o ovirt
           This is the same as -o rhev.

       -o qemu
           Set the output method to qemu.

           This is similar to -o local, except that a shell script is written which you can use to boot the guest in qemu.  The converted disks and shell script are written to the directory specified
           by -os.

           When using this output mode, you can also specify the --qemu-boot option which boots the guest under qemu immediately.

       -o rhev
           Set the output method to rhev.

           The converted guest is written to a RHEV Export Storage Domain.  The -os parameter must also be used to specify the location of the Export Storage Domain.  Note this does not actually import
           the guest into RHEV.  You have to do that manually later using the UI.

           See "OUTPUT TO RHEV" below.

       -o vdsm
           Set the output method to vdsm.

           This mode is similar to -o rhev, but the full path to the data domain must be given: /rhev/data-center/<data-center-uuid>/<data-domain-uuid>.  This mode is only used when virt-v2v runs under
           VDSM control.

       -oa sparse
       -oa preallocated
           Set the output file allocation mode.  The default is "sparse".

       -oc libvirtURI
           Specify a libvirt connection to use when writing the converted guest.  This is only used when -o libvirt.  See "OUTPUT TO LIBVIRT" below.

           Only local libvirt connections can be used.  Remote libvirt connections will not work.

       -of format
           When converting the guest, convert the disks to the given format.

           If not specified, then the input format is used.

       -on name
           Rename the guest when converting it.  If this option is not used then the output name is the same as the input name.

       -os storage
           The location of the storage for the converted guest.

           For -o libvirt, this is a libvirt directory pool (see "virsh pool-list") or pool UUID.

           For -o local and -o qemu, this is a directory name.  The directory must exist.

           For -o rhev, this can be an NFS path of the Export Storage Domain of the form "<host>:<path>", eg:

            rhev-storage.example.com:/rhev/export

           The NFS export must be mountable and writable by the user and host running virt-v2v, since the virt-v2v program has to actually mount it when it runs.  So you probably have to run virt-v2v
           as "root".

           Or: You can mount the Export Storage Domain yourself, and point -os to the mountpoint.  Note that virt-v2v will still need to write to this remote directory, so virt-v2v will still need to
           run as "root".

           You will get an error if virt-v2v is unable to mount/write to the Export Storage Domain.

       --password-file file
           Instead of asking for password(s) interactively, pass the password through a file.  Note the file should contain the whole password, without any trailing newline, and for security the file
           should have mode 0600 so that others cannot read it.

       --print-source
           Print information about the source guest and stop.  This option is useful when you are setting up network and bridge maps.  See "NETWORKS AND BRIDGES".

       --qemu-boot
           When using -o qemu only, this boots the guest immediately after virt-v2v finishes.

       -q
       --quiet
           This disables progress bars and other unnecessary output.

       --root ask
       --root single
       --root first
       --root /dev/sdX
       --root /dev/VG/LV
           Choose the root filesystem to be converted.

           In the case where the virtual machine is dual-boot or multi-boot, or where the VM has other filesystems that look like operating systems, this option can be used to select the root
           filesystem (a.k.a. "C:" drive or /) of the operating system that is to be converted.  The Windows Recovery Console, certain attached DVD drives, and bugs in libguestfs inspection heuristics,
           can make a guest look like a multi-boot operating system.

           The default in virt-v2v ≤ 0.7.1 was --root single, which causes virt-v2v to die if a multi-boot operating system is found.

           Since virt-v2v ≥ 0.7.2 the default is now --root ask: If the VM is found to be multi-boot, then virt-v2v will stop and list the possible root filesystems and ask the user which to use.  This
           requires that virt-v2v is run interactively.

           --root first means to choose the first root device in the case of a multi-boot operating system.  Since this is a heuristic, it may sometimes choose the wrong one.

           You can also name a specific root device, eg. --root /dev/sda2 would mean to use the second partition on the first hard drive.  If the named root device does not exist or was not detected as
           a root device, then virt-v2v will fail.

           Note that there is a bug in grub which prevents it from successfully booting a multiboot system if VirtIO is enabled.  Grub is only able to boot an operating system from the first VirtIO
           disk.  Specifically, /boot must be on the first VirtIO disk, and it cannot chainload an OS which is not in the first VirtIO disk.

       --vdsm-image-uuid UUID
       --vdsm-vol-uuid UUID
       --vdsm-vm-uuid UUID
       --vdsm-ovf-output
           Normally the RHEV output mode chooses random UUIDs for the target guest.  However VDSM needs to control the UUIDs and passes these parameters when virt-v2v runs under VDSM control.  The
           parameters control:

           ·   the image directory of each guest disk (--vdsm-image-uuid) (this option is passed once for each guest disk)

           ·   UUIDs for each guest disk (--vdsm-vol-uuid) (this option is passed once for each guest disk)

           ·   the OVF file name (--vdsm-vm-uuid).

           ·   the OVF output directory (default current directory) (--vdsm-ovf-output).

           The format of UUIDs is: "12345678-1234-1234-1234-123456789abc" (each hex digit can be "0-9" or "a-f"), conforming to OSF DCE 1.1.

           These options can only be used with -o vdsm.

       -v
       --verbose
           Enable verbose messages for debugging.

       -V
       --version
           Display version number and exit.

       --vmtype desktop
       --vmtype server
           For the -o rhev or -o vdsm targets only, specify the type of guest.  You can set this to "desktop" or "server".  If the option is not given, then a suitable default is chosen based on the
           detected guest operating system.

       -x  Enable tracing of libguestfs API calls.

XEN PARAVIRTUALIZED GUESTS
       Older versions of virt-v2v could turn a Xen paravirtualized (PV) guest into a KVM guest by installing a new kernel.  This version of virt-v2v does not attempt to install any new kernels.
       Instead it will give you an error if there are only Xen PV kernels available.

       Therefore before conversion you should check that a regular kernel is installed.  For some older Linux distributions, this means installing a kernel from the table below:

        RHEL 3         (Does not apply, as there was no Xen PV kernel)

        RHEL 4         i686 with > 10GB of RAM: install 'kernel-hugemem'
                       i686 SMP: install 'kernel-smp'
                       other i686: install 'kernel'
                       x86-64 SMP with > 8 CPUs: install 'kernel-largesmp'
                       x86-64 SMP: install 'kernel-smp'
                       other x86-64: install 'kernel'

        RHEL 5         i686: install 'kernel-PAE'
                       x86-64: install 'kernel'

        SLES 10        i586 with > 10GB of RAM: install 'kernel-bigsmp'
                       i586 SMP: install 'kernel-smp'
                       other i586: install 'kernel-default'
                       x86-64 SMP: install 'kernel-smp'
                       other x86-64: install 'kernel-default'

        SLES 11+       i586: install 'kernel-pae'
                       x86-64: install 'kernel-default'

        Windows        (Does not apply, as there is no Xen PV Windows kernel)

ENABLING VIRTIO
       "Virtio" is the name for a set of drivers which make disk (block device), network and other guest operations work much faster on KVM.

       Older versions of virt-v2v could install these drivers for certain Linux guests.  This version of virt-v2v does not attempt to install new Linux kernels or drivers, but will warn you if they are
       not installed already.

       In order to enable virtio, and hence improve performance of the guest after conversion, you should ensure that the minimum versions of packages are installed before conversion, by consulting the
       table below.

        RHEL 3         No virtio drivers are available

        RHEL 4         kernel >= 2.5.9-89.EL
                       lvm2 >= 2.02.42-5.el4
                       device-mapper >= 1.02.28-2.el4
                       selinux-policy-targeted >= 1.17.30-2.152.el4
                       policycoreutils >= 1.18.1-4.13

        RHEL 5         kernel >= 2.6.18-128.el5
                       lvm2 >= 2.02.40-6.el5
                       selinux-policy-targeted >= 2.4.6-203.el5

        RHEL 6+        All versions support virtio

        Fedora         All versions support virtio

        SLES 11+       All versions support virtio

        SLES 10        kernel >= 2.6.16.60-0.85.1

        OpenSUSE 11+   All versions support virtio

        OpenSUSE 10    kernel >= 2.6.25.5-1.1

        Windows        Drivers are installed from the directory pointed to by
                       "VIRTIO_WIN" environment variable
                       (/usr/share/virtio-win by default) if present

RHEL 4
   SELinux relabel appears to hang forever
       In RHEL ≤ 4.7 there was a bug which causes SELinux relabelling to appear to hang forever at:

        *** Warning -- SELinux relabel is required. ***
        *** Disabling security enforcement.         ***
        *** Relabeling could take a very long time, ***
        *** depending on file system size.          ***

       In reality it is waiting for you to press a key (but there is no visual indication of this).  You can either hit the "[Return]" key, at which point the guest will finish relabelling and reboot,
       or you can install policycoreutils ≥ 1.18.1-4.13 before starting the v2v conversion.  See also https://bugzilla.redhat.com/show_bug.cgi?id=244636

WINDOWS
   Boot failure: 0x0000007B
       This boot failure is caused by Windows being unable to find or load the right disk driver (eg. viostor.sys).  If you experience this error, here are some things to check:

       ·   First ensure that the guest boots on the source hypervisor before conversion.

       ·   Check you have the Windows virtio drivers available in /usr/share/virtio-win, and that virt-v2v did not print any warning about not being able to install virtio drivers.

           On Red Hat Enterprise Linux 7, you will need to install the signed drivers available in the "virtio-win" package.  If you do not have access to the signed drivers, then you will probably
           need to disable driver signing in the boot menus.

       ·   Check that you are presenting a virtio-blk interface (not virtio-scsi and not ide) to the guest.  On the qemu/KVM command line you should see something similar to this:

            ... -drive file=windows-sda,if=virtio ...

           In libvirt XML, you should see:

            <target dev='vda' bus='virtio'/>

       ·   Check that Windows Group Policy does not prevent the driver from being installed or used.  Try deleting Windows Group Policy before conversion.

       ·   Check there is no anti-virus or other software which implements Group Policy-like prohibitions on installing or using new drivers.

       ·   Enable boot debugging and check the viostor.sys driver is being loaded.

   OpenStack and Windows reactivation
       OpenStack does not offer stable device / PCI addresses to guests.  Every time it creates or starts a guest, it regenerates the libvirt XML for that guest from scratch.  The libvirt XML will have
       no <address> fields.  Libvirt will then assign addresses to devices, in a predictable manner.  Addresses may change if any of the following are true:

       ·   A new disk or network device has been added or removed from the guest.

       ·   The version of OpenStack or (possibly) libvirt has changed.

       Because Windows does not like "hardware" changes of this kind, it may trigger Windows reactivation.

       This can also prevent booting with a 7B error [see previous section] if the guest has group policy containing "Device Installation Restrictions".

UEFI
       VMware allows you to present UEFI firmware to guests (instead of the ordinary PC BIOS).  Virt-v2v can convert these guests, but requires that UEFI is supported by the target hypervisor.

       Currently KVM supports OVMF, a partially open source UEFI firmware, and can run these guests.

       Since OVMF support was only recently added to KVM (in 2014/2015), not all target environments support UEFI guests yet:

       UEFI on libvirt, qemu
           Supported.  Virt-v2v will generate the correct libvirt XML (metadata) automatically, but note that the same version of OVMF must be installed on the conversion host as is installed on the
           target hypervisor, else you will have to adjust paths in the metadata.

       UEFI on OpenStack
           Not supported.

       UEFI on RHEV
           Not supported.

NETWORKS AND BRIDGES
       Guests are usually connected to one or more networks, and when converted to the target hypervisor you usually want to reconnect those networks at the destination.  The options --network and
       --bridge allow you to do that.

       If you are unsure of what networks and bridges are in use on the source hypervisor, then you can examine the source metadata (libvirt XML, vCenter information, etc.).  Or you can run virt-v2v
       with the --print-source option which causes virt-v2v to print out the information it has about the guest on the source and then exit.

       In the --print-source output you will see a section showing the guest's Network Interface Cards (NICs):

        $ virt-v2v [-i ...] --print-source name
        [...]
        NICs:
            Network "default" mac: 52:54:00:d0:cf:0e

       This is typical of a libvirt guest: It has a single network interface connected to a network called "default".

       To map a specific network to a target network, for example "default" on the source to "rhevm" on the target, use:

        virt-v2v [...] --network default:rhevm

       To map every network to a target network, use:

        virt-v2v [...] --network rhevm

       Bridges are handled in the same way, but you have to use the --bridge option instead.  For example:

        $ virt-v2v [-i ...] --print-source name
        [...]
        NICs:
            Bridge "br0"

        $ virt-v2v [...] --bridge br0:targetbr

INPUT FROM VMWARE VCENTER SERVER
       Virt-v2v is able to import guests from VMware vCenter Server.

       vCenter ≥ 5.0 is required.  If you don't have vCenter, using OVA is recommended instead (see "INPUT FROM VMWARE OVA" below), or if that is not possible then see "INPUT FROM VMWARE ESXi
       HYPERVISOR".

       Virt-v2v uses libvirt for access to vCenter, and therefore the input mode should be -i libvirt.  As this is the default, you don't need to specify it on the command line.

   VCENTER: REMOVE VMWARE TOOLS FROM WINDOWS GUESTS
       For Windows guests, you should remove VMware tools before conversion.  Although this is not strictly necessary, and the guest will still be able to run, if you don't do this then the converted
       guest will complain on every boot.  The tools cannot be removed after conversion because the uninstaller checks if it is running on VMware and refuses to start (which is also the reason that
       virt-v2v cannot remove them).

       This is not necessary for Linux guests, as virt-v2v is able to remove VMware tools.

   VCENTER: URI
       The libvirt URI of a vCenter server looks something like this:

        vpx://user@server/Datacenter/esxi

       where:

       "user@"
           is the (optional, but recommended) user to connect as.

           If the username contains a backslash (eg. "DOMAIN\USER") then you will need to URI-escape that character using %5c: "DOMAIN%5cUSER" (5c is the hexadecimal ASCII code for backslash.)  Other
           punctuation may also have to be escaped.

       "server"
           is the vCenter Server (not hypervisor).

       "Datacenter"
           is the name of the datacenter.

           If the name contains a space, replace it with the URI-escape code %20.

       "esxi"
           is the name of the ESXi hypervisor running the guest.

       If the VMware deployment is using folders, then these may need to be added to the URI, eg:

        vpx://user@server/Folder/Datacenter/esxi

       For full details of libvirt URIs, see: http://libvirt.org/drvesx.html

       Typical errors from libvirt / virsh when the URI is wrong include:

       ·   Could not find datacenter specified in [...]

       ·   Could not find compute resource specified in [...]

       ·   Path [...] does not specify a compute resource

       ·   Path [...] does not specify a host system

       ·   Could not find host system specified in [...]

   VCENTER: TEST LIBVIRT CONNECTION TO VCENTER
       Use the virsh(1) command to list the guests on the vCenter Server like this:

        $ virsh -c 'vpx://root@vcenter.example.com/Datacenter/esxi' list --all
        Enter root's password for vcenter.example.com: ***

         Id    Name                           State
        ----------------------------------------------------
         -     Fedora 20                      shut off
         -     Windows 2003                   shut off

       If you get an error "Peer certificate cannot be authenticated with given CA certificates" or similar, then you can either import the vCenter host's certificate, or bypass signature verification
       by adding the "?no_verify=1" flag:

        $ virsh -c 'vpx://root@vcenter.example.com/Datacenter/esxi?no_verify=1' list --all

       You should also try dumping the metadata from any guest on your server, like this:

        $ virsh -c 'vpx://root@vcenter.example.com/Datacenter/esxi' dumpxml "Windows 2003"
        <domain type='vmware'>
          <name>Windows 2003</name>
          [...]
        </domain>

       If the above commands do not work, then virt-v2v is not going to work either.  Fix your libvirt configuration and/or your VMware vCenter Server before continuing.

   VCENTER: IMPORTING A GUEST
       To import a particular guest from vCenter Server, do:

        $ virt-v2v -ic 'vpx://root@vcenter.example.com/Datacenter/esxi?no_verify=1' \
          "Windows 2003" \
          -o local -os /var/tmp

       where "Windows 2003" is the name of the guest (which must be shut down).

       Note that you may be asked for the vCenter password twice.  This happens once because libvirt needs it, and a second time because virt-v2v itself connects directly to the server.  Use
       --password-file to supply a password via a file.

       In this case the output flags are set to write the converted guest to a temporary directory as this is just an example, but you can also write to libvirt or any other supported target.

   VCENTER: NON-ADMINISTRATOR ROLE
       Instead of using the vCenter Administrator role, you can create a custom non-administrator role to perform the conversion.  You will however need to give it a minimum set of permissions as
       follows:

       1.  Create a custom role in vCenter.

       2.  Enable (check) the following objects:

            Datastore:
             - Browse datastore
             - Low level file operations

            Session:
             - Validate session

            Virtual Machine:
              Provisioning:
                - Allow disk access
                - Allow read-only disk access
                - Guest Operating system management by VIX API

INPUT FROM VMWARE OVA
       Virt-v2v is able to import guests from VMware's OVA (Open Virtualization Appliance) files.  Only OVAs exported from VMware vSphere will work.

   OVA: REMOVE VMWARE TOOLS FROM WINDOWS GUESTS
       For Windows guests, you should remove VMware tools before conversion.  Although this is not strictly necessary, and the guest will still be able to run, if you don't do this then the converted
       guest will complain on every boot.  The tools cannot be removed after conversion because the uninstaller checks if it is running on VMware and refuses to start (which is also the reason that
       virt-v2v cannot remove them).

       This is not necessary for Linux guests, as virt-v2v is able to remove VMware tools.

   OVA: CREATE OVA
       To create an OVA in vSphere, use the "Export OVF Template" option (from the VM context menu, or from the File menu).  Either "Folder of files" (OVF) or "Single file" (OVA) will work, but OVA is
       probably easier to deal with.  OVA files are really just uncompressed tar files, so you can use commands like "tar tf VM.ova" to view their contents.

       Create OVA with ovftool

       You can also use VMware's proprietary "ovftool":

        ovftool --noSSLVerify \
          vi://USER:PASSWORD@esxi.example.com/VM \
          VM.ova

       To connect to vCenter:

        ovftool  --noSSLVerify \
          vi://USER:PASSWORD@vcenter.example.com/DATACENTER-NAME/vm/VM \
          VM.ova

       For Active Directory-aware authentication, you have to express the "@" character in the form of its ascii hex-code (%5c):

        vi://DOMAIN%5cUSER:PASSWORD@...

   OVA: IMPORTING A GUEST
       To import an OVA file called VM.ova, do;

        $ virt-v2v -i ova VM.ova -o local -os /var/tmp

       If you exported the guest as a "Folder of files", or if you unpacked the OVA tarball yourself, then you can point virt-v2v at the directory containing the files:

        $ virt-v2v -i ova /path/to/files -o local -os /var/tmp

INPUT FROM VMWARE ESXi HYPERVISOR
       Virt-v2v cannot access an ESXi hypervisor directly.  You should use the OVA method above (see "INPUT FROM VMWARE OVA") if possible, as it is much faster and requires much less disk space than
       the method described in this section.

       You can use the virt-v2v-copy-to-local(1) tool to copy the guest off the hypervisor into a local file, and then convert it.

   ESXi: REMOVE VMWARE TOOLS FROM WINDOWS GUESTS
       For Windows guests, you should remove VMware tools before conversion.  Although this is not strictly necessary, and the guest will still be able to run, if you don't do this then the converted
       guest will complain on every boot.  The tools cannot be removed after conversion because the uninstaller checks if it is running on VMware and refuses to start (which is also the reason that
       virt-v2v cannot remove them).

       This is not necessary for Linux guests, as virt-v2v is able to remove VMware tools.

   ESXi: URI
       The libvirt URI for VMware ESXi hypervisors will look something like this:

        esx://root@esxi.example.com?no_verify=1

       The "?no_verify=1" parameter disables TLS certificate checking.

   ESXi: TEST LIBVIRT CONNECTION TO ESXi HYPERVISOR
       Use the virsh(1) command to test the URI and list the remote guests available:

        $ virsh -c esx://root@esxi.example.com?no_verify=1 list --all
        Enter root's password for esxi.example.com: ***
         Id    Name                           State
        ----------------------------------------------------
         -     guest                          shut off

   ESXi: COPY THE GUEST TO THE LOCAL MACHINE
       Using the libvirt URI as the -ic option, copy one of the guests to the local machine:

        $ virt-v2v-copy-to-local -ic esx://root@esxi.example.com?no_verify=1 guest

       This creates guest.xml, guest-disk1, ...

   ESXi: DO THE VIRT-V2V CONVERSION
       Perform the conversion of the guest using virt-v2v:

        $ virt-v2v -i libvirtxml guest.xml -o local -os /var/tmp

   ESXi: CLEAN UP
       Remove the guest.xml and guest-disk* files.

INPUT FROM RHEL 5 XEN
       Virt-v2v is able to import Xen guests from RHEL 5 Xen hosts.

       Virt-v2v uses libvirt for access to the remote Xen host, and therefore the input mode should be -i libvirt.  As this is the default, you don't need to specify it on the command line.

   XEN: SET UP SSH-AGENT ACCESS TO XEN HOST
       Currently you must enable passwordless SSH access to the remote Xen host from the virt-v2v conversion server.

       You must also use ssh-agent, and add your ssh public key to /root/.ssh/authorized_keys (on the Xen host).

       After doing this, you should check that passwordless access works from the virt-v2v server to the Xen host.  For example:

        $ ssh root@xen.example.com
        [ logs straight into the shell, no password is requested ]

       Note that password-interactive and Kerberos access are not supported.  You have to set up ssh access using ssh-agent and authorized_keys.

   XEN: TEST LIBVIRT CONNECTION TO REMOTE XEN HOST
       Use the virsh(1) command to list the guests on the remote Xen host:

        $ virsh -c xen+ssh://root@xen.example.com list --all
         Id    Name                           State
        ----------------------------------------------------
         0     Domain-0                       running
         -     rhel49-x86_64-pv               shut off

       You should also try dumping the metadata from any guest on your server, like this:

        $ virsh -c xen+ssh://root@xen.example.com dumpxml rhel49-x86_64-pv
        <domain type='xen'>
          <name>rhel49-x86_64-pv</name>
          [...]
        </domain>

       If the above commands do not work, then virt-v2v is not going to work either.  Fix your libvirt configuration or the remote server before continuing.

       If the guest disks are located on a host block device, then the conversion will fail.  See "XEN OR SSH CONVERSIONS FROM BLOCK DEVICES" below for a workaround.

   XEN: IMPORTING A GUEST
       To import a particular guest from a Xen server, do:

        $ virt-v2v -ic 'xen+ssh://root@xen.example.com' \
          rhel49-x86_64-pv \
          -o local -os /var/tmp

       where "rhel49-x86_64-pv" is the name of the guest (which must be shut down).

       In this case the output flags are set to write the converted guest to a temporary directory as this is just an example, but you can also write to libvirt or any other supported target.

   XEN OR SSH CONVERSIONS FROM BLOCK DEVICES
       Currently virt-v2v cannot directly access a Xen guest (or any guest located remotely over ssh) if that guest's disks are located on host block devices.

       To tell if a Xen guest uses host block devices, look at the guest XML.  You will see:

         <disk type='block' device='disk'>
           ...
           <source dev='/dev/VG/guest'/>

       where "type='block'", "source dev=" and "/dev/..." are all indications that the disk is located on a host block device.

       This happens because the qemu ssh block driver that we use to access remote disks uses the ssh sftp protocol, and this protocol cannot correctly detect the size of host block devices.

       The workaround is to copy the guest over to the conversion server, using the separate virt-v2v-copy-to-local(1) tool, followed by running virt-v2v.  You will need sufficient space on the
       conversion server to store a full copy of the guest.

        virt-v2v-copy-to-local -ic xen+ssh://root@xen.example.com guest
        virt-v2v -i libvirtxml guest.xml -o local -os /var/tmp
        rm guest.xml guest-disk*

OUTPUT TO LIBVIRT
       The -o libvirt option lets you upload the converted guest to a libvirt-managed host.  There are several limitations:

       ·   You can only use a local libvirt connection [see below for how to workaround this].

       ·   The -os pool option must specify a directory pool, not anything more exotic such as iSCSI [but see below].

       ·   You can only upload to a KVM hypervisor.

       To output to a remote libvirt instance and/or a non-directory storage pool you have to use the following workaround:

       1.  Use virt-v2v in -o local mode to convert the guest disks and metadata into a local temporary directory:

            virt-v2v [...] -o local -os /var/tmp

           This creates two (or more) files in /var/tmp called:

            /var/tmp/NAME.xml     # the libvirt XML (metadata)
            /var/tmp/NAME-sda     # the guest's first disk

           (for "NAME" substitute the guest's name).

       2.  Upload the converted disk(s) into the storage pool called "POOL":

            size=$(stat -c%s /var/tmp/NAME-sda)
            virsh vol-create-as POOL NAME-sda $size --format raw
            virsh vol-upload --pool POOL NAME-sda /var/tmp/NAME-sda

       3.  Edit /var/tmp/NAME.xml to change /var/tmp/NAME-sda to the pool name.  In other words, locate the following bit of XML:

            <disk type='file' device='disk'>
              <driver name='qemu' type='raw' cache='none' />
              <source file='/var/tmp/NAME-sda' />
              <target dev='hda' bus='ide' />
            </disk>

           and change two things: The "type='file'" attribute must be changed to "type='volume'", and the "<source>" element must be changed to include "pool" and "volume" attributes:

            <disk type='volume' device='disk'>
              ...
              <source pool='POOL' volume='NAME-sda' />
              ...
            </disk>

       4.  Define the final guest in libvirt:

            virsh define /var/tmp/NAME.xml

OUTPUT TO RHEV
       This section only applies to the -o rhev output mode.  If you use virt-v2v from the RHEV-M user interface, then behind the scenes the import is managed by VDSM using the -o vdsm output mode
       (which end users should not try to use directly).

       You have to specify -o rhev and an -os option that points to the RHEV-M Export Storage Domain.  You can either specify the NFS server and mountpoint, eg. "-os rhev-storage:/rhev/export", or you
       can mount that first and point to the directory where it is mounted, eg. "-os /tmp/mnt".  Be careful not to point to the Data Storage Domain by accident as that will not work.

       On successful completion virt-v2v will have written the new guest to the Export Storage Domain, but it will not yet be ready to run.  It must be imported into RHEV using the UI before it can be
       used.

       In RHEV ≥ 2.2 this is done from the Storage tab.  Select the export domain the guest was written to.  A pane will appear underneath the storage domain list displaying several tabs, one of which
       is "VM Import".  The converted guest will be listed here.  Select the appropriate guest an click "Import".  See the RHEV documentation for additional details.

       If you export several guests, then you can import them all at the same time through the UI.

RESOURCE REQUIREMENTS
   Network
       The most important resource for virt-v2v appears to be network bandwidth.  Virt-v2v should be able to copy guest data at gigabit ethernet speeds or greater.

       Ensure that the network connections between servers (conversion server, NFS server, vCenter, Xen) are as fast and as low latency as possible.

   Disk space
       Virt-v2v places potentially large temporary files in $TMPDIR (which is /var/tmp if you don't set it).  Using tmpfs is a bad idea.

       For each guest disk, an overlay is stored temporarily.  This stores the changes made during conversion, and is used as a cache.  The overlays are not particularly large - tens or low hundreds of
       megabytes per disk is typical.  In addition to the overlay(s), input and output methods may use disk space, as outlined in the table below.

       -i ova
           This temporarily places a full copy of the uncompressed source disks in $TMPDIR.

       -o glance
           This temporarily places a full copy of the output disks in $TMPDIR.

       -o local
       -o qemu
           You must ensure there is sufficient space in the output directory for the converted guest.

       -o null
           This temporarily places a full copy of the output disks in $TMPDIR.

   VMware vCenter resources
       Copying from VMware vCenter is currently quite slow, but we believe this to be an issue with VMware.  Ensuring the VMware ESXi hypervisor and vCenter are running on fast hardware with plenty of
       memory should alleviate this.

   Compute power and RAM
       Virt-v2v is not especially compute or RAM intensive.  If you are running many parallel conversions, then you may consider allocating one CPU core and between 512 MB and 1 GB of RAM per running
       instance.

       Virt-v2v can be run in a virtual machine.

POST-CONVERSION TASKS
   Guest network configuration
       Virt-v2v cannot currently reconfigure a guest's network configuration.  If the converted guest is not connected to the same subnet as the source, its network configuration may have to be
       updated.  See also virt-customize(1).

   Converting a Windows guest
       When converting a Windows guests, the conversion process is split into two stages:

       1.  Offline conversion.

       2.  First boot.

       The guest will be bootable after the offline conversion stage, but will not yet have all necessary drivers installed to work correctly.  These will be installed automatically the first time the
       guest boots.

       N.B. Take care not to interrupt the automatic driver installation process when logging in to the guest for the first time, as this may prevent the guest from subsequently booting correctly.

FREE SPACE FOR CONVERSION
       Virt-v2v checks there is sufficient free space in the guest filesystem to perform the conversion.  Currently it checks:

       Linux root filesystem or Windows "C:" drive
           Minimum free space: 20 MB

       Linux /boot
           Minimum free space: 50 MB

           This is because we need to build a new initramfs for some Enterprise Linux conversions.

       Any other mountable filesystem
           Minimum free space: 10 MB

RUNNING VIRT-V2V AS ROOT OR NON-ROOT
       Nothing in virt-v2v inherently needs root access, and it will run just fine as a non-root user.  However, certain external features may require either root or a special user:

       Mounting the Export Storage Domain
           When using -o rhev -os server:/esd virt-v2v has to have sufficient privileges to NFS mount the Export Storage Domain from "server".

           You can avoid needing root here by mounting it yourself before running virt-v2v, and passing -os /mountpoint instead, but first of all read the next section ...

       Writing to the Export Storage Domain as 36:36
           RHEV-M cannot read files and directories from the Export Storage Domain unless they have UID:GID 36:36.  You will see VM import problems if the UID:GID is not correct.

           When you run virt-v2v -o rhev as root, virt-v2v attempts to create files and directories with the correct ownership.  If you run virt-v2v as non-root, it will probably still work, but you
           will need to manually change ownership after virt-v2v has finished.

       Writing to libvirt
           When using -o libvirt, you may need to run virt-v2v as root so that it can write to the libvirt system instance (ie. "qemu:///system") and to the default location for disk images (usually
           /var/lib/libvirt/images).

           You can avoid this by setting up libvirt connection authentication, see http://libvirt.org/auth.html.  Alternatively, use -oc qemu:///session, which will write to your per-user libvirt
           instance.

       Writing to Glance
           This does not need root (in fact it probably won't work), but may require either a special user and/or for you to source a script that sets authentication environment variables.  Consult the
           Glance documentation.

DEBUGGING RHEV-M IMPORT FAILURES
       When you export to the RHEV-M Export Storage Domain, and then import that guest through the RHEV-M UI, you may encounter an import failure.  Diagnosing these failures is infuriatingly difficult
       as the UI generally hides the true reason for the failure.

       There are two log files of interest.  The first is stored on the RHEV-M server itself, and is called /var/log/ovirt-engine/engine.log

       The second file, which is the most useful, is found on the SPM host (SPM stands for "Storage Pool Manager").  This is a RHEV node that is elected to do all metadata modifications in the data
       center, such as image or snapshot creation.  You can find out which host is the current SPM from the "Hosts" tab "Spm Status" column.  Once you have located the SPM, log into it and grab the
       file /var/log/vdsm/vdsm.log which will contain detailed error messages from low-level commands.

MINIMAL XML FOR -i libvirtxml OPTION
       When using the -i libvirtxml option, you have to supply some libvirt XML.  Writing this from scratch is hard, so the template below is helpful.

       Note this should only be used for testing and/or where you know what you're doing!  If you have libvirt metadata for the guest, always use that instead.

        <domain type='kvm'>
          <name>NAME</name>
          <memory>1048576</memory>
          <vcpu>2</vcpu>
          <os>
            <type>hvm</type>
            <boot dev='hd'/>
          </os>
          <features>
            <acpi/>
            <apic/>
            <pae/>
          </features>
          <devices>
            <disk type='file' device='disk'>
              <driver name='qemu' type='raw'/>
              <source file='/path/to/disk/image'/>
              <target dev='hda' bus='ide'/>
            </disk>
            <interface type='network'>
              <mac address='52:54:00:01:02:03'/>
              <source network='default'/>
              <model type='rtl8139'/>
            </interface>
          </devices>
        </domain>

MACHINE READABLE OUTPUT
       The --machine-readable option can be used to make the output more machine friendly, which is useful when calling virt-v2v from other programs, GUIs etc.

       There are two ways to use this option.

       Firstly use the option on its own to query the capabilities of the virt-v2v binary.  Typical output looks like this:

        $ virt-v2v --machine-readable
        virt-v2v
        libguestfs-rewrite
        input:disk
        [...]
        output:local
        [...]
        convert:enterprise-linux
        convert:windows

       A list of features is printed, one per line, and the program exits with status 0.

       The "input:" and "output:" features refer to -i and -o (input and output mode) options supported by this binary.  The "convert:" features refer to guest types that this binary knows how to
       convert.

       Secondly use the option in conjunction with other options to make the regular program output more machine friendly.

       At the moment this means:

       1.  Progress bar messages can be parsed from stdout by looking for this regular expression:

            ^[0-9]+/[0-9]+$

       2.  The calling program should treat messages sent to stdout (except for progress bar messages) as status messages.  They can be logged and/or displayed to the user.

       3.  The calling program should treat messages sent to stderr as error messages.  In addition, virt-v2v exits with a non-zero status code if there was a fatal error.

       Virt-v2v ≤ 0.9.1 did not support the --machine-readable option at all.  The option was added when virt-v2v was rewritten in 2014.

FILES
       /usr/share/virtio-win
           (Optional)

           If this directory is present, then virtio drivers for Windows guests will be found from this directory and installed in the guest during conversion.

ENVIRONMENT VARIABLES
       "TMPDIR"
           Location of the temporary directory used for the potentially large temporary overlay file.

           See the "Disk space" section above.

       "VIRT_TOOLS_DATA_DIR"
           This can point to the directory containing data files used for Windows conversion.

           Normally you do not need to set this.  If not set, a compiled-in default will be used (something like /usr/share/virt-tools).

           This directory may contain the following files:

           rhsrvany.exe
               (Required when doing conversions of Windows guests)

               This is the RHSrvAny Windows binary, used to install a "firstboot" script in the guest during conversion of Windows guests.

               See also: "https://github.com/rwmjones/rhsrvany"

           rhev-apt.exe
               (Optional)

               The RHEV Application Provisioning Tool (RHEV APT).  If this file is present, then RHEV APT will be installed in the Windows guest during conversion.  This tool is a guest agent which
               ensures that the virtio drivers remain up to date when the guest is running on Red Hat Enterprise Virtualization (RHEV).

               This file comes from Red Hat Enterprise Virtualization (RHEV), and is not distributed with virt-v2v.

       "VIRTIO_WIN"
           This is where VirtIO drivers for Windows are searched for (/usr/share/virtio-win if unset).  It can be a directory or point to virtio-win.iso (CD ROM image containing drivers).

           See "ENABLING VIRTIO".

       For other environment variables, see "ENVIRONMENT VARIABLES" in guestfs(3).

OTHER TOOLS
       virt-v2v-copy-to-local(1)
           There are some special cases where virt-v2v cannot directly access the remote hypervisor.  In that case you have to use virt-v2v-copy-to-local(1) to make a local copy of the guest first,
           followed by running "virt-v2v -i libvirtxml" to perform the conversion.

       engine-image-uploader(8)
           Variously called "engine-image-uploader", "ovirt-image-uploader" or "rhevm-image-uploader", this tool allows you to copy a guest from one oVirt or RHEV Export Storage Domain to another.  It
           only permits importing a guest that was previously exported from another oVirt/RHEV instance.

       import-to-ovirt.pl
           This script can be used to import guests that already run on KVM to oVirt or RHEV.  For more information, see this blog posting by the author of virt-v2v:

           https://rwmj.wordpress.com/2015/09/18/importing-kvm-guests-to-ovirt-or-rhev/#content

SEE ALSO
       virt-p2v(1), virt-customize(1), virt-df(1), virt-filesystems(1), virt-sparsify(1), virt-sysprep(1), guestfs(3), guestfish(1), qemu-img(1), fstrim(8), virt-v2v-copy-to-local(1),
       virt-v2v-test-harness(1), engine-image-uploader(8), import-to-ovirt.pl, http://libguestfs.org/.

AUTHORS
       Richard W.M. Jones http://people.redhat.com/~rjones/

       Matthew Booth

       Mike Latimer

       Pino Toscano

       Shahar Havivi

       Tingting Zheng

COPYRIGHT
       Copyright (C) 2009-2016 Red Hat Inc.

LICENSE
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
       02110-1301 USA.

BUGS
       To get a list of bugs against libguestfs, use this link: https://bugzilla.redhat.com/buglist.cgi?component=libguestfs&product=Virtualization+Tools

       To report a new bug against libguestfs, use this link: https://bugzilla.redhat.com/enter_bug.cgi?component=libguestfs&product=Virtualization+Tools

       When reporting a bug, please supply:

       ·   The version of libguestfs.

       ·   Where you got libguestfs (eg. which Linux distro, compiled from source, etc)

       ·   Describe the bug accurately and give a way to reproduce it.

       ·   Run libguestfs-test-tool(1) and paste the complete, unedited output into the bug report.

libguestfs-1.32.2                                                                               2016-01-29                                                                                    virt-v2v(1)
