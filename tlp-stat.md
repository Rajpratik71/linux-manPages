tlp-stat(8)                                Power Management                                tlp-stat(8)

NAME
       tlp-stat - show power saving settings

SYNOPSIS
       tlp-stat [options] [-- <config> ... ]

DESCRIPTION
       Show configuration, system information, active power saving settings and battery data.

OPTIONS
       -b, --battery
              Show battery data.

       -c, --config
              Show configuration.

       -d, --disk
              Show disk data.

       -e, --pcie
              Show PCI(e) device data.

       -g, --graphics
              Show graphics card data.

       -p, --processor
              Show processor data.

       -r, --rfkill
              Show radio device data.

       -s, --system
              Show system information.

       -t, --temp
              Show temperatures and fan speed.

       -u, --usb
              Show USB device data.

       -w, --warn
              Show warnings.

       -P, --pev
              Monitor power supply udev events.

       --psup Show power supply diagnostic.

       -T, --trace
              Show trace output.

       -v, --verbose
              Be more verbose.

       -- PARAM=value ...
              Add parameters to temporarily overwrite the system configuration (for this program invo‐
              cation only).

FILES
       /etc/default/tlp
              System configuration file containing all power saving settings.

SEE ALSO
       tlp(8).

AUTHOR
       (c) 2018 Thomas Koch <linrunner at gmx.net>

TLP 1.2                                       2018-12-16                                   tlp-stat(8)
