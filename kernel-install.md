KERNEL-INSTALL(8)                                                                           kernel-install                                                                           KERNEL-INSTALL(8)

NAME
       kernel-install - Add and remove kernel and initramfs images to and from /boot

SYNOPSIS
       kernel-install COMMAND KERNEL-VERSION [KERNEL-IMAGE]

DESCRIPTION
       kernel-install is used to install and remove kernel and initramfs images to and from /boot.

       kernel-install will execute the files located in the directory /usr/lib/kernel/install.d/ and the local administration directory /etc/kernel/install.d/. All files are collectively sorted and
       executed in lexical order, regardless of the directory in which they live. However, files with identical filenames replace each other. Files in /etc/kernel/install.d/ take precedence over
       files with the same name in /usr/lib/kernel/install.d/. This can be used to override a system-supplied executables with a local file if needed; a symbolic link in /etc/kernel/install.d/ with
       the same name as an executable in /usr/lib/kernel/install.d/, pointing to /dev/null, disables the executable entirely. Executables must have the extension ".install"; other extensions are
       ignored.

       An executable should return 0 on success. It may also return 77 to cause the whole operation to terminate (executables later in lexical order will be skipped).

COMMANDS
       The following commands are understood:

       add KERNEL-VERSION KERNEL-IMAGE
           kernel-install creates the directory /boot/MACHINE-ID/KERNEL-VERSION/ and calls executables from /usr/lib/kernel/install.d/*.install and /etc/kernel/install.d/*.install with the arguments

               add KERNEL-VERSION \
                   /boot/MACHINE-ID/KERNEL-VERSION/ KERNEL-IMAGE

           The kernel-install plugin 50-depmod.install runs depmod for the KERNEL-VERSION.

           The kernel-install plugin 90-loaderentry.install copies KERNEL-IMAGE to /boot/MACHINE-ID/KERNEL-VERSION/linux. It also creates a boot loader entry according to the boot loader
           specification in /boot/loader/entries/MACHINE-ID-KERNEL-VERSION.conf. The title of the entry is the PRETTY_NAME parameter specified in /etc/os-release or /usr/lib/os-release (if the
           former is missing), or "Linux KERNEL-VERSION", if unset. If the file initrd is found next to the linux file, the initrd will be added to the configuration.

       remove KERNEL-VERSION
           Calls executables from /usr/lib/kernel/install.d/*.install and /etc/kernel/install.d/*.install with the arguments

               remove KERNEL-VERSION /boot/MACHINE-ID/KERNEL-VERSION/

           kernel-install removes the entire directory /boot/MACHINE-ID/KERNEL-VERSION/ afterwards.

           The kernel-install plugin 90-loaderentry.install removes the file /boot/loader/entries/MACHINE-ID-KERNEL-VERSION.conf.

EXIT STATUS
       If every executable returns 0 or 77, 0 is returned, and a non-zero failure code otherwise.

FILES
       /usr/lib/kernel/install.d/*.install /etc/kernel/install.d/*.install
           Drop-in files which are executed by kernel-install.

       /etc/kernel/cmdline /proc/cmdline
           The content of the file /etc/kernel/cmdline specifies the kernel command line to use. If that file does not exist, /proc/cmdline is used.

       /etc/machine-id
           The content of the file specifies the machine identification MACHINE-ID.

       /etc/os-release /usr/lib/os-release
           The content of the file specifies the operating system title PRETTY_NAME.

SEE ALSO
       machine-id(5), os-release(5), Boot loader specification[1]

NOTES
        1. Boot loader specification
           https://www.freedesktop.org/wiki/Specifications/BootLoaderSpec

systemd 237                                                                                                                                                                          KERNEL-INSTALL(8)
