BOOTCTL(1)                                                            bootctl                                                           BOOTCTL(1)

NAME
       bootctl - Control the firmware and boot manager settings

SYNOPSIS
       bootctl [OPTIONS...]status

       bootctl [OPTIONS...]update

       bootctl [OPTIONS...]install

       bootctl [OPTIONS...]remove

DESCRIPTION
       bootctl checks, updates, installs or removes the boot loader from the current system.

       bootctl status checks and prints the currently installed versions of the boot loader binaries and all current EFI boot variables.

       bootctl update updates all installed versions of systemd-boot, if the current version is newer than the version installed in the EFI system
       partition. This also includes the EFI default/fallback loader at /EFI/Boot/boot*.efi. A systemd-boot entry in the EFI boot variables is
       created if there is no current entry. The created entry will be added to the end of the boot order list.

       bootctl install installs systemd-boot into the EFI system partition. A copy of systemd-boot will be stored as the EFI default/fallback
       loader at /EFI/Boot/boot*.efi. A systemd-boot entry in the EFI boot variables is created and added to the top of the boot order list.

       bootctl remove removes all installed versions of systemd-boot from the EFI system partition, and removes systemd-boot from the EFI boot
       variables.

       If no command is passed, status is implied.

OPTIONS
       The following options are understood:

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --path
           Path to the EFI system partition. The default is /boot.

       --no-variables
           Do not touch the EFI boot variables.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       Boot loader specification[1] Systemd boot loader interface[2]

NOTES
        1. Boot loader specification
           http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec

        2. Systemd boot loader interface
           http://www.freedesktop.org/wiki/Software/systemd/BootLoaderInterface

systemd 229                                                                                                                             BOOTCTL(1)
