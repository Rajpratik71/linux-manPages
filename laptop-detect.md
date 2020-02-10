laptop-detect(8)                                                                      System administration commands                                                                     laptop-detect(8)

NAME
       laptop-detect - attempt to detect a laptop

SYNOPSIS
       laptop-detect [-h|--help|-v|--verbose|-V|--version]

DESCRIPTION
       Laptop-detect attempts to determine whether it is being run on a laptop or a desktop and appraises its caller of this.

OPTIONS
       -h --help
              Output help information and exit.

       -v --verbose
              be verbose (messages go to STDOUT)

       -V --version
              Output version information and exit.

EXIT STATUS
       0    most likely running on a laptop
       1    most likely NOT running on a laptop
       2    usage error (arguments supplied)

FILES
       /proc/acpi/battery
       /proc/pmu/info

AUTHORS
       Franklin PIAT <fpiat@bigfoot.com>

SEE ALSO
       dmidecode(8)

Franklin PIAT                                                                                      0.12                                                                                  laptop-detect(8)
