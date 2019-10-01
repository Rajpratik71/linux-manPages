BOOTCTL(1)                                                                                         bootctl                                                                                         BOOTCTL(1)



NAME
       bootctl - Control the firmware and boot manager settings

SYNOPSIS
       bootctl [OPTIONS...] {COMMAND}

DESCRIPTION
       bootctl may be used to query or (in the future) change the firmware and boot manager settings.

       Firmware information is available only on EFI systems.

       Currently, only the gummiboot(8) boot manager implements the required boot loader interface to provide complete boot manager information.

OPTIONS
       The following options are understood:

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       The following commands are understood:

       status
           Show firmware and boot manager information about the system, including secure boot mode status and selected firmware entry (where available).

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       Boot loader interface[1], Boot loader specification[2], gummiboot[3]

NOTES
        1. Boot loader interface
           http://www.freedesktop.org/wiki/Software/systemd/BootLoaderInterface

        2. Boot loader specification
           http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec

        3. gummiboot
           http://www.freedesktop.org/wiki/Software/gummiboot/



systemd 219                                                                                                                                                                                        BOOTCTL(1)
