ACPI_AVAILABLE(1)                                                                        General Commands Manual                                                                        ACPI_AVAILABLE(1)

NAME
       acpi_available - test whether ACPI subsystem is available

SYNOPSIS
       acpi_available

DESCRIPTION
       acpi_available checks whether the ACPI ("Advanced Configuration and Power Interface") subsystem is available, as evidenced by the presence of the /proc/acpi directory.

OPTIONS
       None.

EXIT STATUS
       0 (true)       ACPI subsystem is available
       1 (false)      ACPI subsystem is not available
       2              usage error (arguments supplied)

FILES
       /proc/acpi        ACPI status information file

AUTHOR
       This manual page was written by Thomas Hood <jdthood@yahoo.co.uk>.

                                                                                                2006-01-03                                                                              ACPI_AVAILABLE(1)
