QEMU(1)                                                                                                                                                                                           QEMU(1)

NAME
       qemu-doc - QEMU Emulator User Documentation

SYNOPSIS
       usage: qemu-system-i386 [options] [disk_image]

DESCRIPTION
       The QEMU PC System emulator simulates the following peripherals:

       -   i440FX host PCI bridge and PIIX3 PCI to ISA bridge

       -   Cirrus CLGD 5446 PCI VGA card or dummy VGA card with Bochs VESA extensions (hardware level, including all non standard modes).

       -   PS/2 mouse and keyboard

       -   2 PCI IDE interfaces with hard disk and CD-ROM support

       -   Floppy disk

       -   PCI and ISA network adapters

       -   Serial ports

       -   Creative SoundBlaster 16 sound card

       -   ENSONIQ AudioPCI ES1370 sound card

       -   Intel 82801AA AC97 Audio compatible sound card

       -   Intel HD Audio Controller and HDA codec

       -   Adlib (OPL2) - Yamaha YM3812 compatible chip

       -   Gravis Ultrasound GF1 sound card

       -   CS4231A compatible sound card

       -   PCI UHCI USB controller and a virtual USB hub.

       SMP is supported with up to 255 CPUs.

       QEMU uses the PC BIOS from the Seabios project and the Plex86/Bochs LGPL VGA BIOS.

       QEMU uses YM3812 emulation by Tatsuyuki Satoh.

       QEMU uses GUS emulation (GUSEMU32 <http://www.deinmeister.de/gusemu/>) by Tibor "TS" Schütz.

       Note that, by default, GUS shares IRQ(7) with parallel ports and so QEMU must be told to not have parallel ports to have working GUS.

               qemu-system-i386 dos.img -soundhw gus -parallel none

       Alternatively:

               qemu-system-i386 dos.img -device gus,irq=5

       Or some other unclaimed IRQ.

       CS4231A is the chip used in Windows Sound System and GUSMAX products

OPTIONS
       disk_image is a raw hard disk image for IDE hard disk 0. Some targets do not need a disk image.

       Standard options:

       -h  Display help and exit

       -version
           Display version information and exit

       -machine [type=]name[,prop=value[,...]]
           Select the emulated machine by name. Use "-machine help" to list available machines. Supported machine properties are:

           accel=accels1[:accels2[:...]]
               This is used to enable an accelerator. Depending on the target architecture, kvm, xen, or tcg can be available. By default, tcg is used. If there is more than one accelerator specified,
               the next one is used if the previous one fails to initialize.

           kernel_irqchip=on|off
               Enables in-kernel irqchip support for the chosen accelerator when available.

           gfx_passthru=on|off
               Enables IGD GFX passthrough support for the chosen machine when available.

           vmport=on|off|auto
               Enables emulation of VMWare IO port, for vmmouse etc. auto says to select the value based on accel. For accel=xen the default is off otherwise the default is on.

           kvm_shadow_mem=size
               Defines the size of the KVM shadow MMU.

           dump-guest-core=on|off
               Include guest memory in a core dump. The default is on.

           mem-merge=on|off
               Enables or disables memory merge support. This feature, when supported by the host, de-duplicates identical memory pages among VMs instances (enabled by default).

           iommu=on|off
               Enables or disables emulated Intel IOMMU (VT-d) support. The default is off.

           aes-key-wrap=on|off
               Enables or disables AES key wrapping support on s390-ccw hosts. This feature controls whether AES wrapping keys will be created to allow execution of AES cryptographic functions.  The
               default is on.

           dea-key-wrap=on|off
               Enables or disables DEA key wrapping support on s390-ccw hosts. This feature controls whether DEA wrapping keys will be created to allow execution of DEA cryptographic functions.  The
               default is on.

       -cpu model
           Select CPU model ("-cpu help" for list and additional feature selection)

       -smp [cpus=]n[,cores=cores][,threads=threads][,sockets=sockets][,maxcpus=maxcpus]
           Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs are supported. On Sparc32 target, Linux limits the number of usable CPUs to 4.  For the PC target, the number of cores
           per socket, the number of threads per cores and the total number of sockets can be specified. Missing values will be computed. If any on the three values is given, the total number of CPUs n
           can be omitted. maxcpus specifies the maximum number of hotpluggable CPUs.

       -numa node[,mem=size][,cpus=cpu[-cpu]][,nodeid=node]
       -numa node[,memdev=id][,cpus=cpu[-cpu]][,nodeid=node]
           Simulate a multi node NUMA system. If mem, memdev and cpus are omitted, resources are split equally. Also, note that the -numa option doesn't allocate any of the specified resources. That
           is, it just assigns existing resources to NUMA nodes. This means that one still has to use the -m, -smp options to allocate RAM and VCPUs respectively, and possibly -object to specify the
           memory backend for the memdev suboption.

           mem and memdev are mutually exclusive.  Furthermore, if one node uses memdev, all of them have to use it.

       -add-fd fd=fd,set=set[,opaque=opaque]
           Add a file descriptor to an fd set.  Valid options are:

           fd=fd
               This option defines the file descriptor of which a duplicate is added to fd set.  The file descriptor cannot be stdin, stdout, or stderr.

           set=set
               This option defines the ID of the fd set to add the file descriptor to.

           opaque=opaque
               This option defines a free-form string that can be used to describe fd.

           You can open an image using pre-opened file descriptors from an fd set:

                   qemu-system-i386
                   -add-fd fd=3,set=2,opaque="rdwr:/path/to/file"
                   -add-fd fd=4,set=2,opaque="rdonly:/path/to/file"
                   -drive file=/dev/fdset/2,index=0,media=disk

       -set group.id.arg=value
           Set parameter arg for item id of type group "

       -global driver.prop=value
       -global driver=driver,property=property,value=value
           Set default value of driver's property prop to value, e.g.:

                   qemu-system-i386 -global ide-drive.physical_block_size=4096 -drive file=file,if=ide,index=0,media=disk

           In particular, you can use this to set driver properties for devices which are created automatically by the machine model. To create a device which is not created automatically and set
           properties on it, use -device.

           -global driver.prop=value is shorthand for -global driver=driver,property=prop,value=value.  The longhand syntax works even when driver contains a dot.

       -boot [order=drives][,once=drives][,menu=on|off][,splash=sp_name][,splash-time=sp_time][,reboot-timeout=rb_timeout][,strict=on|off]
           Specify boot order drives as a string of drive letters. Valid drive letters depend on the target architecture. The x86 PC uses: a, b (floppy 1 and 2), c (first hard disk), d (first CD-ROM),
           n-p (Etherboot from network adapter 1-4), hard disk boot is the default. To apply a particular boot order only on the first startup, specify it via once.

           Interactive boot menus/prompts can be enabled via menu=on as far as firmware/BIOS supports them. The default is non-interactive boot.

           A splash picture could be passed to bios, enabling user to show it as logo, when option splash=sp_name is given and menu=on, If firmware/BIOS supports them. Currently Seabios for X86 system
           support it.  limitation: The splash file could be a jpeg file or a BMP file in 24 BPP format(true color). The resolution should be supported by the SVGA mode, so the recommended is 320x240,
           640x480, 800x640.

           A timeout could be passed to bios, guest will pause for rb_timeout ms when boot failed, then reboot. If rb_timeout is '-1', guest will not reboot, qemu passes '-1' to bios by default.
           Currently Seabios for X86 system support it.

           Do strict boot via strict=on as far as firmware/BIOS supports it. This only effects when boot priority is changed by bootindex options. The default is non-strict boot.

                   # try to boot from network first, then from hard disk
                   qemu-system-i386 -boot order=nc
                   # boot from CD-ROM first, switch back to default order after reboot
                   qemu-system-i386 -boot once=d
                   # boot with a splash picture for 5 seconds.
                   qemu-system-i386 -boot menu=on,splash=/root/boot.bmp,splash-time=5000

           Note: The legacy format '-boot drives' is still supported but its use is discouraged as it may be removed from future versions.

       -m [size=]megs[,slots=n,maxmem=size]
           Sets guest startup RAM size to megs megabytes. Default is 128 MiB.  Optionally, a suffix of "M" or "G" can be used to signify a value in megabytes or gigabytes respectively. Optional pair
           slots, maxmem could be used to set amount of hotpluggable memory slots and maximum amount of memory. Note that maxmem must be aligned to the page size.

           For example, the following command-line sets the guest startup RAM size to 1GB, creates 3 slots to hotplug additional memory and sets the maximum memory the guest can reach to 4GB:

                   qemu-system-x86_64 -m 1G,slots=3,maxmem=4G

           If slots and maxmem are not specified, memory hotplug won't be enabled and the guest startup RAM will never increase.

       -mem-path path
           Allocate guest RAM from a temporarily created file in path.

       -mem-prealloc
           Preallocate memory when using -mem-path.

       -k language
           Use keyboard layout language (for example "fr" for French). This option is only needed where it is not easy to get raw PC keycodes (e.g. on Macs, with some X11 servers or with a VNC
           display). You don't normally need to use it on PC/Linux or PC/Windows hosts.

           The available layouts are:

                   ar  de-ch  es  fo     fr-ca  hu  ja  mk     no  pt-br  sv
                   da  en-gb  et  fr     fr-ch  is  lt  nl     pl  ru     th
                   de  en-us  fi  fr-be  hr     it  lv  nl-be  pt  sl     tr

           The default is "en-us".

       -audio-help
           Will show the audio subsystem help: list of drivers, tunable parameters.

       -soundhw card1[,card2,...] or -soundhw all
           Enable audio and selected sound hardware. Use 'help' to print all available sound hardware.

                   qemu-system-i386 -soundhw sb16,adlib disk.img
                   qemu-system-i386 -soundhw es1370 disk.img
                   qemu-system-i386 -soundhw ac97 disk.img
                   qemu-system-i386 -soundhw hda disk.img
                   qemu-system-i386 -soundhw all disk.img
                   qemu-system-i386 -soundhw help

           Note that Linux's i810_audio OSS kernel (for AC97) module might require manually specifying clocking.

                   modprobe i810_audio clocking=48000

       -balloon none
           Disable balloon device.

       -balloon virtio[,addr=addr]
           Enable virtio balloon device (default), optionally with PCI address addr.

       -device driver[,prop[=value][,...]]
           Add device driver.  prop=value sets driver properties.  Valid properties depend on the driver.  To get help on possible drivers and properties, use "-device help" and "-device driver,help".

       -name name
           Sets the name of the guest.  This name will be displayed in the SDL window caption.  The name will also be used for the VNC server.  Also optionally set the top visible process name in
           Linux.  Naming of individual threads can also be enabled on Linux to aid debugging.

       -uuid uuid
           Set system UUID.

       Block device options:

       -fda file
       -fdb file
           Use file as floppy disk 0/1 image.

       -hda file
       -hdb file
       -hdc file
       -hdd file
           Use file as hard disk 0, 1, 2 or 3 image.

       -cdrom file
           Use file as CD-ROM image (you cannot use -hdc and -cdrom at the same time). You can use the host CD-ROM by using /dev/cdrom as filename.

       -drive option[,option[,option[,...]]]
           Define a new drive. Valid options are:

           file=file
               This option defines which disk image to use with this drive. If the filename contains comma, you must double it (for instance, "file=my,,file" to use file "my,file").

               Special files such as iSCSI devices can be specified using protocol specific URLs. See the section for "Device URL Syntax" for more information.

           if=interface
               This option defines on which type on interface the drive is connected.  Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.

           bus=bus,unit=unit
               These options define where is connected the drive by defining the bus number and the unit id.

           index=index
               This option defines where is connected the drive by using an index in the list of available connectors of a given interface type.

           media=media
               This option defines the type of the media: disk or cdrom.

           cyls=c,heads=h,secs=s[,trans=t]
               These options have the same definition as they have in -hdachs.

           snapshot=snapshot
               snapshot is "on" or "off" and controls snapshot mode for the given drive (see -snapshot).

           cache=cache
               cache is "none", "writeback", "unsafe", "directsync" or "writethrough" and controls how the host cache is used to access block data.

           aio=aio
               aio is "threads", or "native" and selects between pthread based disk I/O and native Linux AIO.

           discard=discard
               discard is one of "ignore" (or "off") or "unmap" (or "on") and controls whether discard (also known as trim or unmap) requests are ignored or passed to the filesystem.  Some machine
               types may not support discard requests.

           format=format
               Specify which disk format will be used rather than detecting the format.  Can be used to specifiy format=raw to avoid interpreting an untrusted format header.

           serial=serial
               This option specifies the serial number to assign to the device.

           addr=addr
               Specify the controller's PCI address (if=virtio only).

           werror=action,rerror=action
               Specify which action to take on write and read errors. Valid actions are: "ignore" (ignore the error and try to continue), "stop" (pause QEMU), "report" (report the error to the guest),
               "enospc" (pause QEMU only if the host disk is full; report the error to the guest otherwise).  The default setting is werror=enospc and rerror=report.

           readonly
               Open drive file as read-only. Guest write attempts will fail.

           copy-on-read=copy-on-read
               copy-on-read is "on" or "off" and enables whether to copy read backing file sectors into the image file.

           detect-zeroes=detect-zeroes
               detect-zeroes is "off", "on" or "unmap" and enables the automatic conversion of plain zero writes by the OS to driver specific optimized zero write commands. You may even choose "unmap"
               if discard is set to "unmap" to allow a zero write to be converted to an UNMAP operation.

           By default, the cache=writeback mode is used. It will report data writes as completed as soon as the data is present in the host page cache.  This is safe as long as your guest OS makes sure
           to correctly flush disk caches where needed. If your guest OS does not handle volatile disk write caches correctly and your host crashes or loses power, then the guest may experience data
           corruption.

           For such guests, you should consider using cache=writethrough. This means that the host page cache will be used to read and write data, but write notification will be sent to the guest only
           after QEMU has made sure to flush each write to the disk. Be aware that this has a major impact on performance.

           The host page cache can be avoided entirely with cache=none.  This will attempt to do disk IO directly to the guest's memory.  QEMU may still perform an internal copy of the data. Note that
           this is considered a writeback mode and the guest OS must handle the disk write cache correctly in order to avoid data corruption on host crashes.

           The host page cache can be avoided while only sending write notifications to the guest when the data has been flushed to the disk using cache=directsync.

           In case you don't care about data integrity over host failures, use cache=unsafe. This option tells QEMU that it never needs to write any data to the disk but can instead keep things in
           cache. If anything goes wrong, like your host losing power, the disk storage getting disconnected accidentally, etc. your image will most probably be rendered unusable.   When using the
           -snapshot option, unsafe caching is always used.

           Copy-on-read avoids accessing the same backing file sectors repeatedly and is useful when the backing file is over a slow network.  By default copy-on-read is off.

           Instead of -cdrom you can use:

                   qemu-system-i386 -drive file=file,index=2,media=cdrom

           Instead of -hda, -hdb, -hdc, -hdd, you can use:

                   qemu-system-i386 -drive file=file,index=0,media=disk
                   qemu-system-i386 -drive file=file,index=1,media=disk
                   qemu-system-i386 -drive file=file,index=2,media=disk
                   qemu-system-i386 -drive file=file,index=3,media=disk

           You can open an image using pre-opened file descriptors from an fd set:

                   qemu-system-i386
                   -add-fd fd=3,set=2,opaque="rdwr:/path/to/file"
                   -add-fd fd=4,set=2,opaque="rdonly:/path/to/file"
                   -drive file=/dev/fdset/2,index=0,media=disk

           You can connect a CDROM to the slave of ide0:

                   qemu-system-i386 -drive file=file,if=ide,index=1,media=cdrom

           If you don't specify the "file=" argument, you define an empty drive:

                   qemu-system-i386 -drive if=ide,index=1,media=cdrom

           You can connect a SCSI disk with unit ID 6 on the bus #0:

                   qemu-system-i386 -drive file=file,if=scsi,bus=0,unit=6

           Instead of -fda, -fdb, you can use:

                   qemu-system-i386 -drive file=file,index=0,if=floppy
                   qemu-system-i386 -drive file=file,index=1,if=floppy

           By default, interface is "ide" and index is automatically incremented:

                   qemu-system-i386 -drive file=a -drive file=b"

           is interpreted like:

                   qemu-system-i386 -hda a -hdb b

       -mtdblock file
           Use file as on-board Flash memory image.

       -sd file
           Use file as SecureDigital card image.

       -pflash file
           Use file as a parallel flash image.

       -snapshot
           Write to temporary files instead of disk image files. In this case, the raw disk image you use is not written back. You can however force the write back by pressing C-a s.

       -hdachs c,h,s,[,t]
           Force hard disk 0 physical geometry (1 <= c <= 16383, 1 <= h <= 16, 1 <= s <= 63) and optionally force the BIOS translation mode (t=none, lba or auto). Usually QEMU can guess all those
           parameters. This option is useful for old MS-DOS disk images.

       -fsdev fsdriver,id=id,path=path,[security_model=security_model][,writeout=writeout][,readonly][,socket=socket|sock_fd=sock_fd]
           Define a new file system device. Valid options are:

           fsdriver
               This option specifies the fs driver backend to use.  Currently "local", "handle" and "proxy" file system drivers are supported.

           id=id
               Specifies identifier for this device

           path=path
               Specifies the export path for the file system device. Files under this path will be available to the 9p client on the guest.

           security_model=security_model
               Specifies the security model to be used for this export path.  Supported security models are "passthrough", "mapped-xattr", "mapped-file" and "none".  In "passthrough" security model,
               files are stored using the same credentials as they are created on the guest. This requires QEMU to run as root. In "mapped-xattr" security model, some of the file attributes like uid,
               gid, mode bits and link target are stored as file attributes. For "mapped-file" these attributes are stored in the hidden .virtfs_metadata directory. Directories exported by this
               security model cannot interact with other unix tools. "none" security model is same as passthrough except the sever won't report failures if it fails to set file attributes like
               ownership. Security model is mandatory only for local fsdriver. Other fsdrivers (like handle, proxy) don't take security model as a parameter.

           writeout=writeout
               This is an optional argument. The only supported value is "immediate".  This means that host page cache will be used to read and write data but write notification will be sent to the
               guest only when the data has been reported as written by the storage subsystem.

           readonly
               Enables exporting 9p share as a readonly mount for guests. By default read-write access is given.

           socket=socket
               Enables proxy filesystem driver to use passed socket file for communicating with virtfs-proxy-helper

           sock_fd=sock_fd
               Enables proxy filesystem driver to use passed socket descriptor for communicating with virtfs-proxy-helper. Usually a helper like libvirt will create socketpair and pass one of the fds
               as sock_fd

           -fsdev option is used along with -device driver "virtio-9p-pci".

       -device virtio-9p-pci,fsdev=id,mount_tag=mount_tag
           Options for virtio-9p-pci driver are:

           fsdev=id
               Specifies the id value specified along with -fsdev option

           mount_tag=mount_tag
               Specifies the tag name to be used by the guest to mount this export point

       -virtfs fsdriver[,path=path],mount_tag=mount_tag[,security_model=security_model][,writeout=writeout][,readonly][,socket=socket|sock_fd=sock_fd]
           The general form of a Virtual File system pass-through options are:

           fsdriver
               This option specifies the fs driver backend to use.  Currently "local", "handle" and "proxy" file system drivers are supported.

           id=id
               Specifies identifier for this device

           path=path
               Specifies the export path for the file system device. Files under this path will be available to the 9p client on the guest.

           security_model=security_model
               Specifies the security model to be used for this export path.  Supported security models are "passthrough", "mapped-xattr", "mapped-file" and "none".  In "passthrough" security model,
               files are stored using the same credentials as they are created on the guest. This requires QEMU to run as root. In "mapped-xattr" security model, some of the file attributes like uid,
               gid, mode bits and link target are stored as file attributes. For "mapped-file" these attributes are stored in the hidden .virtfs_metadata directory. Directories exported by this
               security model cannot interact with other unix tools. "none" security model is same as passthrough except the sever won't report failures if it fails to set file attributes like
               ownership. Security model is mandatory only for local fsdriver. Other fsdrivers (like handle, proxy) don't take security model as a parameter.

           writeout=writeout
               This is an optional argument. The only supported value is "immediate".  This means that host page cache will be used to read and write data but write notification will be sent to the
               guest only when the data has been reported as written by the storage subsystem.

           readonly
               Enables exporting 9p share as a readonly mount for guests. By default read-write access is given.

           socket=socket
               Enables proxy filesystem driver to use passed socket file for communicating with virtfs-proxy-helper. Usually a helper like libvirt will create socketpair and pass one of the fds as
               sock_fd

           sock_fd
               Enables proxy filesystem driver to use passed 'sock_fd' as the socket descriptor for interfacing with virtfs-proxy-helper

       -virtfs_synth
           Create synthetic file system image

       USB options:

       -usb
           Enable the USB driver (will be the default soon)

       -usbdevice devname
           Add the USB device devname.

           mouse
               Virtual Mouse. This will override the PS/2 mouse emulation when activated.

           tablet
               Pointer device that uses absolute coordinates (like a touchscreen). This means QEMU is able to report the mouse position without having to grab the mouse. Also overrides the PS/2 mouse
               emulation when activated.

           disk:[format=format]:file
               Mass storage device based on file. The optional format argument will be used rather than detecting the format. Can be used to specifiy "format=raw" to avoid interpreting an untrusted
               format header.

           host:bus.addr
               Pass through the host device identified by bus.addr (Linux only).

           host:vendor_id:product_id
               Pass through the host device identified by vendor_id:product_id (Linux only).

           serial:[vendorid=vendor_id][,productid=product_id]:dev
               Serial converter to host character device dev, see "-serial" for the available devices.

           braille
               Braille device.  This will use BrlAPI to display the braille output on a real or fake device.

           net:options
               Network adapter that supports CDC ethernet and RNDIS protocols.

       Display options:

       -display type
           Select type of display to use. This option is a replacement for the old style -sdl/-curses/... options. Valid values for type are

           sdl Display video output via SDL (usually in a separate graphics window; see the SDL documentation for other possibilities).

           curses
               Display video output via curses. For graphics device models which support a text mode, QEMU can display this output using a curses/ncurses interface. Nothing is displayed when the
               graphics device is in graphical mode or if the graphics device does not support a text mode. Generally only the VGA device models support text mode.

           none
               Do not display video output. The guest will still see an emulated graphics card, but its output will not be displayed to the QEMU user. This option differs from the -nographic option in
               that it only affects what is done with video output; -nographic also changes the destination of the serial and parallel port data.

           gtk Display video output in a GTK window. This interface provides drop-down menus and other UI elements to configure and control the VM during runtime.

           vnc Start a VNC server on display <arg>

       -nographic
           Normally, QEMU uses SDL to display the VGA output. With this option, you can totally disable graphical output so that QEMU is a simple command line application. The emulated serial port is
           redirected on the console and muxed with the monitor (unless redirected elsewhere explicitly). Therefore, you can still use QEMU to debug a Linux kernel with a serial console.  Use C-a h for
           help on switching between the console and monitor.

       -curses
           Normally, QEMU uses SDL to display the VGA output.  With this option, QEMU can display the VGA output when in text mode using a curses/ncurses interface.  Nothing is displayed in graphical
           mode.

       -no-frame
           Do not use decorations for SDL windows and start them using the whole available screen space. This makes the using QEMU in a dedicated desktop workspace more convenient.

       -alt-grab
           Use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt). Note that this also affects the special keys (for fullscreen, monitor-mode switching, etc).

       -ctrl-grab
           Use Right-Ctrl to grab mouse (instead of Ctrl-Alt). Note that this also affects the special keys (for fullscreen, monitor-mode switching, etc).

       -no-quit
           Disable SDL window close capability.

       -sdl
           Enable SDL.

       -spice option[,option[,...]]
           Enable the spice remote desktop protocol. Valid options are

           port=<nr>
               Set the TCP port spice is listening on for plaintext channels.

           addr=<addr>
               Set the IP address spice is listening on.  Default is any address.

           ipv4
           ipv6
           unix
               Force using the specified IP version.

           password=<secret>
               Set the password you need to authenticate.

           sasl
               Require that the client use SASL to authenticate with the spice.  The exact choice of authentication method used is controlled from the system / user's SASL configuration file for the
               'qemu' service. This is typically found in /etc/sasl2/qemu.conf. If running QEMU as an unprivileged user, an environment variable SASL_CONF_PATH can be used to make it search alternate
               locations for the service config.  While some SASL auth methods can also provide data encryption (eg GSSAPI), it is recommended that SASL always be combined with the 'tls' and 'x509'
               settings to enable use of SSL and server certificates. This ensures a data encryption preventing compromise of authentication credentials.

           disable-ticketing
               Allow client connects without authentication.

           disable-copy-paste
               Disable copy paste between the client and the guest.

           disable-agent-file-xfer
               Disable spice-vdagent based file-xfer between the client and the guest.

           tls-port=<nr>
               Set the TCP port spice is listening on for encrypted channels.

           x509-dir=<dir>
               Set the x509 file directory. Expects same filenames as -vnc $display,x509=$dir

           x509-key-file=<file>
           x509-key-password=<file>
           x509-cert-file=<file>
           x509-cacert-file=<file>
           x509-dh-key-file=<file>
               The x509 file names can also be configured individually.

           tls-ciphers=<list>
               Specify which ciphers to use.

           tls-channel=[main|display|cursor|inputs|record|playback]
           plaintext-channel=[main|display|cursor|inputs|record|playback]
               Force specific channel to be used with or without TLS encryption.  The options can be specified multiple times to configure multiple channels.  The special name "default" can be used to
               set the default mode.  For channels which are not explicitly forced into one mode the spice client is allowed to pick tls/plaintext as he pleases.

           image-compression=[auto_glz|auto_lz|quic|glz|lz|off]
               Configure image compression (lossless).  Default is auto_glz.

           jpeg-wan-compression=[auto|never|always]
           zlib-glz-wan-compression=[auto|never|always]
               Configure wan image compression (lossy for slow links).  Default is auto.

           streaming-video=[off|all|filter]
               Configure video stream detection.  Default is filter.

           agent-mouse=[on|off]
               Enable/disable passing mouse events via vdagent.  Default is on.

           playback-compression=[on|off]
               Enable/disable audio stream compression (using celt 0.5.1).  Default is on.

           seamless-migration=[on|off]
               Enable/disable spice seamless migration. Default is off.

       -portrait
           Rotate graphical output 90 deg left (only PXA LCD).

       -rotate deg
           Rotate graphical output some deg left (only PXA LCD).

       -vga type
           Select type of VGA card to emulate. Valid values for type are

           cirrus
               Cirrus Logic GD5446 Video card. All Windows versions starting from Windows 95 should recognize and use this graphic card. For optimal performances, use 16 bit color depth in the guest
               and the host OS.  (This one is the default)

           std Standard VGA card with Bochs VBE extensions.  If your guest OS supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want to use high resolution modes (>= 1280x1024x16) then
               you should use this option.

           vmware
               VMWare SVGA-II compatible adapter. Use it if you have sufficiently recent XFree86/XOrg server or Windows guest with a driver for this card.

           qxl QXL paravirtual graphic card.  It is VGA compatible (including VESA 2.0 VBE support).  Works best with qxl guest drivers installed though.  Recommended choice when using the spice
               protocol.

           tcx (sun4m only) Sun TCX framebuffer. This is the default framebuffer for sun4m machines and offers both 8-bit and 24-bit colour depths at a fixed resolution of 1024x768.

           cg3 (sun4m only) Sun cgthree framebuffer. This is a simple 8-bit framebuffer for sun4m machines available in both 1024x768 (OpenBIOS) and 1152x900 (OBP) resolutions aimed at people wishing
               to run older Solaris versions.

           virtio
               Virtio VGA card.

           none
               Disable VGA card.

       -full-screen
           Start in full screen.

       -g widthxheight[xdepth]
           Set the initial graphical resolution and depth (PPC, SPARC only).

       -vnc display[,option[,option[,...]]]
           Normally, QEMU uses SDL to display the VGA output.  With this option, you can have QEMU listen on VNC display display and redirect the VGA display over the VNC session.  It is very useful to
           enable the usb tablet device when using this option (option -usbdevice tablet). When using the VNC display, you must use the -k parameter to set the keyboard layout if you are not using en-
           us. Valid syntax for the display is

           host:d
               TCP connections will only be allowed from host on display d.  By convention the TCP port is 5900+d. Optionally, host can be omitted in which case the server will accept connections from
               any host.

           unix:path
               Connections will be allowed over UNIX domain sockets where path is the location of a unix socket to listen for connections on.

           none
               VNC is initialized but not started. The monitor "change" command can be used to later start the VNC server.

           Following the display value there may be one or more option flags separated by commas. Valid options are

           reverse
               Connect to a listening VNC client via a "reverse" connection. The client is specified by the display. For reverse network connections (host:d,"reverse"), the d argument is a TCP port
               number, not a display number.

           websocket
               Opens an additional TCP listening port dedicated to VNC Websocket connections.  By definition the Websocket port is 5700+display. If host is specified connections will only be allowed
               from this host.  As an alternative the Websocket port could be specified by using "websocket"=port.  If no TLS credentials are provided, the websocket connection runs in unencrypted
               mode. If TLS credentials are provided, the websocket connection requires encrypted client connections.

           password
               Require that password based authentication is used for client connections.

               The password must be set separately using the "set_password" command in the pcsys_monitor. The syntax to change your password is: "set_password <protocol> <password>" where <protocol>
               could be either "vnc" or "spice".

               If you would like to change <protocol> password expiration, you should use "expire_password <protocol> <expiration-time>" where expiration time could be one of the following options:
               now, never, +seconds or UNIX time of expiration, e.g. +60 to make password expire in 60 seconds, or 1335196800 to make password expire on "Mon Apr 23 12:00:00 EDT 2012" (UNIX time for
               this date and time).

               You can also use keywords "now" or "never" for the expiration time to allow <protocol> password to expire immediately or never expire.

           tls-creds=ID
               Provides the ID of a set of TLS credentials to use to secure the VNC server. They will apply to both the normal VNC server socket and the websocket socket (if enabled). Setting TLS
               credentials will cause the VNC server socket to enable the VeNCrypt auth mechanism.  The credentials should have been previously created using the -object tls-creds argument.

               The tls-creds parameter obsoletes the tls, x509, and x509verify options, and as such it is not permitted to set both new and old type options at the same time.

           tls Require that client use TLS when communicating with the VNC server. This uses anonymous TLS credentials so is susceptible to a man-in-the-middle attack. It is recommended that this
               option be combined with either the x509 or x509verify options.

               This option is now deprecated in favor of using the tls-creds argument.

           x509=/path/to/certificate/dir
               Valid if tls is specified. Require that x509 credentials are used for negotiating the TLS session. The server will send its x509 certificate to the client. It is recommended that a
               password be set on the VNC server to provide authentication of the client when this is used. The path following this option specifies where the x509 certificates are to be loaded from.
               See the vnc_security section for details on generating certificates.

               This option is now deprecated in favour of using the tls-creds argument.

           x509verify=/path/to/certificate/dir
               Valid if tls is specified. Require that x509 credentials are used for negotiating the TLS session. The server will send its x509 certificate to the client, and request that the client
               send its own x509 certificate.  The server will validate the client's certificate against the CA certificate, and reject clients when validation fails. If the certificate authority is
               trusted, this is a sufficient authentication mechanism. You may still wish to set a password on the VNC server as a second authentication layer. The path following this option specifies
               where the x509 certificates are to be loaded from. See the vnc_security section for details on generating certificates.

               This option is now deprecated in favour of using the tls-creds argument.

           sasl
               Require that the client use SASL to authenticate with the VNC server.  The exact choice of authentication method used is controlled from the system / user's SASL configuration file for
               the 'qemu' service. This is typically found in /etc/sasl2/qemu.conf. If running QEMU as an unprivileged user, an environment variable SASL_CONF_PATH can be used to make it search
               alternate locations for the service config.  While some SASL auth methods can also provide data encryption (eg GSSAPI), it is recommended that SASL always be combined with the 'tls' and
               'x509' settings to enable use of SSL and server certificates. This ensures a data encryption preventing compromise of authentication credentials. See the vnc_security section for details
               on using SASL authentication.

           acl Turn on access control lists for checking of the x509 client certificate and SASL party. For x509 certs, the ACL check is made against the certificate's distinguished name. This is
               something that looks like "C=GB,O=ACME,L=Boston,CN=bob". For SASL party, the ACL check is made against the username, which depending on the SASL plugin, may include a realm component, eg
               "bob" or "bob@EXAMPLE.COM".  When the acl flag is set, the initial access list will be empty, with a "deny" policy. Thus no one will be allowed to use the VNC server until the ACLs have
               been loaded. This can be achieved using the "acl" monitor command.

           lossy
               Enable lossy compression methods (gradient, JPEG, ...). If this option is set, VNC client may receive lossy framebuffer updates depending on its encoding settings. Enabling this option
               can save a lot of bandwidth at the expense of quality.

           non-adaptive
               Disable adaptive encodings. Adaptive encodings are enabled by default.  An adaptive encoding will try to detect frequently updated screen regions, and send updates in these regions using
               a lossy encoding (like JPEG).  This can be really helpful to save bandwidth when playing videos. Disabling adaptive encodings restores the original static behavior of encodings like
               Tight.

           share=[allow-exclusive|force-shared|ignore]
               Set display sharing policy.  'allow-exclusive' allows clients to ask for exclusive access.  As suggested by the rfb spec this is implemented by dropping other connections.  Connecting
               multiple clients in parallel requires all clients asking for a shared session (vncviewer: -shared switch).  This is the default.  'force-shared' disables exclusive client access.  Useful
               for shared desktop sessions, where you don't want someone forgetting specify -shared disconnect everybody else.  'ignore' completely ignores the shared flag and allows everybody connect
               unconditionally.  Doesn't conform to the rfb spec but is traditional QEMU behavior.

       i386 target only:

       -win2k-hack
           Use it when installing Windows 2000 to avoid a disk full bug. After Windows 2000 is installed, you no longer need this option (this option slows down the IDE transfers).

       -no-fd-bootchk
           Disable boot signature checking for floppy disks in BIOS. May be needed to boot from old floppy disks.

       -no-acpi
           Disable ACPI (Advanced Configuration and Power Interface) support. Use it if your guest OS complains about ACPI problems (PC target machine only).

       -no-hpet
           Disable HPET support.

       -acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n] [,asl_compiler_id=str][,asl_compiler_rev=n][,data=file1[:file2]...]
           Add ACPI table with specified header fields and context from specified files.  For file=, take whole ACPI table from the specified files, including all ACPI headers (possible overridden by
           other options).  For data=, only data portion of the table is used, all header information is specified in the command line.

       -smbios file=binary
           Load SMBIOS entry from binary file.

       -smbios type=0[,vendor=str][,version=str][,date=str][,release=%d.%d][,uefi=on|off]
           Specify SMBIOS type 0 fields

       -smbios type=1[,manufacturer=str][,product=str][,version=str][,serial=str][,uuid=uuid][,sku=str][,family=str]
           Specify SMBIOS type 1 fields

       -smbios type=2[,manufacturer=str][,product=str][,version=str][,serial=str][,asset=str][,location=str][,family=str]
           Specify SMBIOS type 2 fields

       -smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]
           Specify SMBIOS type 3 fields

       -smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]
           Specify SMBIOS type 4 fields

       -smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]
           Specify SMBIOS type 17 fields

       Network options:

       -net nic[,vlan=n][,macaddr=mac][,model=type] [,name=name][,addr=addr][,vectors=v]
           Create a new Network Interface Card and connect it to VLAN n (n = 0 is the default). The NIC is an e1000 by default on the PC target. Optionally, the MAC address can be changed to mac, the
           device address set to addr (PCI cards only), and a name can be assigned for use in monitor commands.  Optionally, for PCI cards, you can specify the number v of MSI-X vectors that the card
           should have; this option currently only affects virtio cards; set v = 0 to disable MSI-X. If no -net option is specified, a single NIC is created.  QEMU can emulate several different models
           of network card.  Valid values for type are "virtio", "i82551", "i82557b", "i82559er", "ne2k_pci", "ne2k_isa", "pcnet", "rtl8139", "e1000", "smc91c111", "lance" and "mcf_fec".  Not all
           devices are supported on all targets.  Use "-net nic,model=help" for a list of available devices for your target.

       -netdev user,id=id[,option][,option][,...]
       -net user[,option][,option][,...]
           Use the user mode network stack which requires no administrator privilege to run. Valid options are:

           vlan=n
               Connect user mode stack to VLAN n (n = 0 is the default).

           id=id
           name=name
               Assign symbolic name for use in monitor commands.

           net=addr[/mask]
               Set IP network address the guest will see. Optionally specify the netmask, either in the form a.b.c.d or as number of valid top-most bits. Default is 10.0.2.0/24.

           host=addr
               Specify the guest-visible address of the host. Default is the 2nd IP in the guest network, i.e. x.x.x.2.

           restrict=on|off
               If this option is enabled, the guest will be isolated, i.e. it will not be able to contact the host and no guest IP packets will be routed over the host to the outside. This option does
               not affect any explicitly set forwarding rules.

           hostname=name
               Specifies the client hostname reported by the built-in DHCP server.

           dhcpstart=addr
               Specify the first of the 16 IPs the built-in DHCP server can assign. Default is the 15th to 31st IP in the guest network, i.e. x.x.x.15 to x.x.x.31.

           dns=addr
               Specify the guest-visible address of the virtual nameserver. The address must be different from the host address. Default is the 3rd IP in the guest network, i.e. x.x.x.3.

           dnssearch=domain
               Provides an entry for the domain-search list sent by the built-in DHCP server. More than one domain suffix can be transmitted by specifying this option multiple times. If supported, this
               will cause the guest to automatically try to append the given domain suffix(es) in case a domain name can not be resolved.

               Example:

                       qemu -net user,dnssearch=mgmt.example.org,dnssearch=example.org [...]

           tftp=dir
               When using the user mode network stack, activate a built-in TFTP server. The files in dir will be exposed as the root of a TFTP server.  The TFTP client on the guest must be configured
               in binary mode (use the command "bin" of the Unix TFTP client).

           bootfile=file
               When using the user mode network stack, broadcast file as the BOOTP filename. In conjunction with tftp, this can be used to network boot a guest from a local directory.

               Example (using pxelinux):

                       qemu-system-i386 -hda linux.img -boot n -net user,tftp=/path/to/tftp/files,bootfile=/pxelinux.0

           smb=dir[,smbserver=addr]
               When using the user mode network stack, activate a built-in SMB server so that Windows OSes can access to the host files in dir transparently. The IP address of the SMB server can be set
               to addr. By default the 4th IP in the guest network is used, i.e. x.x.x.4.

               In the guest Windows OS, the line:

                       10.0.2.4 smbserver

               must be added in the file C:\WINDOWS\LMHOSTS (for windows 9x/Me) or C:\WINNT\SYSTEM32\DRIVERS\ETC\LMHOSTS (Windows NT/2000).

               Then dir can be accessed in \smbserver\qemu.

               Note that a SAMBA server must be installed on the host OS.  QEMU was tested successfully with smbd versions from Red Hat 9, Fedora Core 3 and OpenSUSE 11.x.

           hostfwd=[tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport
               Redirect incoming TCP or UDP connections to the host port hostport to the guest IP address guestaddr on guest port guestport. If guestaddr is not specified, its value is x.x.x.15
               (default first address given by the built-in DHCP server). By specifying hostaddr, the rule can be bound to a specific host interface. If no connection type is set, TCP is used. This
               option can be given multiple times.

               For example, to redirect host X11 connection from screen 1 to guest screen 0, use the following:

                       # on the host
                       qemu-system-i386 -net user,hostfwd=tcp:127.0.0.1:6001-:6000 [...]
                       # this host xterm should open in the guest X11 server
                       xterm -display :1

               To redirect telnet connections from host port 5555 to telnet port on the guest, use the following:

                       # on the host
                       qemu-system-i386 -net user,hostfwd=tcp::5555-:23 [...]
                       telnet localhost 5555

               Then when you use on the host "telnet localhost 5555", you connect to the guest telnet server.

           guestfwd=[tcp]:server:port-dev
           guestfwd=[tcp]:server:port-cmd:command
               Forward guest TCP connections to the IP address server on port port to the character device dev or to a program executed by cmd:command which gets spawned for each connection. This
               option can be given multiple times.

               You can either use a chardev directly and have that one used throughout QEMU's lifetime, like in the following example:

                       # open 10.10.1.1:4321 on bootup, connect 10.0.2.100:1234 to it whenever
                       # the guest accesses it
                       qemu -net user,guestfwd=tcp:10.0.2.100:1234-tcp:10.10.1.1:4321 [...]

               Or you can execute a command on every TCP connection established by the guest, so that QEMU behaves similar to an inetd process for that virtual server:

                       # call "netcat 10.10.1.1 4321" on every TCP connection to 10.0.2.100:1234
                       # and connect the TCP stream to its stdin/stdout
                       qemu -net 'user,guestfwd=tcp:10.0.2.100:1234-cmd:netcat 10.10.1.1 4321'

           Note: Legacy stand-alone options -tftp, -bootp, -smb and -redir are still processed and applied to -net user. Mixing them with the new configuration syntax gives undefined results. Their use
           for new applications is discouraged as they will be removed from future versions.

       -netdev tap,id=id[,fd=h][,ifname=name][,script=file][,downscript=dfile][,helper=helper]
       -net tap[,vlan=n][,name=name][,fd=h][,ifname=name][,script=file][,downscript=dfile][,helper=helper]
           Connect the host TAP network interface name to VLAN n.

           Use the network script file to configure it and the network script dfile to deconfigure it. If name is not provided, the OS automatically provides one. The default network configure script
           is /etc/qemu-ifup and the default network deconfigure script is /etc/qemu-ifdown. Use script=no or downscript=no to disable script execution.

           If running QEMU as an unprivileged user, use the network helper helper to configure the TAP interface. The default network helper executable is /path/to/qemu-bridge-helper.

           fd=h can be used to specify the handle of an already opened host TAP interface.

           Examples:

                   #launch a QEMU instance with the default network script
                   qemu-system-i386 linux.img -net nic -net tap

                   #launch a QEMU instance with two NICs, each one connected
                   #to a TAP device
                   qemu-system-i386 linux.img \
                   -net nic,vlan=0 -net tap,vlan=0,ifname=tap0 \
                   -net nic,vlan=1 -net tap,vlan=1,ifname=tap1

                   #launch a QEMU instance with the default network helper to
                   #connect a TAP device to bridge br0
                   qemu-system-i386 linux.img \
                   -net nic -net tap,"helper=/path/to/qemu-bridge-helper"

       -netdev bridge,id=id[,br=bridge][,helper=helper]
       -net bridge[,vlan=n][,name=name][,br=bridge][,helper=helper]
           Connect a host TAP network interface to a host bridge device.

           Use the network helper helper to configure the TAP interface and attach it to the bridge. The default network helper executable is /path/to/qemu-bridge-helper and the default bridge device
           is br0.

           Examples:

                   #launch a QEMU instance with the default network helper to
                   #connect a TAP device to bridge br0
                   qemu-system-i386 linux.img -net bridge -net nic,model=virtio

                   #launch a QEMU instance with the default network helper to
                   #connect a TAP device to bridge qemubr0
                   qemu-system-i386 linux.img -net bridge,br=qemubr0 -net nic,model=virtio

       -netdev socket,id=id[,fd=h][,listen=[host]:port][,connect=host:port]
       -net socket[,vlan=n][,name=name][,fd=h] [,listen=[host]:port][,connect=host:port]
           Connect the VLAN n to a remote VLAN in another QEMU virtual machine using a TCP socket connection. If listen is specified, QEMU waits for incoming connections on port (host is optional).
           connect is used to connect to another QEMU instance using the listen option. fd=h specifies an already opened TCP socket.

           Example:

                   # launch a first QEMU instance
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:56 \
                   -net socket,listen=:1234
                   # connect the VLAN 0 of this instance to the VLAN 0
                   # of the first instance
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:57 \
                   -net socket,connect=127.0.0.1:1234

       -netdev socket,id=id[,fd=h][,mcast=maddr:port[,localaddr=addr]]
       -net socket[,vlan=n][,name=name][,fd=h][,mcast=maddr:port[,localaddr=addr]]
           Create a VLAN n shared with another QEMU virtual machines using a UDP multicast socket, effectively making a bus for every QEMU with same multicast address maddr and port.  NOTES:

           1.  Several QEMU can be running on different hosts and share same bus (assuming correct multicast setup for these hosts).

           2.  mcast support is compatible with User Mode Linux (argument ethN=mcast), see <http://user-mode-linux.sf.net>.

           3.  Use fd=h to specify an already opened UDP multicast socket.

           Example:

                   # launch one QEMU instance
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:56 \
                   -net socket,mcast=230.0.0.1:1234
                   # launch another QEMU instance on same "bus"
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:57 \
                   -net socket,mcast=230.0.0.1:1234
                   # launch yet another QEMU instance on same "bus"
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:58 \
                   -net socket,mcast=230.0.0.1:1234

           Example (User Mode Linux compat.):

                   # launch QEMU instance (note mcast address selected
                   # is UML's default)
                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:56 \
                   -net socket,mcast=239.192.168.1:1102
                   # launch UML
                   /path/to/linux ubd0=/path/to/root_fs eth0=mcast

           Example (send packets from host's 1.2.3.4):

                   qemu-system-i386 linux.img \
                   -net nic,macaddr=52:54:00:12:34:56 \
                   -net socket,mcast=239.192.168.1:1102,localaddr=1.2.3.4

       -netdev
       l2tpv3,id=id,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]
       -net
       l2tpv3[,vlan=n][,name=name],src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]
           Connect VLAN n to L2TPv3 pseudowire. L2TPv3 (RFC3391) is a popular protocol to transport Ethernet (and other Layer 2) data frames between two systems. It is present in routers, firewalls and
           the Linux kernel (from version 3.3 onwards).

           This transport allows a VM to communicate to another VM, router or firewall directly.

       src=srcaddr
           source address (mandatory)

       dst=dstaddr
           destination address (mandatory)

       udp select udp encapsulation (default is ip).

       srcport=srcport
           source udp port.

       dstport=dstport
           destination udp port.

       ipv6
           force v6, otherwise defaults to v4.

       rxcookie=rxcookie
       txcookie=txcookie
           Cookies are a weak form of security in the l2tpv3 specification.  Their function is mostly to prevent misconfiguration. By default they are 32 bit.

       cookie64
           Set cookie size to 64 bit instead of the default 32

       counter=off
           Force a 'cut-down' L2TPv3 with no counter as in draft-mkonstan-l2tpext-keyed-ipv6-tunnel-00

       pincounter=on
           Work around broken counter handling in peer. This may also help on networks which have packet reorder.

       offset=offset
           Add an extra offset between header and data

           For example, to attach a VM running on host 4.3.2.1 via L2TPv3 to the bridge br-lan on the remote Linux host 1.2.3.4:

                   # Setup tunnel on linux host using raw ip as encapsulation
                   # on 1.2.3.4
                   ip l2tp add tunnel remote 4.3.2.1 local 1.2.3.4 tunnel_id 1 peer_tunnel_id 1 \
                   encap udp udp_sport 16384 udp_dport 16384
                   ip l2tp add session tunnel_id 1 name vmtunnel0 session_id \
                   0xFFFFFFFF peer_session_id 0xFFFFFFFF
                   ifconfig vmtunnel0 mtu 1500
                   ifconfig vmtunnel0 up
                   brctl addif br-lan vmtunnel0

                   # on 4.3.2.1
                   # launch QEMU instance - if your network has reorder or is very lossy add ,pincounter

                   qemu-system-i386 linux.img -net nic -net l2tpv3,src=4.2.3.1,dst=1.2.3.4,udp,srcport=16384,dstport=16384,rxsession=0xffffffff,txsession=0xffffffff,counter

       -netdev vde,id=id[,sock=socketpath][,port=n][,group=groupname][,mode=octalmode]
       -net vde[,vlan=n][,name=name][,sock=socketpath] [,port=n][,group=groupname][,mode=octalmode]
           Connect VLAN n to PORT n of a vde switch running on host and listening for incoming connections on socketpath. Use GROUP groupname and MODE octalmode to change default ownership and
           permissions for communication port. This option is only available if QEMU has been compiled with vde support enabled.

           Example:

                   # launch vde switch
                   vde_switch -F -sock /tmp/myswitch
                   # launch QEMU instance
                   qemu-system-i386 linux.img -net nic -net vde,sock=/tmp/myswitch

       -netdev hubport,id=id,hubid=hubid
           Create a hub port on QEMU "vlan" hubid.

           The hubport netdev lets you connect a NIC to a QEMU "vlan" instead of a single netdev.  "-net" and "-device" with parameter vlan create the required hub automatically.

       -netdev vhost-user,chardev=id[,vhostforce=on|off][,queues=n]
           Establish a vhost-user netdev, backed by a chardev id. The chardev should be a unix domain socket backed one. The vhost-user uses a specifically defined protocol to pass vhost ioctl
           replacement messages to an application on the other end of the socket. On non-MSIX guests, the feature can be forced with vhostforce. Use 'queues=n' to specify the number of queues to be
           created for multiqueue vhost-user.

           Example:

                   qemu -m 512 -object memory-backend-file,id=mem,size=512M,mem-path=/hugetlbfs,share=on \
                   -numa node,memdev=mem \
                   -chardev socket,path=/path/to/socket \
                   -netdev type=vhost-user,id=net0,chardev=chr0 \
                   -device virtio-net-pci,netdev=net0

       -net dump[,vlan=n][,file=file][,len=len]
           Dump network traffic on VLAN n to file file (qemu-vlan0.pcap by default).  At most len bytes (64k by default) per packet are stored. The file format is libpcap, so it can be analyzed with
           tools such as tcpdump or Wireshark.  Note: For devices created with '-netdev', use '-object filter-dump,...' instead.

       -net none
           Indicate that no network devices should be configured. It is used to override the default configuration (-net nic -net user) which is activated if no -net options are provided.

       Character device options:

       The general form of a character device option is:

       -chardev backend ,id=id [,mux=on|off] [,options]
           Backend is one of: null, socket, udp, msmouse, vc, ringbuf, file, pipe, console, serial, pty, stdio, braille, tty, parallel, parport, spicevmc.  spiceport.  The specific backend will
           determine the applicable options.

           All devices must have an id, which can be any string up to 127 characters long.  It is used to uniquely identify this device in other command line directives.

           A character device may be used in multiplexing mode by multiple front-ends.  The key sequence of Control-a and c will rotate the input focus between attached front-ends. Specify mux=on to
           enable this mode.

           Options to each backend are described below.

       -chardev null ,id=id
           A void device. This device will not emit any data, and will drop any data it receives. The null backend does not take any options.

       -chardev socket ,id=id [TCP options or unix options] [,server] [,nowait] [,telnet] [,reconnect=seconds]
           Create a two-way stream socket, which can be either a TCP or a unix socket. A unix socket will be created if path is specified. Behaviour is undefined if TCP options are specified for a unix
           socket.

           server specifies that the socket shall be a listening socket.

           nowait specifies that QEMU should not block waiting for a client to connect to a listening socket.

           telnet specifies that traffic on the socket should interpret telnet escape sequences.

           reconnect sets the timeout for reconnecting on non-server sockets when the remote end goes away.  qemu will delay this many seconds and then attempt to reconnect.  Zero disables
           reconnecting, and is the default.

           TCP and unix socket options are given below:

           TCP options: port=port [,host=host] [,to=to] [,ipv4] [,ipv6] [,nodelay]
               host for a listening socket specifies the local address to be bound.  For a connecting socket species the remote host to connect to. host is optional for listening sockets. If not
               specified it defaults to 0.0.0.0.

               port for a listening socket specifies the local port to be bound. For a connecting socket specifies the port on the remote host to connect to.  port can be given as either a port number
               or a service name.  port is required.

               to is only relevant to listening sockets. If it is specified, and port cannot be bound, QEMU will attempt to bind to subsequent ports up to and including to until it succeeds. to must be
               specified as a port number.

               ipv4 and ipv6 specify that either IPv4 or IPv6 must be used.  If neither is specified the socket may use either protocol.

               nodelay disables the Nagle algorithm.

           unix options: path=path
               path specifies the local path of the unix socket. path is required.

       -chardev udp ,id=id [,host=host] ,port=port [,localaddr=localaddr] [,localport=localport] [,ipv4] [,ipv6]
           Sends all traffic from the guest to a remote host over UDP.

           host specifies the remote host to connect to. If not specified it defaults to "localhost".

           port specifies the port on the remote host to connect to. port is required.

           localaddr specifies the local address to bind to. If not specified it defaults to 0.0.0.0.

           localport specifies the local port to bind to. If not specified any available local port will be used.

           ipv4 and ipv6 specify that either IPv4 or IPv6 must be used.  If neither is specified the device may use either protocol.

       -chardev msmouse ,id=id
           Forward QEMU's emulated msmouse events to the guest. msmouse does not take any options.

       -chardev vc ,id=id [[,width=width] [,height=height]] [[,cols=cols] [,rows=rows]]
           Connect to a QEMU text console. vc may optionally be given a specific size.

           width and height specify the width and height respectively of the console, in pixels.

           cols and rows specify that the console be sized to fit a text console with the given dimensions.

       -chardev ringbuf ,id=id [,size=size]
           Create a ring buffer with fixed size size.  size must be a power of two, and defaults to "64K").

       -chardev file ,id=id ,path=path
           Log all traffic received from the guest to a file.

           path specifies the path of the file to be opened. This file will be created if it does not already exist, and overwritten if it does. path is required.

       -chardev pipe ,id=id ,path=path
           Create a two-way connection to the guest. The behaviour differs slightly between Windows hosts and other hosts:

           On Windows, a single duplex pipe will be created at \.pipe\path.

           On other hosts, 2 pipes will be created called path.in and path.out. Data written to path.in will be received by the guest. Data written by the guest can be read from path.out. QEMU will not
           create these fifos, and requires them to be present.

           path forms part of the pipe path as described above. path is required.

       -chardev console ,id=id
           Send traffic from the guest to QEMU's standard output. console does not take any options.

           console is only available on Windows hosts.

       -chardev serial ,id=id ,path=path
           Send traffic from the guest to a serial device on the host.

           On Unix hosts serial will actually accept any tty device, not only serial lines.

           path specifies the name of the serial device to open.

       -chardev pty ,id=id
           Create a new pseudo-terminal on the host and connect to it. pty does not take any options.

           pty is not available on Windows hosts.

       -chardev stdio ,id=id [,signal=on|off]
           Connect to standard input and standard output of the QEMU process.

           signal controls if signals are enabled on the terminal, that includes exiting QEMU with the key sequence Control-c. This option is enabled by default, use signal=off to disable it.

           stdio is not available on Windows hosts.

       -chardev braille ,id=id
           Connect to a local BrlAPI server. braille does not take any options.

       -chardev tty ,id=id ,path=path
           tty is only available on Linux, Sun, FreeBSD, NetBSD, OpenBSD and DragonFlyBSD hosts.  It is an alias for serial.

           path specifies the path to the tty. path is required.

       -chardev parallel ,id=id ,path=path
       -chardev parport ,id=id ,path=path
           parallel is only available on Linux, FreeBSD and DragonFlyBSD hosts.

           Connect to a local parallel port.

           path specifies the path to the parallel port device. path is required.

       -chardev spicevmc ,id=id ,debug=debug, name=name
           spicevmc is only available when spice support is built in.

           debug debug level for spicevmc

           name name of spice channel to connect to

           Connect to a spice virtual machine channel, such as vdiport.

       -chardev spiceport ,id=id ,debug=debug, name=name
           spiceport is only available when spice support is built in.

           debug debug level for spicevmc

           name name of spice port to connect to

           Connect to a spice port, allowing a Spice client to handle the traffic identified by a name (preferably a fqdn).

       Device URL Syntax:

       In addition to using normal file images for the emulated storage devices, QEMU can also use networked resources such as iSCSI devices. These are specified using a special URL syntax.

       iSCSI
           iSCSI support allows QEMU to access iSCSI resources directly and use as images for the guest storage. Both disk and cdrom images are supported.

           Syntax for specifying iSCSI LUNs is "iscsi://<target-ip>[:<port>]/<target-iqn>/<lun>"

           By default qemu will use the iSCSI initiator-name 'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from the command line or a configuration file.

           Since version Qemu 2.4 it is possible to specify a iSCSI request timeout to detect stalled requests and force a reestablishment of the session. The timeout is specified in seconds. The
           default is 0 which means no timeout. Libiscsi 1.15.0 or greater is required for this feature.

           Example (without authentication):

                   qemu-system-i386 -iscsi initiator-name=iqn.2001-04.com.example:my-initiator \
                   -cdrom iscsi://192.0.2.1/iqn.2001-04.com.example/2 \
                   -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1

           Example (CHAP username/password via URL):

                   qemu-system-i386 -drive file=iscsi://user%password@192.0.2.1/iqn.2001-04.com.example/1

           Example (CHAP username/password via environment variables):

                   LIBISCSI_CHAP_USERNAME="user" \
                   LIBISCSI_CHAP_PASSWORD="password" \
                   qemu-system-i386 -drive file=iscsi://192.0.2.1/iqn.2001-04.com.example/1

           iSCSI support is an optional feature of QEMU and only available when compiled and linked against libiscsi.

           iSCSI parameters such as username and password can also be specified via a configuration file. See qemu-doc for more information and examples.

       NBD QEMU supports NBD (Network Block Devices) both using TCP protocol as well as Unix Domain Sockets.

           Syntax for specifying a NBD device using TCP "nbd:<server-ip>:<port>[:exportname=<export>]"

           Syntax for specifying a NBD device using Unix Domain Sockets "nbd:unix:<domain-socket>[:exportname=<export>]"

           Example for TCP

                   qemu-system-i386 --drive file=nbd:192.0.2.1:30000

           Example for Unix Domain Sockets

                   qemu-system-i386 --drive file=nbd:unix:/tmp/nbd-socket

       SSH QEMU supports SSH (Secure Shell) access to remote disks.

           Examples:

                   qemu-system-i386 -drive file=ssh://user@host/path/to/disk.img
                   qemu-system-i386 -drive file.driver=ssh,file.user=user,file.host=host,file.port=22,file.path=/path/to/disk.img

           Currently authentication must be done using ssh-agent.  Other authentication methods may be supported in future.

       Sheepdog
           Sheepdog is a distributed storage system for QEMU.  QEMU supports using either local sheepdog devices or remote networked devices.

           Syntax for specifying a sheepdog device

                   sheepdog[+tcp|+unix]://[host:port]/vdiname[?socket=path][#snapid|#tag]

           Example

                   qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine

           See also <http://http://www.osrg.net/sheepdog/>.

       GlusterFS
           GlusterFS is an user space distributed file system.  QEMU supports the use of GlusterFS volumes for hosting VM disk images using TCP, Unix Domain Sockets and RDMA transport protocols.

           Syntax for specifying a VM disk image on GlusterFS volume is

                   gluster[+transport]://[server[:port]]/volname/image[?socket=...]

           Example

                   qemu-system-x86_64 --drive file=gluster://192.0.2.1/testvol/a.img

           See also <http://www.gluster.org>.

       HTTP/HTTPS/FTP/FTPS/TFTP
           QEMU supports read-only access to files accessed over http(s), ftp(s) and tftp.

           Syntax using a single filename:

                   <protocol>://[<username>[:<password>]@]<host>/<path>

           where:

           protocol
               'http', 'https', 'ftp', 'ftps', or 'tftp'.

           username
               Optional username for authentication to the remote server.

           password
               Optional password for authentication to the remote server.

           host
               Address of the remote server.

           path
               Path on the remote server, including any query string.

           The following options are also supported:

           url The full URL when passing options to the driver explicitly.

           readahead
               The amount of data to read ahead with each range request to the remote server.  This value may optionally have the suffix 'T', 'G', 'M', 'K', 'k' or 'b'. If it does not have a suffix, it
               will be assumed to be in bytes. The value must be a multiple of 512 bytes. It defaults to 256k.

           sslverify
               Whether to verify the remote server's certificate when connecting over SSL. It can have the value 'on' or 'off'. It defaults to 'on'.

           cookie
               Send this cookie (it can also be a list of cookies separated by ';') with each outgoing request.  Only supported when using protocols such as HTTP which support cookies, otherwise
               ignored.

           timeout
               Set the timeout in seconds of the CURL connection. This timeout is the time that CURL waits for a response from the remote server to get the size of the image to be downloaded. If not
               set, the default timeout of 5 seconds is used.

           Note that when passing options to qemu explicitly, driver is the value of <protocol>.

           Example: boot from a remote Fedora 20 live ISO image

                   qemu-system-x86_64 --drive media=cdrom,file=http://dl.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly

                   qemu-system-x86_64 --drive media=cdrom,file.driver=http,file.url=http://dl.fedoraproject.org/pub/fedora/linux/releases/20/Live/x86_64/Fedora-Live-Desktop-x86_64-20-1.iso,readonly

           Example: boot from a remote Fedora 20 cloud image using a local overlay for writes, copy-on-read, and a readahead of 64k

                   qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"http",, "file.url":"https://dl.fedoraproject.org/pub/fedora/linux/releases/20/Images/x86_64/Fedora-x86_64-20-20131211.1-sda.qcow2",, "file.readahead":"64k"}' /tmp/Fedora-x86_64-20-20131211.1-sda.qcow2

                   qemu-system-x86_64 -drive file=/tmp/Fedora-x86_64-20-20131211.1-sda.qcow2,copy-on-read=on

           Example: boot from an image stored on a VMware vSphere server with a self-signed certificate using a local overlay for writes, a readahead of 64k and a timeout of 10 seconds.

                   qemu-img create -f qcow2 -o backing_file='json:{"file.driver":"https",, "file.url":"https://user:password@vsphere.example.com/folder/test/test-flat.vmdk?dcPath=Datacenter&dsName=datastore1",, "file.sslverify":"off",, "file.readahead":"64k",, "file.timeout":10}' /tmp/test.qcow2

                   qemu-system-x86_64 -drive file=/tmp/test.qcow2

       Bluetooth(R) options:

       -bt hci[...]
           Defines the function of the corresponding Bluetooth HCI.  -bt options are matched with the HCIs present in the chosen machine type.  For example when emulating a machine with only one HCI
           built into it, only the first "-bt hci[...]" option is valid and defines the HCI's logic.  The Transport Layer is decided by the machine type.  Currently the machines "n800" and "n810" have
           one HCI and all other machines have none.

           The following three types are recognized:

           -bt hci,null
               (default) The corresponding Bluetooth HCI assumes no internal logic and will not respond to any HCI commands or emit events.

           -bt hci,host[:id]
               ("bluez" only) The corresponding HCI passes commands / events to / from the physical HCI identified by the name id (default: "hci0") on the computer running QEMU.  Only available on
               "bluez" capable systems like Linux.

           -bt hci[,vlan=n]
               Add a virtual, standard HCI that will participate in the Bluetooth scatternet n (default 0).  Similarly to -net VLANs, devices inside a bluetooth network n can only communicate with
               other devices in the same network (scatternet).

       -bt vhci[,vlan=n]
           (Linux-host only) Create a HCI in scatternet n (default 0) attached to the host bluetooth stack instead of to the emulated target.  This allows the host and target machines to participate in
           a common scatternet and communicate.  Requires the Linux "vhci" driver installed.  Can be used as following:

                   qemu-system-i386 [...OPTIONS...] -bt hci,vlan=5 -bt vhci,vlan=5

       -bt device:dev[,vlan=n]
           Emulate a bluetooth device dev and place it in network n (default 0).  QEMU can only emulate one type of bluetooth devices currently:

           keyboard
               Virtual wireless keyboard implementing the HIDP bluetooth profile.

       TPM device options:

       The general form of a TPM device option is:

       -tpmdev backend ,id=id [,options]
           Backend type must be: passthrough.

           The specific backend type will determine the applicable options.  The "-tpmdev" option creates the TPM backend and requires a "-device" option that specifies the TPM frontend interface
           model.

           Options to each backend are described below.

           Use 'help' to print all available TPM backend types.

                   qemu -tpmdev help

       -tpmdev passthrough, id=id, path=path, cancel-path=cancel-path
           (Linux-host only) Enable access to the host's TPM using the passthrough driver.

           path specifies the path to the host's TPM device, i.e., on a Linux host this would be "/dev/tpm0".  path is optional and by default "/dev/tpm0" is used.

           cancel-path specifies the path to the host TPM device's sysfs entry allowing for cancellation of an ongoing TPM command.  cancel-path is optional and by default QEMU will search for the
           sysfs entry to use.

           Some notes about using the host's TPM with the passthrough driver:

           The TPM device accessed by the passthrough driver must not be used by any other application on the host.

           Since the host's firmware (BIOS/UEFI) has already initialized the TPM, the VM's firmware (BIOS/UEFI) will not be able to initialize the TPM again and may therefore not show a TPM-specific
           menu that would otherwise allow the user to configure the TPM, e.g., allow the user to enable/disable or activate/deactivate the TPM.  Further, if TPM ownership is released from within a VM
           then the host's TPM will get disabled and deactivated. To enable and activate the TPM again afterwards, the host has to be rebooted and the user is required to enter the firmware's menu to
           enable and activate the TPM.  If the TPM is left disabled and/or deactivated most TPM commands will fail.

           To create a passthrough TPM use the following two options:

                   -tpmdev passthrough,id=tpm0 -device tpm-tis,tpmdev=tpm0

           Note that the "-tpmdev" id is "tpm0" and is referenced by "tpmdev=tpm0" in the device option.

       Linux/Multiboot boot specific:

       When using these options, you can use a given Linux or Multiboot kernel without installing it in the disk image. It can be useful for easier testing of various kernels.

       -kernel bzImage
           Use bzImage as kernel image. The kernel can be either a Linux kernel or in multiboot format.

       -append cmdline
           Use cmdline as kernel command line

       -initrd file
           Use file as initial ram disk.

       -initrd "file1 arg=foo,file2"
           This syntax is only available with multiboot.

           Use file1 and file2 as modules and pass arg=foo as parameter to the first module.

       -dtb file
           Use file as a device tree binary (dtb) image and pass it to the kernel on boot.

       Debug/Expert options:

       -fw_cfg [name=]name,file=file
           Add named fw_cfg entry from file. name determines the name of the entry in the fw_cfg file directory exposed to the guest.

       -fw_cfg [name=]name,string=str
           Add named fw_cfg entry from string.

       -serial dev
           Redirect the virtual serial port to host character device dev. The default device is "vc" in graphical mode and "stdio" in non graphical mode.

           This option can be used several times to simulate up to 4 serial ports.

           Use "-serial none" to disable all serial ports.

           Available character devices are:

           vc[:WxH]
               Virtual console. Optionally, a width and height can be given in pixel with

                       vc:800x600

               It is also possible to specify width or height in characters:

                       vc:80Cx24C

           pty [Linux only] Pseudo TTY (a new PTY is automatically allocated)

           none
               No device is allocated.

           null
               void device

           chardev:id
               Use a named character device defined with the "-chardev" option.

           /dev/XXX
               [Linux only] Use host tty, e.g. /dev/ttyS0. The host serial port parameters are set according to the emulated ones.

           /dev/parportN
               [Linux only, parallel port only] Use host parallel port N. Currently SPP and EPP parallel port features can be used.

           file:filename
               Write output to filename. No character can be read.

           stdio
               [Unix only] standard input/output

           pipe:filename
               name pipe filename

           COMn
               [Windows only] Use host serial port n

           udp:[remote_host]:remote_port[@[src_ip]:src_port]
               This implements UDP Net Console.  When remote_host or src_ip are not specified they default to 0.0.0.0.  When not using a specified src_port a random port is automatically chosen.

               If you just want a simple readonly console you can use "netcat" or "nc", by starting QEMU with: "-serial udp::4555" and nc as: "nc -u -l -p 4555". Any time QEMU writes something to that
               port it will appear in the netconsole session.

               If you plan to send characters back via netconsole or you want to stop and start QEMU a lot of times, you should have QEMU use the same source port each time by using something like
               "-serial udp::4555@4556" to QEMU. Another approach is to use a patched version of netcat which can listen to a TCP port and send and receive characters via udp.  If you have a patched
               version of netcat which activates telnet remote echo and single char transfer, then you can use the following options to step up a netcat redirector to allow telnet on port 5555 to
               access the QEMU port.

               "QEMU Options:"
                   -serial udp::4555@4556

               "netcat options:"
                   -u -P 4555 -L 0.0.0.0:4556 -t -p 5555 -I -T

               "telnet options:"
                   localhost 5555

           tcp:[host]:port[,server][,nowait][,nodelay][,reconnect=seconds]
               The TCP Net Console has two modes of operation.  It can send the serial I/O to a location or wait for a connection from a location.  By default the TCP Net Console is sent to host at the
               port.  If you use the server option QEMU will wait for a client socket application to connect to the port before continuing, unless the "nowait" option was specified.  The "nodelay"
               option disables the Nagle buffering algorithm.  The "reconnect" option only applies if noserver is set, if the connection goes down it will attempt to reconnect at the given interval.
               If host is omitted, 0.0.0.0 is assumed. Only one TCP connection at a time is accepted. You can use "telnet" to connect to the corresponding character device.

               "Example to send tcp console to 192.168.0.2 port 4444"
                   -serial tcp:192.168.0.2:4444

               "Example to listen and wait on port 4444 for connection"
                   -serial tcp::4444,server

               "Example to not wait and listen on ip 192.168.0.100 port 4444"
                   -serial tcp:192.168.0.100:4444,server,nowait

           telnet:host:port[,server][,nowait][,nodelay]
               The telnet protocol is used instead of raw tcp sockets.  The options work the same as if you had specified "-serial tcp".  The difference is that the port acts like a telnet server or
               client using telnet option negotiation.  This will also allow you to send the MAGIC_SYSRQ sequence if you use a telnet that supports sending the break sequence.  Typically in unix telnet
               you do it with Control-] and then type "send break" followed by pressing the enter key.

           unix:path[,server][,nowait][,reconnect=seconds]
               A unix domain socket is used instead of a tcp socket.  The option works the same as if you had specified "-serial tcp" except the unix domain socket path is used for connections.

           mon:dev_string
               This is a special option to allow the monitor to be multiplexed onto another serial port.  The monitor is accessed with key sequence of Control-a and then pressing c.  dev_string should
               be any one of the serial devices specified above.  An example to multiplex the monitor onto a telnet server listening on port 4444 would be:

               "-serial mon:telnet::4444,server,nowait"

               When the monitor is multiplexed to stdio in this way, Ctrl+C will not terminate QEMU any more but will be passed to the guest instead.

           braille
               Braille device.  This will use BrlAPI to display the braille output on a real or fake device.

           msmouse
               Three button serial mouse. Configure the guest to use Microsoft protocol.

       -parallel dev
           Redirect the virtual parallel port to host device dev (same devices as the serial port). On Linux hosts, /dev/parportN can be used to use hardware devices connected on the corresponding host
           parallel port.

           This option can be used several times to simulate up to 3 parallel ports.

           Use "-parallel none" to disable all parallel ports.

       -monitor dev
           Redirect the monitor to host device dev (same devices as the serial port).  The default device is "vc" in graphical mode and "stdio" in non graphical mode.  Use "-monitor none" to disable
           the default monitor.

       -qmp dev
           Like -monitor but opens in 'control' mode.

       -qmp-pretty dev
           Like -qmp but uses pretty JSON formatting.

       -mon [chardev=]name[,mode=readline|control][,default]
           Setup monitor on chardev name.

       -debugcon dev
           Redirect the debug console to host device dev (same devices as the serial port).  The debug console is an I/O port which is typically port 0xe9; writing to that I/O port sends output to this
           device.  The default device is "vc" in graphical mode and "stdio" in non graphical mode.

       -pidfile file
           Store the QEMU process PID in file. It is useful if you launch QEMU from a script.

       -singlestep
           Run the emulation in single step mode.

       -S  Do not start CPU at startup (you must type 'c' in the monitor).

       -realtime mlock=on|off
           Run qemu with realtime features.  mlocking qemu and guest memory can be enabled via mlock=on (enabled by default).

       -gdb dev
           Wait for gdb connection on device dev. Typical connections will likely be TCP-based, but also UDP, pseudo TTY, or even stdio are reasonable use case. The latter is allowing to start QEMU
           from within gdb and establish the connection via a pipe:

                   (gdb) target remote | exec qemu-system-i386 -gdb stdio ...

       -s  Shorthand for -gdb tcp::1234, i.e. open a gdbserver on TCP port 1234.

       -d item1[,...]
           Enable logging of specified items. Use '-d help' for a list of log items.

       -D logfile
           Output log in logfile instead of to stderr

       -L  path
           Set the directory for the BIOS, VGA BIOS and keymaps.

       -bios file
           Set the filename for the BIOS.

       -enable-kvm
           Enable KVM full virtualization support. This option is only available if KVM support is enabled when compiling.

       -xen-domid id
           Specify xen guest domain id (XEN only).

       -xen-create
           Create domain using xen hypercalls, bypassing xend.  Warning: should not be used when xend is in use (XEN only).

       -xen-attach
           Attach to existing xen domain.  xend will use this when starting QEMU (XEN only).

       -no-reboot
           Exit instead of rebooting.

       -no-shutdown
           Don't exit QEMU on guest shutdown, but instead only stop the emulation.  This allows for instance switching to monitor to commit changes to the disk image.

       -loadvm file
           Start right away with a saved state ("loadvm" in monitor)

       -daemonize
           Daemonize the QEMU process after initialization.  QEMU will not detach from standard IO until it is ready to receive connections on any of its devices.  This option is a useful way for
           external programs to launch QEMU without having to cope with initialization race conditions.

       -option-rom file
           Load the contents of file as an option ROM.  This option is useful to load things like EtherBoot.

       -rtc [base=utc|localtime|date][,clock=host|vm][,driftfix=none|slew]
           Specify base as "utc" or "localtime" to let the RTC start at the current UTC or local time, respectively. "localtime" is required for correct date in MS-DOS or Windows. To start at a
           specific point in time, provide date in the format "2006-06-17T16:01:21" or "2006-06-17". The default base is UTC.

           By default the RTC is driven by the host system time. This allows using of the RTC as accurate reference clock inside the guest, specifically if the host time is smoothly following an
           accurate external reference clock, e.g. via NTP.  If you want to isolate the guest time from the host, you can set clock to "rt" instead.  To even prevent it from progressing during
           suspension, you can set it to "vm".

           Enable driftfix (i386 targets only) if you experience time drift problems, specifically with Windows' ACPI HAL. This option will try to figure out how many timer interrupts were not
           processed by the Windows guest and will re-inject them.

       -icount [shift=N|auto][,rr=record|replay,rrfile=filename]
           Enable virtual instruction counter.  The virtual cpu will execute one instruction every 2^N ns of virtual time.  If "auto" is specified then the virtual cpu speed will be automatically
           adjusted to keep virtual time within a few seconds of real time.

           When the virtual cpu is sleeping, the virtual time will advance at default speed unless sleep=no is specified.  With sleep=no, the virtual time will jump to the next timer deadline instantly
           whenever the virtual cpu goes to sleep mode and will not advance if no timer is enabled. This behavior give deterministic execution times from the guest point of view.

           Note that while this option can give deterministic behavior, it does not provide cycle accurate emulation.  Modern CPUs contain superscalar out of order cores with complex cache hierarchies.
           The number of instructions executed often has little or no correlation with actual performance.

           align=on will activate the delay algorithm which will try to synchronise the host clock and the virtual clock. The goal is to have a guest running at the real frequency imposed by the shift
           option.  Whenever the guest clock is behind the host clock and if align=on is specified then we print a message to the user to inform about the delay.  Currently this option does not work
           when shift is "auto".  Note: The sync algorithm will work for those shift values for which the guest clock runs ahead of the host clock. Typically this happens when the shift value is high
           (how high depends on the host machine).

           When rr option is specified deterministic record/replay is enabled.  Replay log is written into filename file in record mode and read from this file in replay mode.

       -watchdog model
           Create a virtual hardware watchdog device.  Once enabled (by a guest action), the watchdog must be periodically polled by an agent inside the guest or else the guest will be restarted.
           Choose a model for which your guest has drivers.

           The model is the model of hardware watchdog to emulate. Use "-watchdog help" to list available hardware models. Only one watchdog can be enabled for a guest.

           The following models may be available:

           ib700
               iBASE 700 is a very simple ISA watchdog with a single timer.

           i6300esb
               Intel 6300ESB I/O controller hub is a much more featureful PCI-based dual-timer watchdog.

           diag288
               A virtual watchdog for s390x backed by the diagnose 288 hypercall (currently KVM only).

       -watchdog-action action
           The action controls what QEMU will do when the watchdog timer expires.  The default is "reset" (forcefully reset the guest).  Other possible actions are: "shutdown" (attempt to gracefully
           shutdown the guest), "poweroff" (forcefully poweroff the guest), "pause" (pause the guest), "debug" (print a debug message and continue), or "none" (do nothing).

           Note that the "shutdown" action requires that the guest responds to ACPI signals, which it may not be able to do in the sort of situations where the watchdog would have expired, and thus
           "-watchdog-action shutdown" is not recommended for production use.

           Examples:

           "-watchdog i6300esb -watchdog-action pause"
           "-watchdog ib700"
       -echr numeric_ascii_value
           Change the escape character used for switching to the monitor when using monitor and serial sharing.  The default is 0x01 when using the "-nographic" option.  0x01 is equal to pressing
           "Control-a".  You can select a different character from the ascii control keys where 1 through 26 map to Control-a through Control-z.  For instance you could use the either of the following
           to change the escape character to Control-t.

           "-echr 0x14"
           "-echr 20"
       -virtioconsole c
           Set virtio console.

           This option is maintained for backward compatibility.

           Please use "-device virtconsole" for the new way of invocation.

       -show-cursor
           Show cursor.

       -tb-size n
           Set TB size.

       -incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]
       -incoming rdma:host:port[,ipv4][,ipv6]
           Prepare for incoming migration, listen on a given tcp port.

       -incoming unix:socketpath
           Prepare for incoming migration, listen on a given unix socket.

       -incoming fd:fd
           Accept incoming migration from a given filedescriptor.

       -incoming exec:cmdline
           Accept incoming migration as an output from specified external command.

       -incoming defer
           Wait for the URI to be specified via migrate_incoming.  The monitor can be used to change settings (such as migration parameters) prior to issuing the migrate_incoming to allow the migration
           to begin.

       -nodefaults
           Don't create default devices. Normally, QEMU sets the default devices like serial port, parallel port, virtual console, monitor device, VGA adapter, floppy and CD-ROM drive and others. The
           "-nodefaults" option will disable all those default devices.

       -chroot dir
           Immediately before starting guest execution, chroot to the specified directory.  Especially useful in combination with -runas.

       -runas user
           Immediately before starting guest execution, drop root privileges, switching to the specified user.

       -prom-env variable=value
           Set OpenBIOS nvram variable to given value (PPC, SPARC only).

       -semihosting
           Enable semihosting mode (ARM, M68K, Xtensa, MIPS only).

       -semihosting-config [enable=on|off][,target=native|gdb|auto][,arg=str[,...]]
           Enable and configure semihosting (ARM, M68K, Xtensa, MIPS only).

           target="native|gdb|auto"
               Defines where the semihosting calls will be addressed, to QEMU ("native") or to GDB ("gdb"). The default is "auto", which means "gdb" during debug sessions and "native" otherwise.

           arg=str1,arg=str2,...
               Allows the user to pass input arguments, and can be used multiple times to build up a list. The old-style "-kernel"/"-append" method of passing a command line is still supported for
               backward compatibility. If both the "--semihosting-config arg" and the "-kernel"/"-append" are specified, the former is passed to semihosting as it always takes precedence.

       -old-param
           Old param mode (ARM only).

       -sandbox arg
           Enable Seccomp mode 2 system call filter. 'on' will enable syscall filtering and 'off' will disable it.  The default is 'off'.

       -readconfig file
           Read device configuration from file. This approach is useful when you want to spawn QEMU process with many command line options but you don't want to exceed the command line character limit.

       -writeconfig file
           Write device configuration to file. The file can be either filename to save command line and device configuration into file or dash "-") character to print the output to stdout. This can be
           later used as input file for "-readconfig" option.

       -nodefconfig
           Normally QEMU loads configuration files from sysconfdir and datadir at startup.  The "-nodefconfig" option will prevent QEMU from loading any of those config files.

       -no-user-config
           The "-no-user-config" option makes QEMU not load any of the user-provided config files on sysconfdir, but won't make it skip the QEMU-provided config files from datadir.

       -trace [events=file][,file=file]
           Specify tracing options.

           events=file
               Immediately enable events listed in file.  The file must contain one event name (as listed in the trace-events file) per line.  This option is only available if QEMU has been compiled
               with either simple or stderr tracing backend.

           file=file
               Log output traces to file.

               This option is only available if QEMU has been compiled with the simple tracing backend.

       -enable-fips
           Enable FIPS 140-2 compliance mode.

       -msg timestamp[=on|off]
           prepend a timestamp to each log message.(default:on)

       -dump-vmstate file
           Dump json-encoded vmstate information for current machine type to file in file Generic object creation

       -object typename[,prop1=value1,...]
           Create a new object of type typename setting properties in the order they are specified.  Note that the 'id' property must be set.  These objects are placed in the '/objects' path.

           -object memory-backend-file,id=id,size=size,mem-path=dir,share=on|off
               Creates a memory file backend object, which can be used to back the guest RAM with huge pages. The id parameter is a unique ID that will be used to reference this memory region when
               configuring the -numa argument. The size option provides the size of the memory region, and accepts common suffixes, eg 500M. The mem-path provides the path to either a shared memory or
               huge page filesystem mount.  The share boolean option determines whether the memory region is marked as private to QEMU, or shared. The latter allows a co-operating external process to
               access the QEMU memory region.

           -object rng-random,id=id,filename=/dev/random
               Creates a random number generator backend which obtains entropy from a device on the host. The id parameter is a unique ID that will be used to reference this entropy backend from the
               virtio-rng device. The filename parameter specifies which file to obtain entropy from and if omitted defaults to /dev/random.

           -object rng-egd,id=id,chardev=chardevid
               Creates a random number generator backend which obtains entropy from an external daemon running on the host. The id parameter is a unique ID that will be used to reference this entropy
               backend from the virtio-rng device. The chardev parameter is the unique ID of a character device backend that provides the connection to the RNG daemon.

           -object tls-creds-anon,id=id,endpoint=endpoint,dir=/path/to/cred/dir,verify-peer=on|off
               Creates a TLS anonymous credentials object, which can be used to provide TLS support on network backends. The id parameter is a unique ID which network backends will use to access the
               credentials. The endpoint is either server or client depending on whether the QEMU network backend that uses the credentials will be acting as a client or as a server. If verify-peer is
               enabled (the default) then once the handshake is completed, the peer credentials will be verified, though this is a no-op for anonymous credentials.

               The dir parameter tells QEMU where to find the credential files. For server endpoints, this directory may contain a file dh-params.pem providing diffie-hellman parameters to use for the
               TLS server. If the file is missing, QEMU will generate a set of DH parameters at startup. This is a computationally expensive operation that consumes random pool entropy, so it is
               recommended that a persistent set of parameters be generated upfront and saved.

           -object tls-creds-x509,id=id,endpoint=endpoint,dir=/path/to/cred/dir,verify-peer=on|off
               Creates a TLS anonymous credentials object, which can be used to provide TLS support on network backends. The id parameter is a unique ID which network backends will use to access the
               credentials. The endpoint is either server or client depending on whether the QEMU network backend that uses the credentials will be acting as a client or as a server. If verify-peer is
               enabled (the default) then once the handshake is completed, the peer credentials will be verified. With x509 certificates, this implies that the clients must be provided with valid
               client certificates too.

               The dir parameter tells QEMU where to find the credential files. For server endpoints, this directory may contain a file dh-params.pem providing diffie-hellman parameters to use for the
               TLS server. If the file is missing, QEMU will generate a set of DH parameters at startup. This is a computationally expensive operation that consumes random pool entropy, so it is
               recommended that a persistent set of parameters be generated upfront and saved.

               For x509 certificate credentials the directory will contain further files providing the x509 certificates. The certificates must be stored in PEM format, in filenames ca-cert.pem,
               ca-crl.pem (optional), server-cert.pem (only servers), server-key.pem (only servers), client-cert.pem (only clients), and client-key.pem (only clients).

           -object filter-buffer,id=id,netdev=netdevid,interval=t[,queue=all|rx|tx]
               Interval t can't be 0, this filter batches the packet delivery: all packets arriving in a given interval on netdev netdevid are delayed until the end of the interval. Interval is in
               microseconds.

               queue all|rx|tx is an option that can be applied to any netfilter.

               all: the filter is attached both to the receive and the transmit queue of the netdev (default).

               rx: the filter is attached to the receive queue of the netdev, where it will receive packets sent to the netdev.

               tx: the filter is attached to the transmit queue of the netdev, where it will receive packets sent by the netdev.

           -object filter-dump,id=id,netdev=dev,file=filename][,maxlen=len]
               Dump the network traffic on netdev dev to the file specified by filename. At most len bytes (64k by default) per packet are stored.  The file format is libpcap, so it can be analyzed
               with tools such as tcpdump or Wireshark.

       During the graphical emulation, you can use special key combinations to change modes. The default key mappings are shown below, but if you use "-alt-grab" then the modifier is Ctrl-Alt-Shift
       (instead of Ctrl-Alt) and if you use "-ctrl-grab" then the modifier is the right Ctrl key (instead of Ctrl-Alt):

       Ctrl-Alt-f
           Toggle full screen

       Ctrl-Alt-+
           Enlarge the screen

       Ctrl-Alt--
           Shrink the screen

       Ctrl-Alt-u
           Restore the screen's un-scaled dimensions

       Ctrl-Alt-n
           Switch to virtual console 'n'. Standard console mappings are:

           1   Target system display

           2   Monitor

           3   Serial port

       Ctrl-Alt
           Toggle mouse and keyboard grab.

       In the virtual consoles, you can use Ctrl-Up, Ctrl-Down, Ctrl-PageUp and Ctrl-PageDown to move in the back log.

       During emulation, if you are using the -nographic option, use Ctrl-a h to get terminal commands:

       Ctrl-a h
       Ctrl-a ?
           Print this help

       Ctrl-a x
           Exit emulator

       Ctrl-a s
           Save disk data back to file (if -snapshot)

       Ctrl-a t
           Toggle console timestamps

       Ctrl-a b
           Send break (magic sysrq in Linux)

       Ctrl-a c
           Switch between console and monitor

       Ctrl-a Ctrl-a
           Send Ctrl-a

       The following options are specific to the PowerPC emulation:

       -g WxH[xDEPTH]
           Set the initial VGA graphic mode. The default is 800x600x32.

       -prom-env string
           Set OpenBIOS variables in NVRAM, for example:

                   qemu-system-ppc -prom-env 'auto-boot?=false' \
                    -prom-env 'boot-device=hd:2,\yaboot' \
                    -prom-env 'boot-args=conf=hd:2,\yaboot.conf'

           These variables are not used by Open Hack'Ware.

       The following options are specific to the Sparc32 emulation:

       -g WxHx[xDEPTH]
           Set the initial graphics mode. For TCX, the default is 1024x768x8 with the option of 1024x768x24. For cgthree, the default is 1024x768x8 with the option of 1152x900x8 for people who wish to
           use OBP.

       -prom-env string
           Set OpenBIOS variables in NVRAM, for example:

                   qemu-system-sparc -prom-env 'auto-boot?=false' \
                    -prom-env 'boot-device=sd(0,2,0):d' -prom-env 'boot-args=linux single'

       -M [SS-4|SS-5|SS-10|SS-20|SS-600MP|LX|Voyager|SPARCClassic] [|SPARCbook]
           Set the emulated machine type. Default is SS-5.

       The following options are specific to the Sparc64 emulation:

       -prom-env string
           Set OpenBIOS variables in NVRAM, for example:

                   qemu-system-sparc64 -prom-env 'auto-boot?=false'

       -M [sun4u|sun4v|Niagara]
           Set the emulated machine type. The default is sun4u.

SEE ALSO
       The HTML documentation of QEMU for more precise information and Linux user mode emulator invocation.

AUTHOR
       Fabrice Bellard

                                                                                                2019-11-05                                                                                        QEMU(1)
