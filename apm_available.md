APM_AVAILABLE(1)                                              General Commands Manual                                             APM_AVAILABLE(1)

NAME
       apm_available - test whether APM subsystem is available

SYNOPSIS
       apm_available

DESCRIPTION
       apm_available  checks  whether  the APM ("Advanced Power Management") subsystem is available, as evidenced by the presence of the /proc/apm
       file.

OPTIONS
       None.

EXIT STATUS
       0 (true)       APM subsystem is available
       1 (false)      APM subsystem is not available
       2              usage error (arguments supplied)

FILES
       /proc/apm         APM status information file

AUTHOR
       This manual page was written by Thomas Hood <jdthood@yahoo.co.uk>.

                                                                    2006-01-03                                                    APM_AVAILABLE(1)
