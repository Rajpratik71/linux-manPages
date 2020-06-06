ON_AC_POWER(1)                                                                           General Commands Manual                                                                           ON_AC_POWER(1)

NAME
       on_ac_power - test whether computer is running on AC power

SYNOPSIS
       on_ac_power

DESCRIPTION
       on_ac_power checks whether the system is running on AC power (i.e., mains power) as opposed to battery power.

OPTIONS
       None.

EXIT STATUS
       0 (true)  System is on mains power
       1 (false) System is not on mains power
       255 (false)    Power status could not be determined

FILES
       /proc/apm         APM status information file
       /proc/acpi        ACPI status information directory

AUTHOR
       This manual page was written by Steve Dodd <steved@loth.demon.co.uk> and was updated by Thomas Hood.

                                                                                               9 March 2002                                                                                ON_AC_POWER(1)
