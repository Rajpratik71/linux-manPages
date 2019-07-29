LAPTOP-DETECT(1)                                                                             User Commands                                                                            LAPTOP-DETECT(1)

NAME
       laptop-detect - attempt to detect a laptop

SYNOPSIS
       laptop-detect [-h|--help|-v|--verbose|-V|--version|-D|--debug]

DESCRIPTION
       Laptop-detect attempts to determine whether it is being run on a laptop or a desktop and appraises its caller of this.

OPTIONS
       -h --help
              Output help information and exit.

       -v --verbose
              be verbose (messages go to STDOUT)

       -V --version
              Output version information and exit.

       -D --debug
              Debug mode.

EXIT STATUS
       0    most likely running on a laptop
       1    most likely NOT running on a laptop
       2    usage error (arguments supplied)

FILES
       /proc/acpi/battery
       /proc/pmu/info
       /dev/mem
       /sys/devices/virtual/dmi/id/chassis_type
       /sys/class/power_supply/*/type
       /proc/apm

SEE ALSO
       dmidecode(8)

laptop-detect 0.14                                                                            March 2017                                                                              LAPTOP-DETECT(1)
