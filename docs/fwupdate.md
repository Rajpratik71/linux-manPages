FWUPDATE(1)                                                                                  User Commands                                                                                 FWUPDATE(1)

NAME
       fwupdate - update system firmware

SYNOPSIS
       fwupdate [OPTION...]

DESCRIPTION
       -a, --apply=<guid> <firmware.cap>
              Apply firmware updates. <guid> and <firmware.cap> have to be separates arguments; don't do --apply="<guid> <firmware.cap>" but --apply=<guid> <firmware.cap>

       -l, --list
              List supported firmware updates

       -s, --supported
              Query for firmware update support

       -i, --info
              Show the information of firmware update status

       -e, --enable
              Enable firmware update support on supported systems (will require a reboot)

       -q, --quiet
              Work quietly

       -q, --force
              Forces flash even if GUID isn't in ESRT (EFI System Resource Table)

       -p, --esp-path=<esp-path>
              Directory where the ESP (EFI System Partition) is currently mounted. By default the fwupdate assume the ESP is mounted in /boot/efi/.

       -F, --dont-use-existing-media-path
              By  default  when you apply a firmware update, fwupdate check the current EFI firmware <guid> and recorded file path (use --info to get those informations). If the current EFI firmware
              <guid> is the same as the update, fwupdate will try to use the same recorded file path. This can be a problem if, for exemple, you want to change the ESP subdirectory[1] used by  fwup‐
              date.

              This option make fwupdate behave as if there weren't any recorded file path.

       -v, --verbose
              Be more verbose on errors

   Help options:
       -?, --help
              Show this help message

       --usage
              Display brief usage message

NOTES
        1. ESP subdirectory
           http://www.uefi.org/registry

fwupdate                                                                                       May 2015                                                                                    FWUPDATE(1)
