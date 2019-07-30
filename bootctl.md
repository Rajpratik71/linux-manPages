BOOTCTL(1)                                                                               bootctl                                                                               BOOTCTL(1)

NAME
       bootctl - Control the firmware and boot manager settings

SYNOPSIS
       bootctl [OPTIONS...] {COMMAND}

DESCRIPTION
       bootctl can check the EFI boot loader status, list available entries, and install, update, or remove the systemd-boot(7) boot loader on the current system.

OPTIONS
       The following options are understood:

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --path=
           Path to the EFI System Partition (ESP). If not specified, /efi, /boot, and /boot/efi are checked in turn. It is recommended to mount the ESP to /boot, if possible.

       -p, --print-path
           This option modifies the behaviour of status. Just print the path to the EFI System Partition (ESP) to standard output and exit.

       --no-variables
           Do not touch the EFI boot variables.

COMMANDS
       status
           Shows the currently installed versions of the boot loader binaries and all current EFI boot variables. If no command is specified, this is the implied default.

       list
           Shows all configured boot loader entries.

       update
           Updates all installed versions of systemd-boot(7), if the current version is newer than the version installed in the EFI system partition. This also includes the EFI
           default/fallback loader at ESP/EFI/BOOT/BOOT*.EFI. A systemd-boot entry in the EFI boot variables is created if there is no current entry. The created entry will be added to
           the end of the boot order list.

       install
           Installs systemd-boot into the EFI system partition. A copy of systemd-boot will be stored as the EFI default/fallback loader at ESP/EFI/BOOT/BOOT*.EFI. A systemd-boot entry
           in the EFI boot variables is created and added to the top of the boot order list.

       remove
           Removes all installed versions of systemd-boot from the EFI system partition, and removes systemd-boot from the EFI boot variables.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd-boot(7), Boot Loader Specification[1], Boot Loader Interface[2]

NOTES
        1. Boot Loader Specification
           https://github.com/systemd/systemd/blob/master/doc/BOOT_LOADER_SPECIFICATION.md

        2. Boot Loader Interface
           https://www.freedesktop.org/wiki/Software/systemd/BootLoaderInterface

systemd 239                                                                                                                                                                    BOOTCTL(1)
