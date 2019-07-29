HALT(8)                                                                halt                                                                HALT(8)

NAME
       halt, poweroff, reboot - Halt, power-off or reboot the machine

SYNOPSIS
       halt [OPTIONS...]

       poweroff [OPTIONS...]

       reboot [OPTIONS...]

DESCRIPTION
       halt, poweroff, reboot may be used to halt, power-off or reboot the machine.

OPTIONS
       The following options are understood:

       --help
           Print a short help text and exit.

       --halt
           Halt the machine, regardless of which one of the three commands is invoked.

       -p, --poweroff
           Power-off the machine, regardless of which one of the three commands is invoked.

       --reboot
           Reboot the machine, regardless of which one of the three commands is invoked.

       -f, --force
           Force immediate halt, power-off, reboot. Do not contact the init system.

       -w, --wtmp-only
           Only write wtmp shutdown entry, do not actually halt, power-off, reboot.

       -d, --no-wtmp
           Do not write wtmp shutdown entry.

       -n, --no-sync
           Don't sync hard disks/storage media before halt, power-off, reboot.

       --no-wall
           Do not send wall message before halt, power-off, reboot.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

NOTES
       These are legacy commands available for compatibility only.

SEE ALSO
       systemd(1), systemctl(1), shutdown(8), wall(1)

systemd 233                                                                                                                                HALT(8)
