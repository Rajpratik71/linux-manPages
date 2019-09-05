MKINITRD(8)                                                                                         dracut                                                                                        MKINITRD(8)



NAME
       mkinitrd-suse - is a compat wrapper, which calls dracut to generate an initramfs

SYNOPSIS
       mkinitrd [OPTION...]

DESCRIPTION
       mkinitrd creates an initramfs image <initrd-image> for the kernel with version <kernel-version> by calling dracut.

           Important
           This version of mkinitrd is provided for compability with older versions of mkinitrd. If a more fine grained control over the resulting image is needed, dracut should be called directly.

OPTIONS
       -R, --version
           print info about the version

       -k <kernel_list>
           List of kernel images for which initrd files are created (relative to boot_dir), Image name should begin with the following string, defaults to vmlinux on ppc/ppc64, image on s390/s390x and
           vmlinuz for everything else.

       -i <initrd_list>
           List of file names (relative to boot_dir) for the initrd; positions have to match the kernel_list. Defaults to initrd.

       -m <module_list>
           Modules to include in initrd, defaults to INITRD_MODULES variable in /etc/sysconfig/kernel.

       -f <feature_list>
           Features to be enabled for the initrd. In general mkinitrd configures the initrd for the root device it is started from. With this option additional feature can be enabled.

       -b <bootdir>
           Boot directory, defaults to /boot, where the initrd is created.

       -d <root_device>
           Root device, defaults to the device from which the root_dir is mounted; overwrites the rootdev enviroment variable if set

       -s <size>
           Add splash animation and bootscreen to initrd.

       -D _<interface>
           Run dhcp on the specified interface (for example "eth0").

       -I _<interface>
           Configure the specified interface statically.

       -a _<acpi_dsdt>
           Attach compiled ACPI DSDT (Differentiated System Description Table) to initrd. This replaces the DSDT of the BIOS. Defaults to the ACPI_DSDT variable in /etc/sysconfig/kernel.

       -M _<map>
           System.map file to use.

       -B
           Don’t run the update-bootloader(8) script after the initrd(s) have been created. This is useful if you call mkinitrd(8) for anything else than the running system.

       -A
           Create a so called "monster initrd" which includes all available features and modules. This calls dracut with --no-hostonly and --no-hostonly-cmdline parameters internally, instead of the
           default --hostonly and --hostonly-cmdline.

       -v, --verbose
           increase verbosity level

       -L
           Disable logging to /var/log/YaST2/mkinitrd.log. This is useful for testing if you don’t want to clutter the system log.

       --help
           print a help message and exit.

AVAILABILITY
       The mkinitrd command is part of the dracut package and is available from https://dracut.wiki.kernel.org

AUTHORS
       Harald Hoyer, Hannes Reinecke

SEE ALSO
       dracut(8) update-bootloader(8)



dracut                                                                                            06/30/2017                                                                                      MKINITRD(8)
